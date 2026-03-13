FROM debian:stable

RUN apt-get update
RUN apt-get install -y openvpn easy-rsa

WORKDIR /srv
COPY openvpn-install.sh ./

