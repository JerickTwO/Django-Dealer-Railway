from django.shortcuts import render
from .models import Car

def index(request):
    cars = Car.objects.all()
    return render(request, 'index.html', {'cars': cars})

def rent(request):
    cars = Car.objects.all()            
    return render(request, 'rent.html', {'cars': cars})

def about(request):
    cars = Car.objects.all()
    return render(request, 'about.html', {'cars': cars})

def contact(request):
    return render(request, 'contact.html')
