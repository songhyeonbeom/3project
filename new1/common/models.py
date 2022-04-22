from django.db import models
from django.contrib import auth
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

# Create your models here.


class Profile(models.Model):
    user = models.OneToOneField(auth.models.User, on_delete=models.CASCADE, related_name='profile')
    bio = models.TextField(max_length=300, blank=True)





@receiver(post_save, sender=auth.models.User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

@receiver(post_save, sender=auth.models.User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()