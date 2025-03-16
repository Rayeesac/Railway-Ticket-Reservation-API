from django.db import models
from django.contrib.auth.models import User

class Passenger(models.Model):

    GENDER_CHOICES = [
        ('M', 'Male'),
        ('F', 'Female')
    ]

    name = models.CharField(max_length=100)
    age = models.IntegerField()
    gender = models.CharField(max_length=10, choices=GENDER_CHOICES)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
    is_child = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.name} ({self.age} yrs)"

class Ticket(models.Model):

    STATUS_CHOICES = [
        ('CONFIRMED', 'Confirmed'),
        ('RAC', 'RAC'),
        ('WAITLIST', 'Waiting List'),
        ('CANCELLED', 'Cancelled')
    ]
    BERTH_CHOICES = [
        ('LOWER', 'Lower'),
        ('MIDDLE', 'Middle'),
        ('UPPER', 'Upper'),
        ('SIDE-LOWER', 'Side Lower')
    ]

    passenger = models.ForeignKey(Passenger, on_delete=models.CASCADE)
    berth_type = models.CharField(max_length=20, choices=BERTH_CHOICES, null=True, blank=True)
    status = models.CharField(max_length=15, choices=STATUS_CHOICES, default='WAITLIST')
    booking_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.passenger.name} - {self.status}"