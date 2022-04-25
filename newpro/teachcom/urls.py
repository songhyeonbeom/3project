from django.urls import path
from django.contrib.auth import views as auth_views
from teachcom import views

app_name = 'teachcom'

urlpatterns = [
    path('login/', auth_views.LoginView.as_view(template_name='teachcom/login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('signup/', views.signup, name='signup'),
]