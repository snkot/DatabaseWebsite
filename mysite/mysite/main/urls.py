from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='home'),
    path('project-dashboard', views.dashboard, name='dashboard'),
    path('donate', views.donate, name='donate'),
]
