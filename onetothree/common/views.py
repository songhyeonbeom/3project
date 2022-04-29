from django.contrib import messages
from django.contrib.auth.models import User
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from common.forms import UserForm, ProfileForm
from common.models import Profile
from django.views.decorators.csrf import csrf_exempt

# Create your views here.

@csrf_exempt
def signup(request):
    if request.method == "POST":
        user_form = UserForm(data=request.POST)
        profile_form = ProfileForm(data=request.POST)

        print(request.POST.get('gender2'))
        print(request.POST.get('phone'))
        print(user_form.is_valid(), profile_form.is_valid())

        if user_form.is_valid() and profile_form.is_valid():
            print(request.POST.get('first_name'))

            phone=profile_form.cleaned_data['phone']


            print(request.POST.get('phone'))





            user = user_form.save(commit=False)
            user.save()

            messages.success(request, '성공적!!')

            profile = Profile.objects.filter(user_id=int(user.id)). \
                update(birth_date=request.POST.get('birth_date'),
                       phone=request.POST.get('phone'),
                       gender2=request.POST.get('gender2'),

                       # gender=request.POST.get('gender'),
                       # gender3=request.POST.get('gender3'),
                       # position=request.POST.get('position'),


                       postcode=request.POST.get('postcode'),
                       roadAddress=request.POST.get('roadAddress'),
                       jibunAddress=request.POST.get('jibunAddress'),
                       detailAddress=request.POST.get('detailAddress'),
                       extraAddress=request.POST.get('extraAddress')

                       )




            registered = True

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

    return render(request, 'common/signup.html',
                  {'user_form': user_form, 'profile_form': profile_form})


def index(request):
    return render(request, 'common/login.html')





def id_overlap_check(request):
    username = request.GET.get('username')
    print(username)
    try:
        # 중복 검사 실패
        user = User.objects.get(username=username)
    except:
        # 중복 검사 성공
        user = None
    if user is None:
        overlap = "pass"
    else:
        overlap = "fail"
    context = {'overlap': overlap}
    return JsonResponse(context)


