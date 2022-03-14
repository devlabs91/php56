FROM amazonlinux:2018.03

RUN yum update -y && yum install -y \
sudo \
httpd24 \
httpd24-tools \
mod24_ssl \
mod24_nss \
php56 \
php56-cli \
php56-common \
php56-devel \
php56-gd \
php56-jsonc \
php56-jsonc-devel \
php56-mbstring \
php56-mcrypt \
php56-mysqlnd \
php56-pdo \
php56-process \
php56-soap \
php56-tidy \
php56-xml \
nano \
less \
openssh-server \
openssh-clients \
rsync \
which \
zip \
unzip \
git \
&& yum clean all

EXPOSE 80
EXPOSE 443

ADD etc/php-5.6.d/phalcon.ini /etc/php-5.6.d/phalcon.ini
ADD /usr/lib64/php/5.6/modules/phalcon.so /usr/lib64/php/5.6/modules/phalcon.so

ADD create-user.sh /tmp/create-user.sh
ADD create-cert.sh /tmp/create-cert.sh
ADD server-config.sh /tmp/server-config.sh
ADD start-servers.sh /usr/sbin/start-servers
ADD set-permissions.sh /tmp/set-permissions.sh

RUN /bin/bash /tmp/create-user.sh && \
rm /tmp/create-user.sh && \
/bin/bash /tmp/create-cert.sh && \
rm /tmp/create-cert.sh && \
/bin/bash /tmp/server-config.sh && \
rm /tmp/server-config.sh

ADD .ssh /home/ec2-user/.ssh

RUN /bin/bash /tmp/set-permissions.sh && \
rm /tmp/set-permissions.sh

CMD /usr/bin/env bash start-servers;sleep infinity
