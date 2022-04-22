# from django.contrib.auth import authenticate, login
# from django.contrib.auth.models import User
# from django.shortcuts import render, redirect
# from common.forms import UserForm, ProfileForm
# from common.models import Profile


from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from common.forms import UserForm, ProfileForm
from django.contrib.auth.decorators import login_required
from django.db import transaction



def signup(request):
    """
    회원가입
    """
    if request.method == "POST":
        user_form = UserForm(request.POST)
        profile_form = ProfileForm(request.POST)
        if user_form.is_valid() and profile_form.is_valid():

            user_form.save()
            profile_form.save()



            username = user_form.cleaned_data.get('username')
            raw_password = user_form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('index')
    else:
        user_form = UserForm()
        profile_form = ProfileForm()
    return render(request, 'common/signup.html',
                  {'user_form': user_form, 'profile_form': profile_form})



def index(request):
    return render(request, 'common/login.html')



