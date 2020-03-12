from django.urls import path, include
from . import views

urlpatterns = [
    path('create', views.create, name='create'),
    path('<int:toy_id>', views.detail, name='detail'),
    path('<int:toy_id>/upvote', views.upvote, name='upvote'),
    path('search_toy', views.search_toy, name='search_toy'),
    path('my_toy', views.my_toy, name='my_toy'),
    path('<int:userID>', views.searchUserToy, name='searchUserToy'),
]
