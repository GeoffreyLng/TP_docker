#Création d'un réseau utilisé par les deux conteneurs Docker
#permettant d'assurer la communication entre les deux, et leur donner une adresse IP
docker network create -d bridge dvwa-net --subnet 10.10.1.0/16

#Les commandes docker run viennent placer les images dans des conteneurs

#Dans l'ordre des options on fait pour "bdd" :
#   -Attribution d'un nom
#   -Mode détaché
#   -Confirmation du port utilisé
#   -Entrer dans le réseau "dvwa-net"
#   -Attribution d'une adresse IP
#   -Passage d'une option MYSQL permettant de changer le mot de passe root
#   -Nom de l'image utilisé dans le conteneur
docker run --name bdd -d -p 3306:3306 --network dvwa-net --ip 10.10.1.1 -e MYSQL_ROOT_PASSWORD=p@ssw0rd lange/bdd

#Dans l'ordre des options on fait pour "web" :
#   -Attribution d'un nom
#   -Mode détaché
#   -Confirmation du port utilisé
#   -Entrer dans le réseau "dvwa-net"
#   -Attribution d'une adresse IP
#   -Un volume copiant la configuration DVWA dans le conteneur
#   -Nom de l'image utilisé dans le conteneur
docker run --name web -d -p 80:80 --network dvwa-net --ip 10.10.1.2 -v $(pwd)/DVWA/:/var/www/localhost/htdocs/dvwa/ lange/web

