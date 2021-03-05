# Generated by Django 3.1.2 on 2021-02-17 16:37

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vaccination', '0004_auto_20210213_0028'),
    ]

    operations = [
        migrations.AddField(
            model_name='personne',
            name='date_deuxieme_dose',
            field=models.DateField(default=datetime.date.today),
        ),
        migrations.AddField(
            model_name='personne',
            name='date_premiere_dose',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='personne',
            name='sexe',
            field=models.CharField(choices=[('homme', 'homme'), ('femme', 'femmme')], default='homme', max_length=6),
        ),
        migrations.DeleteModel(
            name='CentreStockage',
        ),
    ]
