# docker-centos7-nginx
A Dockerfile that installs latest CentOS 7 and NGINX

## Installation

```
# git clone https://github.com/lavanco/docker-centos7-nginx.git
# cd docker-centos7-nginx
# docker build -t lavanco/centos7-nginx .
```

## Usage

To create a new instance of NGINX:`

```
# docker run -d --name nginx -h nginx -p 80:80 -p 443:443 -v /usr/share/nginx/html/:/usr/share/nginx/html lavanco/centos7-nginx
```

Thanks to [goriparthi](https://github.com/goriparthi/centos7-nginx) for some ideas on Dockerfiles
