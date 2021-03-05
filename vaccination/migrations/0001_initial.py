# Generated by Django 3.1.2 on 2021-02-12 13:49

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Personne',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom', models.CharField(max_length=50)),
                ('prenom', models.CharField(max_length=50)),
                ('cin', models.CharField(max_length=20)),
                ('age', models.PositiveIntegerField(validators=[django.core.validators.MinValueValidator(1)])),
                ('doses', models.CharField(choices=[(1, 'première dose'), (2, 'deuxieme dose')], max_length=15)),
            ],
        ),
    ]