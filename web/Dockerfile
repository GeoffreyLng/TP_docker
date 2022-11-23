#Ce Dockerfile vient monter la partie "web" du projet
#On y retrouve DVWA, Apache2 et PHP7

#On prend la version 3:11 d'Alpine pour pouvoir avoir les paquets PHP7 (qui ne sont plus disponibles depuis quelques versions)
FROM alpine:3.11

#Installation des paquets nécessaire à DVWA
RUN apk update && apk add apache2 php7-apache2 php7-gd php7-mysqli php7-pdo_mysql php7-session

#Suppression de la page "It works" d'Apache2
RUN rm /var/www/localhost/htdocs/index.html

#On ouvre le port 80 de l'image Docker
EXPOSE 80


CMD ["-D","FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]