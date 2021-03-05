from django.db import models
from django.core.validators import MinValueValidator
import qrcode
from io import BytesIO
from django.core.files import File
from PIL import Image, ImageDraw 
import datetime

# Create your models here.

class CentreVaccination(models.Model):
    intitule=models.CharField(max_length=50)
    adresse=models.CharField(max_length=300)
    nombre_emp=models.PositiveIntegerField(validators=[MinValueValidator(1)])
    # def __str__(self):
    #     return self.intitule




#les possibilités de nombre des doses
CHOIX = (
    (1, 'première dose'),
    (2, 'deuxieme dose')
)

#homme ou femme
GENDER = (
    ('homme', 'homme'),
    ('femme', 'femme')
)
class Personne(models.Model):
    nom=models.CharField(max_length=50)
    prenom=models.CharField(max_length=50)
    cin=models.CharField(unique=True,max_length=20)
    gender=models.CharField(choices=GENDER,max_length=6,default="homme")
    age=models.PositiveIntegerField(validators=[MinValueValidator(1)])
    doses=models.PositiveIntegerField(choices=CHOIX)
    date_premiere_dose=models.DateField(default=datetime.date.today) 
    date_deuxieme_dose=models.DateField(blank=True, null=True) 
    qr_code = models.ImageField(upload_to='qrcodes/',blank=True, null=True,editable=False)#admin n'a pas le droit de changer ce champs, il generer automatiquement si le nombre de doses=2
    centre_vaccination=models.ForeignKey(CentreVaccination, on_delete= models.SET_NULL,blank=True,null=True)

    # def __str__(self):
    #     return str(self.nom+" "+self.prenom)

    #ces lignes de code servent à attribuer un QrCode à une personne lorsque qu'elle finira la vaccination cad 2 doses ce qrcode. 
    def save(self, *args, **kwargs):#redefinition de la methode save
        if(self.doses==2):#si le nombre de doses egale 2 on va creer le qrcode
            qrcode_img = qrcode.make(self.cin)
            canvas = Image.new('RGB', (290, 290), 'white')
            draw = ImageDraw.Draw(canvas)
            canvas.paste(qrcode_img)
            fname = f'qr_code-{self.cin}.png'
            buffer = BytesIO()
            canvas.save(buffer, 'PNG')
            self.qr_code.save(fname, File(buffer), save=False)
            canvas.close()
            super().save(*args, **kwargs)
        else:#sinon on rend le qrcode null
            self.qr_code=""
            super().save(*args, **kwargs)




    