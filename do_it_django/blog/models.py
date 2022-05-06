from re import T
from django.db import models

# Create your models here.


class Post(models.Model):
    title = models.CharField(max_length=30)
    content = models.TextField()
    
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return f'[{self.pk}]{self.title}'
        #return '{}'.format(self.title)

    
    def get_absolute_url(self):
        return '/blog/{}'.format(self.pk)
        #return f'/blog/{self.pk}/'









