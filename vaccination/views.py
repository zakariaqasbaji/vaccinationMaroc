from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import Personne
from .models import CentreVaccination
from .serializers import PersonneSerializer
from .serializers import CentreVaccinationSerializer
from rest_framework import generics
from rest_framework import mixins
from rest_framework.authentication import SessionAuthentication, BasicAuthentication,TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from django.db.models.aggregates import StdDev
from django.db.models import Avg, Max, Min,Count,Q




# Create your views here.

#generic mixin
class PersonneGenericsApi(generics.GenericAPIView,
mixins.ListModelMixin,
mixins.RetrieveModelMixin,
mixins.CreateModelMixin,
mixins.UpdateModelMixin,
mixins.DestroyModelMixin):
    serializer_class=PersonneSerializer
    queryset=Personne.objects.all()
    lookup_field='id'

    #authentication_classes = [SessionAuthentication, BasicAuthentication]
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]


    def get(self,request,id=None):
        if id:
            return self.retrieve(request)
        else:
            return self.list(request) 

    def post(self,request):
        return self.create(request)

    def put(self,request,id=None):
        return self.update(request)

    def delete(self,request,id):
        return self.destroy(request)
               
    

class CentreVaccinationGenericsApi(generics.GenericAPIView,
mixins.ListModelMixin,
mixins.RetrieveModelMixin,
mixins.CreateModelMixin,
mixins.UpdateModelMixin,
mixins.DestroyModelMixin):
    serializer_class=CentreVaccinationSerializer
    queryset=CentreVaccination.objects.all()
    lookup_field='id'

    #authentication_classes = [SessionAuthentication, BasicAuthentication]
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]


    def get(self,request,id=None):
        if id:
            return self.retrieve(request)
        else:
            return self.list(request) 

    def post(self,request):
        return self.create(request)

    def put(self,request,id=None):
        return self.update(request)

    def delete(self,request,id):
        return self.destroy(request)



#afficher les statistiques d'un centre precis par id si on ajoute le parametre dose on aura des statistiques en tenant compte le nombre des doses sinon on fait les statistiques independamment de nombre des doses
@api_view(['GET'])
def getStatCentre(request,id,dose=None):
    if dose==None:#si on ne passe aucun parametre les statistiques seront faits sur tous les personnes indépendament de nombre de doses
        statistiques=  Personne.objects.filter(centre_vaccination=id).aggregate(
            total=Count('id'),
            age_max= Max('age'),
            age_moyen=Avg('age'),
            age_min= Min('age'),
            ecart_type=StdDev('age'),
            nombre_hommes=Count('gender',filter=Q(gender="homme")),
            nombre_femmes=Count('gender',filter=Q(gender="femme")),
        )
    else:#sinon les statistiques seront faits sur  les personnes qui ont un nombre de doses précis
            statistiques=  Personne.objects.filter(doses=dose,centre_vaccination=id).aggregate(
            total=Count('id'),
            age_max= Max('age'),
            age_moyen=Avg('age'),
            age_min= Min('age'),
            ecart_type=StdDev('age'),
            nombre_hommes=Count('gender',filter=Q(gender="homme")),
            nombre_femmes=Count('gender',filter=Q(gender="femme")),
        )
    if statistiques['total']!=0:#pour eviter la division sur 0
        return Response({"statistiques_generales":statistiques,"comparaison_hommes_femmes":{"poucentage_homme":statistiques['nombre_hommes']/statistiques['total'],"poucentage_femme":statistiques['nombre_femmes']/statistiques['total']}})
    else:
        return Response({"resultat":"aucunne personne vacciné avec ce nombre de doses !!!!!!!! "})


#fonction pour les statistiques
@api_view(['GET'])
def getStat(request,dose=None):
    if dose==None:#si on ne passe aucun parametre les statistiques seront fais sur tous les personnes indépendamment de nombre de doses
        statistiques=  Personne.objects.aggregate(
            total=Count('id'),
            age_max= Max('age'),
            age_moyen=Avg('age'),
            age_min= Min('age'),
            ecart_type=StdDev('age'),
            nombre_hommes=Count('gender',filter=Q(gender="homme")),
            nombre_femmes=Count('gender',filter=Q(gender="femme")),
        )
    else:#sinon les statistiques seront faits sur  les personnes qui ont un nombre de doses précis
            statistiques=  Personne.objects.filter(doses=dose).aggregate(
            total=Count('id'),
            age_max= Max('age'),
            age_moyen=Avg('age'),
            age_min= Min('age'),
            ecart_type=StdDev('age'),
            nombre_hommes=Count('gender',filter=Q(gender="homme")),
            nombre_femmes=Count('gender',filter=Q(gender="femme")),
        )
    if statistiques['total']!=0:#pour eviter la division sur 0
        return Response({"statistiques_generales":statistiques,"comparaison_hommes_femmes":{"poucentage_homme":statistiques['nombre_hommes']/statistiques['total'],"poucentage_femme":statistiques['nombre_femmes']/statistiques['total']}})
    else:
        return Response({"resultat":"aucunne personne vacciné avec ce nombre de doses !!!!!!!! "})


#avoir les informations du cente à partir de personne pour monter la relation
@api_view(['GET'])
def centreFromPerson(request,id):
    centre=Personne.objects.select_related("centre_vaccination").all().filter(id=id)#comme vous voyez on a utiliser Personne pour acceder aux infos du centre
    serializer=CentreVaccinationSerializer(centre[0].centre_vaccination)
    return Response(serializer.data)



#cette fonction créée seulement pour créer une route qui permet de chercher une personne par cin (par exemple pour que la police vérifier que la personne est vaccinée elle scanne le qrcode avec le front end ce qui donne le cin qui sera utilisé pour verifier les informations de personne)
@api_view(['GET'])
def getPerson(request,cin):
    person=Personne.objects.get(cin=cin)
    serializer=PersonneSerializer(person)
    return Response(serializer.data)