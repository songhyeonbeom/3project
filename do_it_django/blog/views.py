from django.shortcuts import render, redirect
from django.views.generic import ListView, DetailView, CreateView, UpdateView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import get_object_or_404
from requests import post
from .models import Post, Category, Tag, Comment
from .forms import CommentForm
from django.core.exceptions import PermissionDenied
from django.utils.text import slugify
from django.db.models import Q
from django.core.paginator import EmptyPage, InvalidPage, Paginator

# from django.shortcuts import render
# Create your views here.



class PostCreate(LoginRequiredMixin, CreateView):
    model = Post
    fields = ['content', 'image'] 
    # 모델에 있는 필드명을 입력하면 form 이 웹에 보여준다. 제목 훅테그 카테고리 파일업로드 다 필요없이
    # 간단하게 사진올리는 용으로 하고싶어서 다 지우고 내용/사진/태그 만 남겨두었다.

    # def test_func(self):
    #     return self.request.user.is_superuser or self.request.user.is_staff

    def form_valid(self, form):
        current_user = self.request.user
        if current_user.is_authenticated :
            form.instance.author = current_user
            response = super(PostCreate, self).form_valid(form)
            
            tags_str = self.request.POST.get('tags_str')
            if tags_str:
                tags_str = tags_str.replace(" ", "")    #태그 인풋 창에 넣은거 싹다 앞뒤공백 보내버리기~
                tags_str = tags_str.rstrip(',')         #알스트립 - 우측에 쉼표 보내버리기~
                tags_str = tags_str.replace(',', ';')   #쉼표는 콜론으로 바꾼당
                tags_list = tags_str.split(';')         #태그는 콜론으로 구분한당
                                                        #고로 앞의 공백자체가 아에 나오지 않는다. 행복하다 개그튼 유니크공백 하... 저 한줄이 뭐라고 빡치게 만든다
                                                        #개발자의 길은 멀고도 험하구나....
                print(tags_list)
                for t in tags_list:
                    t = t.strip()
                    print(t)
                    
                    tag, is_tag_created = Tag.objects.get_or_create(name=t)
                    print(tag, is_tag_created)
                        
                    if is_tag_created:
                        tag.slug = slugify(t, allow_unicode=True)
                        tag.save()
                    self.object.tags.add(tag)

            return response

        else:
            return redirect('/blog/')

class PostList(ListView):
    model = Post
    ordering = '-pk'
    paginate_by = 5

    def get_context_data(self, **kwargs):
        context = super(PostList, self).get_context_data()
        context['categories'] = Category.objects.all()
        context['no_category_post_count'] = Post.objects.filter(category= None).count()
        return context
    

class PostDetail(DetailView):
    model = Post

    def get_context_data(self, **kwargs):
        context = super(PostDetail, self).get_context_data()
        context['categories'] = Category.objects.all()
        context['no_category_post_count'] = Post.objects.filter(category= None).count()
        context['comment_form'] = CommentForm
        return context


class PostUpdate(LoginRequiredMixin, UpdateView):
    model = Post
    fields = ['title', 'hook_text', 'content', 'image', 'file_upload', 'category', 'tags']

    template_name = 'blog/post_update_form.html'

    def get_context_data(self, **kwargs):
        context = super(PostUpdate, self).get_context_data()
        if self.object.tags.exists():
            tags_str_list = list()
            for t in self.object.tags.all():
                tags_str_list.append(t.name)
            context['tags_str_default'] = '; '.join(tags_str_list)
            
        return context

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and request.user == self.get_object().author:
            return super(PostUpdate, self).dispatch(request, *args, **kwargs)
        else:
            raise PermissionDenied

    def form_valid(self, form):
        response = super(PostUpdate, self).form_valid(form)
        self.object.tags.clear()
        
        tags_str = self.request.POST.get('tags_str')
        if tags_str:
            
            tags_str = tags_str.replace(" ", "")
            print(tags_str)
            tags_str = tags_str.rstrip(',')
            print(tags_str)
            tags_str = tags_str.replace(',', ';')
            print(tags_str)
            tags_list = tags_str.split(';')  
            print(tags_list)
            
            for t in tags_list:
                t = t.strip()
                tag, is_tag_created = Tag.objects.get_or_create(name=t)
                if is_tag_created:
                    tag.slug = slugify(t, allow_unicode=True)
                    tag.save()
                self.object.tags.add(tag)
                
        return response



def category_page(request, slug):
    if slug == 'no_category':
        category = '미분류'
        post_list = Post.objects.filter(category=None)
    else:
        category = Category.objects.get(slug=slug)
        post_list = Post.objects.filter(category=category)
        
    return render(
        request,
        'blog/post_list.html',
        {
            'post_list' : post_list,
            'categories' : Category.objects.all(),
            'no_category_post_count' : Post.objects.filter(category=None).count(),
            'category' : category,
        }
    )


def tag_page(request, slug):
    tag = Tag.objects.get(slug=slug)
    post_list = tag.post_set.all()
    
    return render(
        request,
        'blog/post_list.html',
        {
            'post_list' : post_list,
            'tag' : tag,
            'categories' : Category.objects.all(),
            'no_category_post_count' : Post.objects.filter(category=None).count(),
        }
    )


def new_comment(request, pk):
    if request.user.is_authenticated:
        post = get_object_or_404(Post, pk=pk)
        
        if request.method == 'POST':
            comment_form = CommentForm(request.POST)
            if comment_form.is_valid():
                comment = comment_form.save(commit=False)
                comment.post = post
                comment.author = request.user
                comment.save()
                return redirect(comment.get_absolute_url())
        else:
            return redirect(post.get_absolute_url())
    else:
        raise PermissionDenied


class CommentUpdate(LoginRequiredMixin, UpdateView):
    model = Comment
    form_class = CommentForm
    
    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and request.user == self.get_object().author:
            return super(CommentUpdate, self).dispatch(request, *args, **kwargs)
        else:
            raise PermissionDenied



def delete_comment(request, pk):
    comment = get_object_or_404(Comment, pk=pk)
    post = comment.post
    if request.user.is_authenticated and request.user == comment.author:
        comment.delete()
        return redirect(post.get_absolute_url())
    else:
        raise PermissionDenied


def delete_comment(request, pk):
    comment = get_object_or_404(Comment, pk=pk)
    post = comment.post
    if request.user.is_authenticated and request.user == comment.author:
        comment.delete()
        return redirect(post.get_absolute_url())
    else:
        raise PermissionDenied



class PostSearch(PostList):
    paginate_by = None
    
    def get_queryset(self):
        q = self.kwargs['q']
        post_list = Post.objects.filter(
            Q(title__contains=q) | Q(tags__name__contains=q)
        ).distinct()
        return post_list
    
    def get_context_data(self, **kwargs):
        context = super(PostSearch, self).get_context_data()
        q = self.kwargs['q']
        context['search_info'] = f'Search: {q} ({self.get_queryset().count()})'
        
        return context



def allphoto(request, c_slug=None):
    c_page = None
    posts_list = None
    if c_slug != None:
        c_page = get_object_or_404(Category, slug = c_slug)
        posts_list = Post.objects.filter(category = c_page).order_by('-created_at')
    else:
        posts_list = Post.objects.order_by('-created_at')
    paginator = Paginator(posts_list, 12)

    try:
        page = int(request.GET.get('page', 1))
    except:
        page = 1
    try:
        posts = paginator.page(page)
    except(EmptyPage, InvalidPage):
        posts = paginator.page(paginator.num_pages)

    print('7777777777777777777')
    return render(request, 'blog/album.html', {'category':c_page, 'posts':posts})





