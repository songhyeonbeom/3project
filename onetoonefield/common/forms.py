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
    birth_date = forms.DateField(label="생일")
    gender = forms.CharField(label="성별1")
    gender2 = forms.CharField(label="성별2")



    # position_choices=[
    #     (None, '선택'),
    #     ('개발', '개발'),
    #     ('기획', '기획'),
    #     ('디자인', '디자인'),
    # ]
    position = forms.ChoiceField(label="내가 선택한 포지션은 ", choices=position_choices, required=True)


    class Meta:
        model = Profile
        fields = ("address", "phone", "birth_date", "gender2")
