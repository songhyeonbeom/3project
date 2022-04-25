from django.contrib import admin
from django.urls import path, include
from teachcom import views



urlpatterns = [
    path('admin/', admin.site.urls),
    path('teachcom/', include('teachcom.urls')),
    path('', views.index, name='index'),
]
