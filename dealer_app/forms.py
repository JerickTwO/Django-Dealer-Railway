from django import forms
from .models import Car

class CarForm(forms.ModelForm):
    class Meta:
        model = Car
        fields = ['make', 'year', 'image', 'price', 'seating_capacity', 'transmission', 'miles', 'rating']