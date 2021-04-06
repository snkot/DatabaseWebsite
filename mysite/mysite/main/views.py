from django.shortcuts import render, redirect
from .forms import DonationsForm
from .models import Donations


def index(request):
    donations = Donations.objects.all
    return render(request, 'main/index.html', {'donations': Donations})

def dashboard(request):
    return render(request, 'main/dashboard.html')

def donate(request):
    if request.method == 'POST':
        form = DonationsForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('home')

    form = DonationsForm()
    context = {
        'form': form
    }
    return render(request, 'main/donate.html', context)