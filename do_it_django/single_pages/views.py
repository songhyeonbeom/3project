from django.shortcuts import render
from blog.models import Post
# Create your views here.
from django.core.paginator import EmptyPage, InvalidPage, Paginator


def landing(request):
    recent_posts = Post.objects.order_by('-pk')[:3]
    return render(request, 'single_pages/landing.html', {'recent_posts': recent_posts, })


# def about_me(request):
#     return render(request, 'single_pages/about_me.html')


def about_me(request, c_slug=None):
    print('111111111888888888888881')


    c_page = None
    
    posts_list = None
    if c_slug==None:
        print('111111111111111111111')
        allphoto = request.user.id
        posts_list = Post.objects.filter(author_id=allphoto) & Post.objects.order_by('-created_at')
    paginator = Paginator(posts_list, 6)
    try:
        print('3333333333333333333333333333')
        page = int(request.GET.get('page', 1))
    except:
        print('4444444444444444444444444')
        page = 1
    try:
        print('555555555555555555555555555555555555')
        posts = paginator.page(page)
    except(EmptyPage, InvalidPage):
        print('66666666666666666666666666')
        posts = paginator.page(paginator.num_pages)

    return render(request, 'single_pages/about_me.html', {'category':c_page, 'posts': posts})







