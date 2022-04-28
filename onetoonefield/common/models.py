from django.db import models

# Create your models here.
from django.contrib import auth
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver


class Profile(models.Model):
    user = models.OneToOneField(auth.models.User, on_delete=models.CASCADE, related_name='profile')
    birth_date = models.DateField(null=True)  # 생년월일
    address = models.CharField(max_length=30, null=True)  # 주소
    phone = models.CharField(max_length=15, null=True)  # 핸드폰
    gender = models.CharField(max_length=5, null=True)  # 성별
    gender2 = models.CharField(max_length=3, null=True)


    gender3_choices = [ (None, '--선택--'),
                       ('남자', '남자'),
                       ('여자', '여자'),
                       ('고자', '고자'),
                       ('양성자', '양성자'),
                       ('외계인', '외계인'),]
    gender3 = models.CharField(max_length=10, choices=gender3_choices, default='--선택--', )


    position_choices = [ (None, '--선택--'),
                         ('개발', '개발'),
                         ('기획', '기획'),
                         ('디자인', '디자인'), ]
    position = models.CharField(max_length=10, choices=position_choices, default='--선택--', )





@receiver(post_save, sender=auth.models.User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)



@receiver(post_save, sender=auth.models.User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()






