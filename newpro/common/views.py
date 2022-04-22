
from django.contrib.auth import authenticate, login
from django.shortcuts import render, redirect
from common.forms import UserForm, ProfileForm





def signup(request):
    """
    계정생성
    """
    if request.method == "POST":
        user_form = UserForm(request.POST)
        profile_form = ProfileForm(request.POST)
        if user_form.is_valid():
            user_form.save()

            profile = profile_form.save(commit=False)
            profile.user = user_form
            profile.save()

            # first_name = user_form.cleaned_data.get('first_name')
            # last_name = user_form.cleaned_data.get('last_name')

            username = user_form.cleaned_data.get('username')
            raw_password = user_form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)  # 사용자 인증
            login(request, user)  # 로그인

            return redirect('index')
    else:
        user_form = UserForm()
        profile_form = ProfileForm()
    return render(request, 'common/signup.html',
                  {'user_form': user_form, 'profile_form': profile_form})



def index(request):
    return render(request, 'common/login.html')