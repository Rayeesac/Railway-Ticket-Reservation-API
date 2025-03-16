"""
Main URL configuration for the project.

Includes:
- Authentication (JWT)
- API routes for Users and Tickets
- Browsable API login URLs
"""

from django.contrib import admin
from django.urls import path, include
from django.contrib.auth.models import User
from rest_framework import routers, serializers, viewsets
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

from reservations.models import Ticket
from reservations.serializers import TicketSerializer

# User Serializer
class UserSerializer(serializers.ModelSerializer):
    """Serializer for Django's built-in User model."""
    class Meta:
        model = User
        fields = ["url", "username", "first_name", "last_name", "email", "is_staff"]

# User ViewSet
class UserViewSet(viewsets.ModelViewSet):
    """API view for managing users."""
    queryset = User.objects.all()
    serializer_class = UserSerializer

# Ticket ViewSet
class BookViewSet(viewsets.ModelViewSet):
    """API view for managing ticket bookings."""
    queryset = Ticket.objects.all()
    serializer_class = TicketSerializer

# API Router
router = routers.SimpleRouter()  # Use SimpleRouter if you don't need a root API view
router.register(r"users", UserViewSet)
router.register(r"tickets", BookViewSet)

urlpatterns = [
    # Admin
    path("admin/", admin.site.urls),

    # Authentication & API Root
    path("api-auth/", include("rest_framework.urls", namespace="rest_framework")),
    
    # API Routes
    path("api/v1/", include("reservations.urls")),  # Reservation-related endpoints
    path("api/v1/", include(router.urls)),  # User & Ticket endpoints
    
    # JWT Authentication
    path("api/v1/token/", TokenObtainPairView.as_view(), name="token_obtain_pair"),
    path("api/v1/token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),
]