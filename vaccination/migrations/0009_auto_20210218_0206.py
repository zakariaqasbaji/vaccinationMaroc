# Generated by Django 3.1.2 on 2021-02-18 02:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vaccination', '0008_auto_20210218_0032'),
    ]

    operations = [
        migrations.AlterField(
            model_name='personne',
            name='sexe',
            field=models.CharField(choices=[('homme', 'homme'), ('femme', 'femme')], default='homme', max_length=6),
        ),
    ]
