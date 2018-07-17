FROM centos:7

RUN echo -e '[nginx]\nname=nginx repo\nbaseurl=http://nginx.org/packages/centos/7/$basearch/\ngpgcheck=0\nenabled=1' > /etc/yum.repos.d/nginx.repo

RUN yum -y --enablerepo=extras --setopt=tsflags=nodocs --nogpgcheck install epel-release
RUN yum -y --setopt=tsflags=nodocs --nogpgcheck update
RUN yum makecache fast
RUN yum -y --setopt=tsflags=nodocs --nogpgcheck install nginx \
supervisor \
vim \
tar \
wget
RUN yum clean all

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD ./supervisord.conf /etc/supervisord.conf

EXPOSE 80 443

#Run nginx engine
CMD ["/usr/bin/supervisord","-n","-c","/etc/supervisord.conf"]