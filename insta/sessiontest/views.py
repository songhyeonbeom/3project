from django.shortcuts import render

# Create your views here.
from django.shortcuts import render


def index(request):
    print(request.session.session_key)
    request.session['test'] = "hahaha"



    return render(request, 'sessiontest/index.html')


def result(request):
    session_id = request.session.session_key
    test = request.session['test']

    contents = {
        'session_id': session_id,
        'test': test
    }
    return render(request, 'sessiontest/result.html', contents)