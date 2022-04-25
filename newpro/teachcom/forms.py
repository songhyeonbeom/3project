







from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from teachcom.models import Profile2







class UserForm(UserCreationForm):
    email = forms.EmailField(label="이메일")

    class Meta:
        model = User
        fields = ("first_name", "username", "password1", "password2", "email")


class ProfileForm(forms.ModelForm):
    birth_date = forms.DateField(label="생일")
    nickname = forms.CharField(label="닉네임", max_length=8)

    class Meta:
        model = Profile2
        fields = ("birth_date", "nickname")




