import json
from django.shortcuts import render
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
# Create your views here.

def index(request):

    return render(request, 'ajaxtest/index.html')

@csrf_exempt
def test(request):
    jsonObject = json.loads(request.body)
    print(jsonObject.get('title'))

    context = {
        'result' : jsonObject
    }

    return JsonResponse(context)



