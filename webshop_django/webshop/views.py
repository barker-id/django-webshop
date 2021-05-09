from django.shortcuts import get_object_or_404, render
from django.core import serializers

# Create your views here.
from django.http import HttpResponse

from .models import Product


def index(request):
    try:
        if request.method == 'GET':
            search_query = request.GET.get('q', '')
            sort = request.GET.get('sort', 'product_name')
            product_list = Product.objects.filter(product_name__icontains=search_query) | Product.objects.filter(product_code__icontains=search_query).order_by(sort)

        else:
            product_list = Product.objects.all()

    except:
        return HttpResponse('<p>No product was found</p>')

    latest_product_list = serializers.serialize("json", product_list)

    context = {
        'latest_product_list': latest_product_list,
    }

    return render(request, 'webshop/home.html', context)


def detail(request, product_id):
    try:
        product = Product.objects.filter(pk=product_id)
        latest_product_list = serializers.serialize("json", product)

    except:
        return HttpResponse('<p>No product was found</p>')

    context = {
        'latest_product_list': latest_product_list,
    }

    return render(request, 'webshop/detail.html', context)
