# Generated by Django 3.1.2 on 2021-02-13 00:28

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('vaccination', '0003_auto_20210212_1517'),
    ]

    operations = [
        migrations.CreateModel(
            name='CentreVaccination',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('intitule', models.CharField(max_length=50)),
                ('adresse', models.CharField(max_length=300)),
                ('nombre_emp', models.PositiveIntegerField(validators=[django.core.validators.MinValueValidator(1)])),
            ],
        ),
        migrations.AlterField(
            model_name='personne',
            name='cin',
            field=models.CharField(max_length=20, unique=True),
        ),
        migrations.AlterField(
            model_name='personne',
            name='qr_code',
            field=models.ImageField(blank=True, null=True, upload_to='qrcodes/'),
        ),
        migrations.CreateModel(
            name='CentreStockage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('intitule', models.CharField(max_length=50)),
                ('adresse', models.CharField(max_length=300)),
                ('stockage', models.PositiveIntegerField()),
                ('nombre_emp', models.PositiveIntegerField(validators=[django.core.validators.MinValueValidator(1)])),
                ('centre_vaccination', models.ManyToManyField(null=True, to='vaccination.CentreVaccination')),
            ],
        ),
        migrations.AddField(
            model_name='personne',
            name='centre_vaccination',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='vaccination.centrevaccination'),
        ),
    ]