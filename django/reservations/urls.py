"""
URL configuration for railway ticket reservation system.

This module defines API endpoints for booking, canceling, and retrieving ticket details.
"""

from django.urls import path
from .views import (
    BookTicketView,
    CancelTicketView,
    BookedTicketsView,
    AvailableTicketsView,
)

# Define URL patterns for ticket-related API operations
urlpatterns = [
    path("tickets/book/", BookTicketView.as_view(), name="book-ticket"),
    path("tickets/cancel/<int:pk>/", CancelTicketView.as_view(), name="cancel-ticket"),
    path("tickets/booked/", BookedTicketsView.as_view(), name="booked-tickets"),
    path("tickets/available/", AvailableTicketsView.as_view(), name="available-tickets"),
]