FROM alpine:latest

LABEL maintainer="Vladislav Kazakov <vkorol2509@icloud.com>"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk add --update openvpn bash easy-rsa openvpn-auth-pam && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

COPY configs /vpn/
COPY bin /usr/local/bin/

WORKDIR vpn
