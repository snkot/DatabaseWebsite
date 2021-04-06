from django.forms import ModelForm, TextInput, Textarea, NumberInput
from .models import Donations


class DonationsForm(ModelForm):
    class Meta:
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
                'placeholder': 'Project',
            }),
        }