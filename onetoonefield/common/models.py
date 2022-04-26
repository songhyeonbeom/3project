from django.db import models

# Create your models here.
from django.contrib import auth
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver




class Profile(models.Model):
    user = models.OneToOneField(auth.models.User, on_delete=models.CASCADE, related_name='profile')
    realname = models.TextField(max_length=15, null=True)       # 이름
    birth_date = models.DateField(null=True)                    # 생년월일
    gender = models.TextField(max_length=5, null=True)          # 성별
    address = models.TextField(max_length=30, null=True)        # 주소
    phone = models.TextField(max_length=15, null=True)          # 핸드폰


@receiver(post_save, sender=auth.models.User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=auth.models.User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()


