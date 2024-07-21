from django.contrib import admin
from .models import Car

@admin.register(Car)
class CarAdmin(admin.ModelAdmin):
    list_display = ('make', 'year', 'price', 'seating_capacity', 'transmission', 'miles', 'rating')
    list_filter = ('make', 'year', 'transmission', 'rating')
    search_fields = ('make', 'year', 'transmission')
