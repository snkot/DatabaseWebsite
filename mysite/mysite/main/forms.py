from django.forms import ModelForm, TextInput, Textarea, NumberInput, DateTimeInput
from .models import Donations
from datetime import datetime


class DonationsForm(ModelForm):
    class Meta:
        default_date = datetime.now()
        model = Donations
        fields = ["sum", "comment", "idproject"]
        widgets = {"sum": NumberInput(attrs={
            'class': 'form-control',
            'placeholder': 'Sum',
            }),
            "comment": Textarea(attrs={
                'class': 'form-control',
                'placeholder': 'Comment',
            }),
            "idproject": NumberInput(attrs={
                'class': 'form-control',
                'placeholder': 'idProject: 15-24',
            }),
        }