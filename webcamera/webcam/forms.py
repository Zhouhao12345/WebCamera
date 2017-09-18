from django import forms
from models import ResUsers
from django.contrib.auth.models import User

class LoginForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput())

    class Meta:
        model = User
        fields = ('username', 'password',)

class RegisterForm(forms.ModelForm):
    class Meta:
        model = ResUsers
        fields = ('phone_number', 'about_me', 'email')