from rest_framework import serializers
from .models import Personne
from .models import CentreVaccination


class PersonneSerializer(serializers.ModelSerializer):
    class Meta:
        model=Personne
        fields = '__all__'


class CentreVaccinationSerializer(serializers.ModelSerializer):
    class Meta:
        model=CentreVaccination
        fields = '__all__'