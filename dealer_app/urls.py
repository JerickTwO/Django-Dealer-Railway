from django.urls import path
from dealer_app import views
urlpatterns = [
    path('', views.index)
]
