from django.shortcuts import render

def index(request):
    return render(request, 'index.html')

def rent(request):            
    return render(request, 'rent.html')

def about(request):
    return render(request, 'about.html')

def contact(request):
    return render(request, 'contact.html')
