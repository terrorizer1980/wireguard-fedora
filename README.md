[![Build](https://github.com/mibere/wireguard-fedora/actions/workflows/publish-image.yml/badge.svg?branch=main)](https://github.com/mibere/wireguard-fedora/actions/workflows/publish-image.yml)

_Image for my personal use, not for the general public._

### Download pre-built Docker image for _armv7_
```
docker pull ghcr.io/mibere/wireguard-fedora
```

### Start container
```
docker run --name=wireguard --restart=always --cap-add SYS_MODULE --cap-add NET_ADMIN --sysctl net.ipv4.ip_forward=1 --sysctl net.ipv6.conf.all.disable_ipv6=1 -p 48651:48651/udp -v /etc/wireguard/:/etc/wireguard/ -d ghcr.io/mibere/wireguard-fedora
```

### Update container
```
docker stop wireguard
docker rm wireguard
docker pull ghcr.io/mibere/wireguard-fedora
docker run --name=wireguard --restart=always --cap-add SYS_MODULE --cap-add NET_ADMIN --sysctl net.ipv4.ip_forward=1 --sysctl net.ipv6.conf.all.disable_ipv6=1 -p 48651:48651/udp -v /etc/wireguard/:/etc/wireguard/ -d ghcr.io/mibere/wireguard-fedora
```
