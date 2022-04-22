from django.contrib.auth.models import User
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver


# Create your models here.


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    # user model 과 1:1 의 관계임을 나타냄
    birth_date = models.DateField(verbose_name='birth_date', blank=True, null=True, ) # 생년월일
    gender = models.IntegerField(verbose_name='gender', null=True, ) # 성별


# @receiver(post_save, sender=User)
# def create_user_profile(sender, instance, created, **kwargs):
#     if created:
#         Profile.objects.create(user=instance)
#
#
# @receiver(post_save, sender=User)
# def save_user_profile(sender, instance, **kwargs):
#     instance.profiel.save()
#
#






# 주소
# 핸드폰

