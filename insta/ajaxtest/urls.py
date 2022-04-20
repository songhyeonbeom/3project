from django.urls import path, include
from . import views

app_name = 'ajaxtest'

urlpatterns = [
    path('', views.index, name='index'),
    path('test/', views.test, name='test'),
]










