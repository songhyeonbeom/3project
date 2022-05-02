from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.paginator import EmptyPage, InvalidPage, Paginator
from django.shortcuts import render, get_object_or_404, redirect

# Create your views here.
from django.urls import reverse_lazy
from django.views.generic import ListView, DetailView, CreateView

from insta.forms import PhotoInlineFormSet
from insta.models import Photo, Album




class PhotoCV(LoginRequiredMixin, CreateView, ):
    model = Photo

    login_url = '/common/login/'
    redirect_field_name = 'login'

    fields = ('album', 'image', 'description',)

    success_url = reverse_lazy('insta:allPhotoAB')

    def form_valid(self, form):
        form.instance.owner = self.request.user
        return super().form_valid(form)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form'].fields['album'].queryset = Album.objects.filter(owner=self.request.user)
        return context






class AlbumPhotoCV(LoginRequiredMixin, CreateView, ):
    model = Album

    login_url = '/common/login/'
    redirect_field_name = 'login'

    fields = ('name', 'slug',)
    success_url = reverse_lazy('insta:allPhotoAB')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        if self.request.POST:
            context['formset'] = PhotoInlineFormSet(self.request.POST, self.request.FILES)
        else:
            context['formset'] = PhotoInlineFormSet()
        return context

    def form_valid(self, form):
        form.instance.owner = self.request.user
        context = self.get_context_data()
        formset = context['formset']
        for photoform in formset:
            photoform.instance.owner = self.request.user
        if formset.is_valid():
            self.object = form.save()
            formset.instance = self.object
            formset.save()
            return redirect(self.get_success_url())
        else:
            return self.render_to_response(self.get_context_data(form=form))





# 손봐야될 부분
def myPhotoAB(request, c_slug=None):
    c_page = None
    photos_list = None
    if c_slug != None:
        print('111111111111111111111')
        c_page = get_object_or_404(Album, slug = c_slug)
        photos_list = Photo.objects.filter(album = c_page).order_by('-upload_dt')
    else:
        print('222222222222222222222')
        photos_list = Photo.objects.all().order_by('-upload_dt')
    paginator = Paginator(photos_list, 12)
    try:
        print('3333333333333333333333333333')
        page = int(request.GET.get('page', 1))
    except:
        print('4444444444444444444444444')
        page = 1
    try:
        print('555555555555555555555555555555555555')
        photos = paginator.page(page)
    except(EmptyPage, InvalidPage):
        print('66666666666666666666666666')
        photos = paginator.page(paginator.num_pages)

    return render(request, 'insta/myalbum.html', {'album': c_page, 'photos': photos})




def allPhotoAB(request, c_slug=None):
    c_page = None
    photos_list = None
    if c_slug != None:
        c_page = get_object_or_404(Album, slug = c_slug)
        photos_list = Photo.objects.filter(album = c_page).order_by('-upload_dt')
    else:
        photos_list = Photo.objects.order_by('-upload_dt')
    paginator = Paginator(photos_list, 12)

    try:
        page = int(request.GET.get('page', 1))
    except:
        page = 1
    try:
        photos = paginator.page(page)
    except(EmptyPage, InvalidPage):
        photos = paginator.page(paginator.num_pages)

    print('44444444444444444444444444')
    return render(request, 'insta/album.html', {'album':c_page, 'photos':photos})















class AlbumLV(ListView):
    model = Album


class AlbumDV(DetailView):
    model = Album


class PhotoDV(DetailView):
    model = Photo


class PhotoChangeLV(LoginRequiredMixin, ListView):
    model = Photo
    template_name = 'insta/photo_change_list.html'

    def get_queryset(self):
        return Photo.object.filter(owner=self.request.user)














