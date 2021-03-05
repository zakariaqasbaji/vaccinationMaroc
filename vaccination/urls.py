from django.urls import path
from . import views
from .views import PersonneGenericsApi
from .views import CentreVaccinationGenericsApi

urlpatterns = [

    path('personne',PersonneGenericsApi.as_view()),
    path('personne/<int:id>',PersonneGenericsApi.as_view()),
    path('centre',CentreVaccinationGenericsApi.as_view()),
    path('centre/<int:id>',CentreVaccinationGenericsApi.as_view()),
    path('personnes/stat/<int:dose>',views.getStat),
    path('personnes/stat',views.getStat),
    path('centres/stat/<int:id>/<int:dose>',views.getStatCentre),
    path('centres/stat/<int:id>',views.getStatCentre),   
    path('centreFromPerson/<int:id>',views.centreFromPerson),
    path('getPerson/<str:cin>',views.getPerson),#voir view!

]
