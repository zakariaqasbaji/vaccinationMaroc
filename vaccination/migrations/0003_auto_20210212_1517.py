# Generated by Django 3.1.2 on 2021-02-12 15:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vaccination', '0002_auto_20210212_1436'),
    ]

    operations = [
        migrations.AlterField(
            model_name='personne',
            name='doses',
            field=models.PositiveIntegerField(choices=[(1, 'première dose'), (2, 'deuxieme dose')]),
        ),
    ]
