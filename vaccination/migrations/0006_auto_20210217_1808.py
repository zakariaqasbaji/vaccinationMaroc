# Generated by Django 3.1.2 on 2021-02-17 18:08

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vaccination', '0005_auto_20210217_1637'),
    ]

    operations = [
        migrations.AlterField(
            model_name='personne',
            name='date_deuxieme_dose',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='personne',
            name='date_premiere_dose',
            field=models.DateField(default=datetime.date.today),
        ),
    ]
