FROM ubuntu:12.04

# Install dependencies
RUN ls -la
RUN apt-get update -y
RUN apt-get install -y git curl apache2 php5 libapache2-mod-php5 php5-mcrypt php5-mysql
RUN pwd

# Install app
RUN rm -rf /var/www/*
RUN cd /tmp && git clone https://github.com/iviarki/simple_php.git && mv simple_php/* /var/www/.
RUN ls -la /var/www

ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
