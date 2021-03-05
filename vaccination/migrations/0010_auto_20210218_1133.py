# Generated by Django 3.1.2 on 2021-02-18 11:33

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('vaccination', '0009_auto_20210218_0206'),
    ]

    operations = [
        migrations.RenameField(
            model_name='personne',
            old_name='sexe',
            new_name='gender',
        ),
        migrations.AlterField(
            model_name='personne',
            name='centre_vaccination',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='vaccination.centrevaccination'),
        ),
    ]
