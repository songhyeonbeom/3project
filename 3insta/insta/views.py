from django.shortcuts import render
from .models import Photo

# Create your views here.


def index(request):
    photos = Photo.objects.all().order_by('-pk')
    
    return render(request, 'insta/index.html', {'photos' : photos })