FROM php:7-apache-buster
RUN a2enmod rewrite
RUN a2enmod ssl
RUN service apache2 restart
RUN apt update \
 && apt upgrade -y \
 && apt install git unzip zlib1g-dev libpng-dev libjpeg62-turbo-dev -y \
 && docker-php-ext-configure gd --with-jpeg \
 && docker-php-ext-install -j$(nproc) gd \
 && curl https://getcomposer.org/installer > /root/composer-setup.php \
 && php /root/composer-setup.php --install-dir=/usr/local/bin/ --filename=composer
RUN cd /var/www \
 && git clone "https://github.com/typemill/typemill.git" ./html/ \
 && cd html \
 && composer update
RUN chown -R www-data:www-data /var/www/html \
    && find /var/www/html -type d -exec chmod 570 {} \; \
	&& find /var/www/html -type f -exec chmod 460 {} \;
RUN cp -R /var/www/html/content /var/www/html/content.orig
COPY cmd.sh /
COPY init_content.sh /
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
RUN chown root:root /cmd.sh ; chmod 0700 /cmd.sh
RUN chown root:root /init_content.sh ; chmod 0700 /init_content.sh
CMD ["/cmd.sh"]
