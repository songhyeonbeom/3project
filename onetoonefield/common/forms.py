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
    phone = forms.CharField(label="핸드폰")
    birth_date = forms.DateField(label="생년월일")
    gender = forms.CharField(label="성별1")
    gender2 = forms.CharField(label="성별2")

    gender3 = forms.ChoiceField(label="성별3 테스트 입니다 ", choices=Profile.gender3_choices, required=True)
    position = forms.ChoiceField(label="초이스 연습중 테스트 ", choices=Profile.position_choices, required=True)


    class Meta:
        model = Profile
        fields = ("address", "phone", "birth_date", "gender2")
