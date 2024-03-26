FROM php:7.3-apache

# Définir le répertoire de travail
WORKDIR /www

# Installation des extensions PHP nécessaires
RUN docker-php-ext-install mysqli pdo_mysql

# Configuration du serveur Apache
RUN a2enmod rewrite
RUN chown -R www-data:www-data /www

# Copy des fichiers de configuration apache
COPY /configapache /etc/apache2/sites-available

# Activation des Vhosts et Désactivation des Vhost par défault
RUN a2ensite mon-site
RUN a2dissite 000-default
RUN a2dissite default-ssl

# Exposition du port 80 pour le serveur Apache
EXPOSE 80