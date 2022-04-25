from django.shortcuts import render

# Create your views here.
from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from teachcom.forms import UserForm, ProfileForm
from teachcom.models import Profile2


def signup(request):
    if request.method == "POST":
        user_form = UserForm(data=request.POST)
        profile_form = ProfileForm(data=request.POST)
        print("000000000000000:", user_form.is_valid() , profile_form.is_valid())
        if user_form.is_valid() and profile_form.is_valid():
            user = user_form.save(commit=False)
            user.save()
            print("5555 ", user.id)
#            profile = Profile(user_id=user.id, rank=request.POST.get('rank'), sq=request.POST.get('sq'),name = request.POST.get('name') )
            profile = Profile2.objects.filter(user_id=int(user.id)).update(rank=request.POST.get('rank'), sq=request.POST.get('sq'),name = request.POST.get('name') )
            print("dddddddddda ", profile.user)
            print("ddddddddddb ", profile.rank)
            print("ddddddddddc ", profile.sq)
            print("ddddddddddd ", profile.name)
            profile.save()
            registered = True
            #
            # print(profile)

            # user_form.save()
            # profile_form.save(commit=True)

            username = user_form.cleaned_data.get('username')
            raw_password = user_form.cleaned_data.get('password1')

            user = authenticate(username=username, password=raw_password)


            login(request, user)
            return redirect('index')
        else:
            print(user_form.errors, profile_form.errors)
    else:
        user_form = UserForm()
        profile_form = ProfileForm()
    return render(request, 'custom_auth/signup.html',
                  {'user_form': user_form, 'profile_form': profile_form})