from django.urls import path
from insta import views, vote_views





app_name = 'insta'
urlpatterns = [


    path('', views.allPhotoAB, name='allPhotoAB'),

    path('myPhotoAB/', views.myPhotoAB, name='myPhotoAB'),
    # path('<slug:c_slug>/', views.myPhotoAB, name='myPhotoAB'),

    path('<slug:c_slug>/', views.allPhotoAB, name='album_detail'),

    path('photo/<int:pk>/', views.PhotoDV.as_view(), name='photo_detail'),

    path('vote/photo/<int:photo_id>/', vote_views.vote_photo, name='vote_photo'),

    path('answer/create/<int:photo_id>/', vote_views.answer_create, name='answer_create'),

    path('photo/modify/<int:photo_id>/', vote_views.photo_modify, name='photo_modify'),
    path('photo/delete/<int:photo_id>/', vote_views.photo_delete, name='photo_delete'),

    path('answer/modify/<int:answer_id>/', vote_views.answer_modify, name='answer_modify'),

    path('answer/delete/<int:answer_id>/', vote_views.answer_delete, name='answer_delete'),

    path('photo/add/', views.PhotoCV.as_view(), name='photo_add'),

    path('album/add/', views.AlbumPhotoCV.as_view(), name='album_add'),


]



