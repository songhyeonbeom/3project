import imp
# from django.shortcuts import render
# Create your views here.
from .models import Post
from django.views.generic import ListView, DetailView



class PostList(ListView):
    model = Post
    ordering = '-pk'
        
    # template_name = 'blog/index.html'


class PostDetail(DetailView):
    model = Post

# def index(request):
#     posts = Post.objects.all().order_by('-pk')
        
#     return render(
#         request, 'blog/index.html', {'posts': posts,}
#     )


# def single_post_page(request, pk):
#     post = Post.objects.get(pk=pk)
    
#     return render(request, 'blog/single_post_page.html', {'post': post,} )








