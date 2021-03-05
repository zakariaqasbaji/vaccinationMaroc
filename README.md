# vaccinationMaroc
Ce mini projet est dédié pour la gestion de vaccination qui prend la forme d’une
API (Application Programming Interface) qui permet de fournir des données sur
les personnes vaccinées et les centres de vaccination au Maroc.

Une fois vaccinée par la première dose, les informations sur la personne seront
ajoutées à la base de données :
-id,
-nom,
-prénom,
-cin,
-gender : homme ou femme,
-Age,
-doses : dans ce cas égale à 1, lorsque la personne revient pour la deuxième dose
elles deviennent 2,
-date de première dose si elle indéterminée le système prend la date d’aujourd’hui,
-date deuxième dose,
-qr_code : null dans ce cas, puisque la personne n’a pas complété la vaccination, pour avoir un qrcode il faut que le nombre de doses égale à 2 ce champ est remplié automatiquement par le système par le lien de l’image qrcode contenue dans le serveur.
-centre de vaccination.

Après de la deuxième dose, le qrcode sera généré, j’ai supposé que ce qrcode contient seulement le cin de la personne, ce qrcode va être scanné par une application front end (pour ne pas pénaliser le serveur) utilisée par les services concernés par la vérification de vaccination : la police, l’aéroport …, une fois scanné une recherche sera lancée avec ce cin ce qui permet de vérifier les informations de la personne et vérifier qu’il a eu les deux doses et qu’il n’a pas falsifié le qrcode.
Cette api fournit aussi des statistiques pertinentes sur les vaccinés et les centre de vaccination (selon le nombre de doses ou indépendamment) :
➢ La moyenne d’âge de tous les vaccinés.
➢ L’écart type d’âge.
➢ Age max, âge min.
➢ Nombre des hommes vaccinés.
➢ Nombre des femmes vaccinées.
➢ Pourcentage des hommes vaccinés.
➢ Pourcentage des femmes vaccinées.
➢ Nombre total des personnes vaccinées.
➢ Aussi donne les mêmes informations pour un centre bien déterminé…
➢ …

exemple du QR code créé pour la personne de cin ffffffff:
![exemple QR code](/ReadmeImgs/qr%20exemple.PNG)



