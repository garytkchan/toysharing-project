from django.db import models
from django.contrib.auth.models import User  # Django way to import user
from django.apps import apps


class Toys(models.Model):
    title = models.CharField(max_length=255)
    makeName = models.ForeignKey('Make', on_delete=models.CASCADE)
    owner = models.ForeignKey(User, on_delete=models.CASCADE)
    description = models.CharField(max_length=255)
    picture = models.ImageField(upload_to='images/')
    post_date = models.DateTimeField()
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
    makeName = models.CharField(max_length=255, primary_key=True)
    url = models.CharField(max_length=255)

# function to rename real blog name instead of random number blog on localhost admin
    def __str__(self):
        return self.makeName

    def summary(self):
        # return first 100 words from the body
        return self.url
