from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib import auth


def signup(request):
    # User has info and wants an account now
    if request.method == 'POST':
        # confirming password from user
        if request.POST['password1'] == request.POST['password2']:
            try:
                # check if there is any user taken this name
                user = User.objects.get(username=request.POST['username'])
                return render(request, 'accounts/signup.html', {'error': 'Username is taken'})
        # No user took the name. Check: OK!
            except User.DoesNotExist:
                user = User.objects.create_user(first_name=request.POST['first_name'], username=request.POST['username'], password=request.POST['password1'], email=request.POST['emailaddress'])
                auth.login(request, user)
                return redirect('home')
        else:
            return render(request, 'accounts/signup.html', {'error': 'Password must match'})
    else:
        # User wants to enter info
        return render(request, 'accounts/signup.html')

def login(request):
    if request.method == 'POST':
        # check username matches with password
        user = auth.authenticate(username=request.POST['username'], password=request.POST['password'])
        if user is not None:
            auth.login(request, user)
            return redirect('home')
        else:
            return render(request, 'accounts/login.html', {'error': 'username or password is incorrect'})
    else:
        return render(request, 'accounts/login.html')

def logout(request):
    if request.method == 'POST':
        auth.logout(request)
        return redirect('home')
    # TODO route to homepage and log out
