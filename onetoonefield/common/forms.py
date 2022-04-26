from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from common.models import Profile



class UserForm(UserCreationForm):
    email = forms.EmailField(label="이메일")

    class Meta:
        model = User
        fields = ("first_name", "username", "password1", "password2", "email")


class ProfileForm(forms.ModelForm):
    address = forms.CharField(label="주소")
    birth_date = forms.DateField(label="생일")
    phone = forms.CharField(label="핸드폰")


    class Meta:
        model = Profile
        fields = ("address", "phone", "birth_date")
