from django.urls import path, include
from django.conf.urls import url
from . import views

urlpatterns = [
    path('signup', views.signup, name='signup'),
    path('login', views.login, name='login'),
    path('logout', views.logout, name='logout'),
    path('profile', views.profile, name='profile'),
    path('editname', views.editname, name='editname'),
    url(r'^password/$', views.change_password, name='change_password'),
]
