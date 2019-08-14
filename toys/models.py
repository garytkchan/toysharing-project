from django.db import models
from django.contrib.auth.models import User  # Django way to import user
from django.apps import apps


class Toys(models.Model):
    title = models.CharField(max_length=255)
    make_name = models.ForeignKey('Make', on_delete=models.CASCADE)
    comic_name = models.ForeignKey('Comic', on_delete=models.CASCADE)
    owner = models.ForeignKey(User, on_delete=models.CASCADE)
    description = models.CharField(max_length=255)
    picture = models.ImageField(upload_to='images/')
    post_date = models.DateTimeField()
    rating = models.IntegerField(default=1)
    votes_total = models.IntegerField(default=0)

# function to rename real blog name instead of random number blog on localhost admin
    def __str__(self):
        return self.title

    def summary(self):
        # return first 100 words from the body
        return self.description[:100]

    def pub_date_pretty(self):
        # python strftime function to  manipulate time display
        return self.post_date.strftime('%b %e %Y')

class Make(models.Model):
    make_name = models.CharField(max_length=255, primary_key=True)
    url = models.CharField(max_length=255)

# function to rename real blog name instead of random number blog on localhost admin
    def __str__(self):
        return self.make_name

    def summary(self):
        # return first 100 words from the body
        return self.url

class Comic(models.Model):
    comic_name = models.CharField(max_length=255, primary_key=True)

# function to rename real blog name instead of random number blog on localhost admin
    def __str__(self):
        return self.comic_name
