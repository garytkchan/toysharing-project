from django.shortcuts import render, redirect, get_object_or_404
# requires user login before creating products
from django.contrib.auth.decorators import login_required
from .models import Toys, Make
from django.utils import timezone
from django.db.models import Q # new

def home(request):
    toys = Toys.objects
    return render(request, 'toys/home.html', {'toys': toys})

@login_required(login_url="/accounts/signup")
def create(request):
     if request.method == 'POST':
        if request.POST['title'] and request.POST['makeName'] and request.POST['description'] and request.FILES['picture']:
            # instantiate Toys() object
            toy = Toys()
            toy.title = request.POST['title']
            # drop down list in create.html to choose between Makes
            if request.POST['makeName'] == 'Mezco':
                toy.makeName = Make.objects.get(makeName="Mezco")
            elif request.POST['makeName'] == 'Mafex':
                toy.makeName = Make.objects.get(makeName="Mafex")
            elif request.POST['makeName'] == 'Kaiyodo':
                toy.makeName = Make.objects.get(makeName="Kaiyodo")
            elif request.POST['makeName'] == 'S.H. Figuarts':
                toy.makeName = Make.objects.get(makeName="S.H. Figuarts")
            else:
                toy.makeName = Make.objects.get(makeName="Others")
            toy.description = request.POST['description']
            toy.picture = request.FILES['picture']
            toy.post_date = timezone.datetime.now()
            toy.owner_id = request.user.id
            toy.save()
            return redirect('/toys/' + str(toy.id))
        else:
            return render(request, 'toys/create.html',{'error':'All fields are required.'})
     else:
        return render(request, 'toys/create.html')

def detail(request, toy_id):
    toy = get_object_or_404(Toys, pk=toy_id)
    return render(request, 'toys/detail.html', {'toy': toy})

@login_required(login_url="/accounts/signup")
def upvote(request, toy_id):
    if request.method == 'POST':
        toy = get_object_or_404(Toys, pk=toy_id)
        toy.votes_total += 1
        toy.save()
        return redirect('/toys/' + str(toy.id))

def search_toy(request):
    query = request.GET.get('search_toy')
    toys = Toys.objects.filter(Q(title__icontains=query) | Q(description__icontains=query) | Q(post_date__icontains=query) | Q(makeName__makeName__icontains=query))
    return render(request, 'toys/home.html', {'toys': toys})


@login_required(login_url="/accounts/signup")
def my_toy(request):
    user = request.user
    ownerID = user.id
    toys = Toys.objects.filter(owner__id=ownerID)
    return render(request, 'toys/home.html', {'toys': toys})

@login_required(login_url="/accounts/signup")
def searchUserToy(request, userID):
    toys = Toys.objects.get(owner__id=userID)
    return render(request, 'toys/home.html', {'toys': toys})
