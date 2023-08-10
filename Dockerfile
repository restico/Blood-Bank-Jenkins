FROM ubuntu/apache2:2.4-22.04_beta

COPY ./src/ /var/www/blood_bank
COPY ./blood_bank.conf /etc/apache2/sites-available/

RUN apt update -y \
     && apt install -y lsb-release gnupg2 ca-certificates apt-transport-https software-properties-common \
     && add-apt-repository ppa:ondrej/php \
     && apt update \
     && apt -y install php8.2 php8.2-mysql php8.2-gd php8.2-ldap php8.2-odbc  php8.2-xml php8.2-xmlrpc php8.2-mbstring php8.2-snmp php8.2-soap curl

WORKDIR /etc/apache2/sites-available
RUN a2dissite 000-default.conf \
     && a2ensite blood_bank.conf \
     && a2enmod rewrite \
     && service apache2 restart

EXPOSE 80

CMD ["apache2-foreground"]
