"""
Serializers for Passenger and Ticket models.
"""

from rest_framework import serializers
from .models import Passenger, Ticket

# Passenger Serializer
class PassengerSerializer(serializers.ModelSerializer):
    """Serializer for the Passenger model."""

    class Meta:
        model = Passenger
        fields = "__all__"

# Ticket Serializer
class TicketSerializer(serializers.ModelSerializer):
    """
    Serializer for the Ticket model.
    Includes nested Passenger data for readability.
    """
    passenger = PassengerSerializer(write_only=True)  # Only accept input, prevent redundant output

    class Meta:
        model = Ticket
        fields = "__all__"

    def create(self, validated_data):
        """
        Handles nested Passenger creation inside Ticket.
        """
        passenger_data = validated_data.pop("passenger")
        passenger = Passenger.objects.create(**passenger_data)
        ticket = Ticket.objects.create(passenger=passenger, **validated_data)
        return ticket
