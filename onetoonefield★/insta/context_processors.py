from django.core.paginator import Paginator, EmptyPage, InvalidPage

from .models import Photo, Album


def menu_links(request):
    customer = request.user.id
    print(request)
    links = Album.objects.filter(owner_id=customer)
    return dict(links = links)





def menu_links2(request, photos_list=None) :
    allphoto = request.user.id
    links2 = Photo.objects.filter(owner_id=allphoto) & Photo.objects.order_by('-upload_dt')
    # paginator = Paginator(photos_list, 12)
    # try:
    #     page = int(request.GET.get('page', 1))
    # except:
    #     page = 1
    # try:
    #     photos = paginator.page(page)
    # except(EmptyPage, InvalidPage):
    #     photos = paginator.page(paginator.num_pages)

    return dict(links2 = links2)


