from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.db import transaction




@login_required
@transaction.atomic
def update_profile(request):
    if request.method == 'POST':
        user_form = UserCreateForm(request.POST, instance=request.user)
        profile_form = ProfileForm(request.POST, instance=request.user.profile)
        if user_form.is_valid() and profile_form.is_valid():
            user_form.save()
            profile_form.save()
            messages.success(request, 'Your profile was successfully updated!')
            return redirect('accounts:login')
        else:
            messages.error(request, 'Please correct the error below.')
    else:
        user_form = UserCreateForm(instance=request.user)
        profile_form = ProfileForm(instance=request.user.profile)
    return render(request, 'accounts/update_profile.html', {
        'user_form': user_form,
        'profile_form': profile_form
    })