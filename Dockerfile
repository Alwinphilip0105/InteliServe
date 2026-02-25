# InteliServe – PHP + Apache (same approach as Park Company Parking App)
FROM php:8.0-apache

RUN apt-get update && apt-get install -y \
    libzip-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql zip

RUN a2enmod rewrite
RUN echo "ServerName inteliserve" >> /etc/apache2/apache2.conf

WORKDIR /var/www/html
COPY . .

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

EXPOSE 80
CMD ["apache2-foreground"]
