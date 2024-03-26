# Docker Jour 2

## Création de l'image dockerj2

L'image docker basé sur php:7.3-apache démarrera avec les extensions php suivante :

- mysqli
- pdo_mysql

le répertoir de travail sera défini par l'instruction WORKDIR /www
Ce dossier aura une persistance de donné avac le dossier ./www , il sera lié lorsque nous executerons la commande run.

Le mode rewrite sera activé sur le serveur, ensuite les droit pour l'utilisateur www-data:www-data sera donné sur le répertoir de travail /www
Par la suite les fichiers contenue dans le répertoir /configapache seront copié dans le répertoir d'apache /etc/apache2/sites-available,
ceci étant pour la configuration des vhost d'apache , ce dossier n'as aucune persistance.

### Commande apache pour activer/desactiver des Vhost

- RUN a2ensite mon-site // activation de notre site démo
- RUN a2dissite 000-default // désactivation de la config par défault
- RUN a2dissite default-ssl // désactivation de la config par défault

## Construire l'image

```docker
docker build --no-cache -t dockerj2:latest .
```

pour plus d'information sur docker build [docker Pages](https://docs.docker.com/reference/cli/docker/image/build/).

## Pour démarrer l'image

> [!NOTE]
> $(pwd) est une variable d'environnement
> pour plus d'information reportez-vous [wikipedia Pages](https://fr.wikipedia.org/wiki/Variable_d%27environnement).

```docker
docker run --name dockej -p 8080:80 --mount type=bind,source="$(pwd)"/www,target=/www dockej
```

pour plus d'information sur docker run [docker Pages](https://docs.docker.com/storage/bind-mounts/).
