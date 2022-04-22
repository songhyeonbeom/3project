from django.contrib import admin
from django.urls import path, include
from common import views



urlpatterns = [
    path('admin/', admin.site.urls),
    path('common/', include('common.urls')),
    # path('', views.index, name='index'),
    path("profile/update_profile", views.update_profile, name="update_profile"),
]
