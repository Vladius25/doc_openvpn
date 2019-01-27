[![Build Status](https://travis-ci.com/Vladius25/doc_openvpn.svg?branch=master)](https://travis-ci.com/Vladius25/doc_openvpn)
[![](https://images.microbadger.com/badges/image/vladius25/doc_openvpn.svg)](https://microbadger.com/images/vladius25/doc_openvpn "Get your own image badge on microbadger.com")
![](https://img.shields.io/docker/pulls/vladius25/doc_openvpn.svg)
![](https://img.shields.io/docker/automated/vladius25/doc_openvpn.svg?colorB=brightgreen)

# OpenVPN for Docker
OpenVPN server in docker container

# Installation

## Preparation
Make /home/vpn directory and clone sources:

```
mkdir -p /home/vpn && cd /home/vpn
git clone https://github.com/Vladius25/doc_openvpn.git vpn
```
## Build
```
docker-compose build
```

## Configure
### Configs
Enter configs directory and edit files as you need

### PKI
Run script and follow instruction to init pki:
```
docker-compose run --rm vpnserver setup_pki
```

### OpenVPN
Run script to configure openvpn:
```
docker-compose run --rm vpnserver setup_vpn
```

### Systemd
Install unit file:
```
cp services/doc_openvpn.service /usr/lib/systemd/system/
systemctl daemon-reload
```
Enable and service:
```
systemctl enable doc_openvpn
```

# Startup and stop
To start service after installation use systemd OR just docker-compose:
```
systemctl start doc_openvpn
```

```
cd /home/vpn/vpn && docker-compose up -d
```

To stop:
```
systemctl strop doc_openvpn
```
```
cd /home/vpn/vpn && docker-compose down
```

# Gen client certs
To gen client's certs, sign client and make .ovpn file run:
```
docker-compose run --rm vpnserver sign CLIENT_NAME
```
