FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get install -y apache2
RUN chown -R www-data:www-data /var/www/

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

ADD index.html /var/www/html/
EXPOSE 80
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D","FOREGROUND"]

# Build custom image
sudo docker build -t nexusmedia:v1 .

# Run container with 8080:80 port mapping
sudo docker run -itd -p 8080:80 nexusmedia:v1

http://98.83.139.116:8080
