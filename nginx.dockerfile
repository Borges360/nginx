FROM ubuntu:18.04

RUN set -x \
# Install package dependencies
  && apt-get update \
  && apt-get install --no-install-recommends --no-install-suggests -y \
     wget \
     gnupg2 \
     software-properties-common \
     ca-certificates \
# Install NGINX following these instructions
# https://www.nginx.com/resources/wiki/start/topics/tutorials/install/#official-debian-ubuntu-packages
  && wget -O - http://nginx.org/keys/nginx_signing.key | apt-key add -  \
  && apt-add-repository "deb http://nginx.org/packages/ubuntu/ bionic nginx" \
  && apt-get update \
  && apt-get install nginx=1.14.0-1~bionic

CMD ["nginx", "-g", "daemon off;"]