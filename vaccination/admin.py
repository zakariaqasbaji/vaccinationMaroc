from django.contrib import admin
from .models import Personne
from .models import CentreVaccination

# Register your models here.
admin.site.register(Personne)
admin.site.register(CentreVaccination)
