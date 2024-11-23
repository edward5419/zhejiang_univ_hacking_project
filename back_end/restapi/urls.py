from django.urls import re_path 
from restapi import views


urlpatterns = [
    re_path(r'fishing', views.login),
]