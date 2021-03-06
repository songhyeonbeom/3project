from re import T
from django.db import models
from django.contrib.auth.models import User
from markdownx.models import MarkdownxField
from markdownx.utils import markdown
import os
from imagekit.models import ImageSpecField
from imagekit.processors import ResizeToFill


# Create your models here.

class Tag(models.Model):
    name = models.CharField(max_length=50)
    slug = models.SlugField(max_length=200, unique=True, allow_unicode=True)
    
    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return f'/blog/tag/{self.slug}/'


class Category(models.Model):
    name = models.CharField(max_length=50, unique=True)
    slug = models.SlugField(max_length=200, unique=True, allow_unicode=True)
    author = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    
    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return f'/blog/category/{self.slug}/'

    class Meta:
        verbose_name_plural = 'Categories'



class Post(models.Model):
    title = models.CharField(max_length=30, blank=True)
    hook_text = models.CharField(max_length=100, blank=True)
    content = models.TextField(blank=True)
    
    image = models.ImageField(upload_to='blog/images/%Y/%m/%d/', blank=True)
    image_thumbnail = ImageSpecField(source= 'image', processors= [ResizeToFill(380, 380)])
    
    file_upload = models.FileField(upload_to='blog/files/%Y/%m/%d/', blank=True)
    
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    author = models.ForeignKey(User, null=True, on_delete=models.SET_NULL)
    
    category = models.ForeignKey(Category, null=True, blank=True, on_delete=models.SET_NULL)
    
    tags = models.ManyToManyField(Tag, blank=True)
    
    def __str__(self):
        return f'[{self.pk}]{self.title} :: {self.author}'
        #return '{}'.format(self.title)

    
    def get_absolute_url(self):
        return '/blog/{}/'.format(self.pk)
        # return f'/blog/{self.pk}/'


    def get_file_name(self):
        return os.path.basename(self.file_upload.name)
        

    def get_file_ext(self):
        return self.get_file_name().split('.')[-1]

    def get_content_markdown(self):
        return markdown(self.content)

    def get_avatar_url(self):
        if self.author.socialaccount_set.exists():
            return self.author.socialaccount_set.first().get_avatar_url()
        else:
            return f'https://doitdjango.com/avatar/id/1013/0b6b5c1fe5cb5275/svg/{self.author.email}'
    
    def get_modal_url(self):
        return '/allphoto/{}/'.format(self.pk)
    
         
    
class Comment(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)
    
    def get_avatar_url(self):
        if self.author.socialaccount_set.exists():
            return self.author.socialaccount_set.first().get_avatar_url()
        else:
            return f'https://doitdjango.com/avatar/id/1013/0b6b5c1fe5cb5275/svg/{self.author.email}'
    
    def __str__(self):
        return f'{self.author}::{self.content}'

    def get_absolute_url(self):
        return f'{self.post.get_absolute_url()}#comment-{self.pk}'
