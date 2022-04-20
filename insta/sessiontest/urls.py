from django.contrib import admin
from django.urls import include, path
from . import views

app_name = 'sessiontest'
urlpatterns = [
    path('', views.index, name='index'),
    # path('test/', views.test, name='test'),
    path('result/', views.result, name='result'),
]

