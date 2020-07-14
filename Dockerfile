FROM debian:8.11-slim

RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y php5
RUN apt-get install -y php5-mysql
RUN apt-get install -y php5-mcrypt
RUN a2enmod rewrite

# copy apache configurations
COPY ./docker/app/apache/conf/000-default.conf /etc/apache2/sites-available/000-default.conf

# copy webapp to server doc root
COPY . /var/www/html

# copy entrypoint to /usr/sbin
COPY ./docker/app/docker-entrypoint.sh /usr/sbin
RUN chown -R root:root /usr/sbin/docker-entrypoint.sh
RUN chmod +x /usr/sbin/docker-entrypoint.sh

EXPOSE 80

ENTRYPOINT [ "/usr/sbin/docker-entrypoint.sh" ]