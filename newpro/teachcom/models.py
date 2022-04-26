from django.db import models

from django.contrib import auth
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver


# Create your models here.


class Profile2(models.Model):
    user = models.OneToOneField(auth.models.User, on_delete=models.CASCADE, related_name='profile2')
    birth_date = models.DateField(null=True)
    nickname = models.CharField(max_length=8, null=True)


@receiver(post_save, sender=auth.models.User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile2.objects.create(user=instance)


@receiver(post_save, sender=auth.models.User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile2.save()


