FROM balenalib/raspberrypi3-debian:latest

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get -yq install \
    net-tools \
    nginx \
    fswebcam \
    cron
    
RUN DEBIAN_FRONTEND=noninteractive apt-get clean

COPY ./default.conf /etc/nginx/sites-available/default
COPY ./index.html /var/www/html/
COPY ./crontab /etc/
COPY ./startup.sh /

EXPOSE 80

CMD ["bin/sh", "/startup.sh"]
