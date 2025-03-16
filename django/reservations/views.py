"""
Django REST Framework Views for Railway Ticket Reservation System.

This module contains API views for:
- Booking tickets
- Canceling tickets
- Viewing booked tickets
- Checking available tickets
"""

from django.db import transaction
from django.contrib.auth import get_user_model
from rest_framework import generics, status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.exceptions import ValidationError

from .models import Ticket, Passenger
from .serializers import TicketSerializer, PassengerSerializer


class BookTicketView(generics.CreateAPIView):
    """
    API endpoint for booking a ticket.
    
    - Ensures berth allocation based on priority rules.
    - Handles cases where tickets are unavailable.
    """
    queryset = Ticket.objects.all()
    serializer_class = TicketSerializer
    permission_classes = [IsAuthenticated]

    @transaction.atomic
    def post(self, request, *args, **kwargs):
        passenger_data = request.data.get("passenger")

        passenger_serializer = PassengerSerializer(data=passenger_data)
        if not passenger_serializer.is_valid():
            return Response(passenger_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        passenger = passenger_serializer.save(user=request.user)

        try:
            ticket = self.allocate_seat(passenger)
            return Response(TicketSerializer(ticket).data, status=status.HTTP_201_CREATED)
        except ValidationError as e:
            error_message = e.detail[0] if isinstance(e.detail, list) else str(e.detail)
            return Response({"error": error_message}, status=status.HTTP_400_BAD_REQUEST)

    def allocate_seat(self, passenger):
        """
        Allocates seats based on priority rules:
        - Elderly (60+) and women with children get priority for lower berths.
        - Children under 5 get no berth but are recorded.
        - RAC berths are assigned when confirmed seats are full.
        - If RAC is full, passengers move to the waiting list.
        """
        confirmed_tickets = Ticket.objects.filter(status="CONFIRMED")
        confirmed_count = confirmed_tickets.count()
        rac_count = Ticket.objects.filter(status="RAC").count()
        waiting_count = Ticket.objects.filter(status="WAITLIST").count()

        lower_berths_available = confirmed_tickets.filter(berth_type="LOWER").count() < 21
        upper_berths_available = confirmed_tickets.filter(berth_type="UPPER").count() < 21
        middle_berths_available = confirmed_tickets.filter(berth_type="MIDDLE").count() < 21

        # No berth for children under 5
        if passenger.age < 5:
            return Ticket.objects.create(passenger=passenger, status="NO_BERTH", berth_type="NONE")

        # Allocate Lower Berths for Priority Passengers
        if confirmed_count < 63:
            if passenger.age >= 60 or (passenger.gender == "F" and passenger.is_child):
                if lower_berths_available:
                    return Ticket.objects.create(passenger=passenger, status="CONFIRMED", berth_type="LOWER")

            # Assign Upper/Middle if no Lower is available
            if upper_berths_available:
                return Ticket.objects.create(passenger=passenger, status="CONFIRMED", berth_type="UPPER")
            elif middle_berths_available:
                return Ticket.objects.create(passenger=passenger, status="CONFIRMED", berth_type="MIDDLE")

        # Allocate RAC (9 berths, 18 passengers)
        if rac_count < 18:
            return Ticket.objects.create(passenger=passenger, status="RAC", berth_type="SIDE-LOWER")

        # Allocate Waiting List (Max 10)
        if waiting_count < 10:
            return Ticket.objects.create(passenger=passenger, status="WAITLIST")

        # No tickets available
        raise ValidationError("No tickets available")


class CancelTicketView(generics.DestroyAPIView):
    """
    API endpoint for canceling a booked ticket.
    
    - Moves RAC to Confirmed if available.
    - Moves Waiting List to RAC if applicable.
    """
    queryset = Ticket.objects.all()
    serializer_class = TicketSerializer
    permission_classes = [IsAuthenticated]

    @transaction.atomic
    def post(self, request, *args, **kwargs):
        ticket_id = kwargs.get("pk")

        try:
            ticket = Ticket.objects.get(pk=ticket_id)
            ticket.delete()

            # Move RAC to Confirmed
            self.update_ticket_status()

            return Response({"message": "Ticket canceled successfully"}, status=status.HTTP_200_OK)
        except Ticket.DoesNotExist:
            return Response({"error": "Ticket not found"}, status=status.HTTP_404_NOT_FOUND)

    def update_ticket_status(self):
        """
        Updates ticket statuses when a confirmed ticket is canceled:
        - Moves the first RAC ticket to Confirmed.
        - Moves the first Waiting List ticket to RAC.
        """
        next_rac = Ticket.objects.filter(status="RAC").first()
        if next_rac:
            next_rac.status = "CONFIRMED"
            next_rac.save()

            next_waiting = Ticket.objects.filter(status="WAITLIST").first()
            if next_waiting:
                next_waiting.status = "RAC"
                next_waiting.save()


class BookedTicketsView(generics.ListAPIView):
    """
    API endpoint to view all booked tickets along with passenger details.
    """
    queryset = Ticket.objects.all()
    serializer_class = TicketSerializer
    permission_classes = [IsAuthenticated]


class AvailableTicketsView(generics.GenericAPIView):
    """
    API endpoint to check available ticket counts.
    """
    permission_classes = [IsAuthenticated]

    def get(self, request, *args, **kwargs):
        """
        Returns available ticket counts for:
        - Confirmed (Max: 63)
        - RAC (Max: 18)
        - Waiting List (Max: 10)
        """
        available_counts = {
            "confirmed": 63 - Ticket.objects.filter(status="CONFIRMED").count(),
            "RAC": 18 - Ticket.objects.filter(status="RAC").count(),
            "waiting": 10 - Ticket.objects.filter(status="WAITLIST").count(),
        }
        return Response(available_counts, status=status.HTTP_200_OK)