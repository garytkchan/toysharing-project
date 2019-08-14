from django.shortcuts import render, redirect, get_object_or_404
# requires user login before creating products
from django.contrib.auth.decorators import login_required
from .models import Toys, Make, Comic
from django.utils import timezone

def home(request):
    toys = Toys.objects
    return render(request, 'toys/home.html', {'toys': toys})

@login_required(login_url="/accounts/signup")
def create(request):
     if request.method == 'POST':
        if request.POST['title'] and request.POST['make_name'] and request.POST['comic_name'] and request.POST['description'] and request.POST['rating'] and request.FILES['picture']:
            # instantiate Toys() object
            toy = Toys()
            toy.title = request.POST['title']
            # drop down list in create.html to choose between Makes
            if request.POST['make_name'] == 'Mezco':
                toy.make_name = Make.objects.get(make_name="Mezco")
            elif request.POST['make_name'] == 'Mafex':
                toy.make_name = Make.objects.get(make_name="Mafex")
            elif request.POST['make_name'] == 'Kaiyodo':
                toy.make_name = Make.objects.get(make_name="Kaiyodo")
            elif request.POST['make_name'] == 'S.H. Figuarts':
                toy.make_name = Make.objects.get(make_name="S.H. Figuarts")
            else:
                toy.make_name = Make.objects.get(make_name="Others")

            toy.comic_name = Comic.objects.get(comic_name="Marvel")
            toy.description = request.POST['description']
            toy.rating = request.POST['rating']
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
