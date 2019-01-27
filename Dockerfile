FROM centos:7

RUN yum update -y -q && \
    yum install -y -q epel-release && \
    yum install -y -q openvpn easy-rsa
COPY configs /vpn/
COPY bin /usr/local/bin/

WORKDIR vpn
