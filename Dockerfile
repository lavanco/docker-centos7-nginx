FROM centos:7

RUN echo -e '[nginx]\nname=nginx repo\nbaseurl=http://nginx.org/packages/centos/7/$basearch/\ngpgcheck=0\nenabled=1' > /etc/yum.repos.d/nginx.repo

ENV \
  yum_options="-y --setopt=tsflags=nodocs --nogpgcheck"

RUN yum $yum_options --enablerepo=extras install epel-release && \
  yum makecache fast && \
  yum $yum_options update

RUN yum $yum_options install nginx \
  supervisor \
  vim \
  tar

RUN yum clean all && rm -rf /var/cache/yum && rm -rf /tmp/*

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD etc/supervisord.d/nginx.ini /etc/supervisord.d/nginx.ini

EXPOSE 80 443

#Run nginx engine
CMD ["/usr/bin/supervisord","-n","-c","/etc/supervisord.conf"]