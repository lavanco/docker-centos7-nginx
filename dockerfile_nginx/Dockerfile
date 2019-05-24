ARG DISTRO=centos
ARG DISTROVERSION=7

FROM $DISTRO:$DISTROVERSION

RUN echo -e '[nginx]\nname=nginx repo\nbaseurl=http://nginx.org/packages/centos/7/$basearch/\ngpgcheck=0\nenabled=1' > /etc/yum.repos.d/nginx.repo

ARG yumoptions="-y --setopt=tsflags=nodocs --nogpgcheck"

RUN \
  yum $yumoptions --enablerepo=extras install epel-release && \
  yum makecache fast && \
  yum $yumoptions update && \
  yumpackages=" \
    nginx \
    supervisor \
    vim \
    tar \
    " && \
  yum $yumoptions install $yumpackages && \
  yum clean all && rm -rf /var/cache/yum

RUN \
  mkdir /etc/nginx/sites-available && mkdir /etc/nginx/sites-enabled && \
  sed -i.orig "s#include \/etc\/nginx\/conf\.d\/\*.conf;#include \/etc\/nginx\/conf.d\/*.conf;\n    include \/etc\/nginx\/sites-enabled\/*.conf;#g" /etc/nginx/nginx.conf && \
  echo "daemon off;" >> /etc/nginx/nginx.conf && \
  echo -e '[program:nginx]\ncommand=/usr/sbin/nginx' > /etc/supervisord.d/nginx.ini

WORKDIR /etc/nginx

EXPOSE 80 443

VOLUME ["/usr/share/nginx/html", "/var/log/nginx/log"]

CMD ["/usr/bin/supervisord","-n","-c","/etc/supervisord.conf"]
