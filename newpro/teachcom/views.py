


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
            profile2 = Profile2.objects.filter(user_id=int(user.id)).\
                update(birth_date=request.POST.get('birth_date'),
                       nickname=request.POST.get('nickname'))
            # print("dddddddddda ", profile2.user)
            # print("ddddddddddb ", profile2.birth_date)
            # print("ddddddddddc ", profile2.nickname)
            # profile2.save()
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
    return render(request, 'teachcom/signup.html',
                  {'user_form': user_form, 'profile_form': profile_form})






def index(request):
    return render(request, 'teachcom/login.html')


