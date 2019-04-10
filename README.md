# docker-nginx
A Dockerfile that installs NGINX over latest CentOS 7

## Installation

```
# git clone https://github.com/lavanco/docker-nginx.git

# cd docker-nginx

# docker build -t lavanco/nginx .
```

## Usage

To create a new instance of NGINX:`

```
# docker volume create nginx-data

# docker run \
            -d 
            --name nginx -h nginx 
            -p 80:80 -p 443:443 
            -v nginx-data:/usr/share/nginx/html
            lavanco/centos7-nginx
```

Thanks to [goriparthi](https://github.com/goriparthi/centos7-nginx) for some ideas on Dockerfiles
