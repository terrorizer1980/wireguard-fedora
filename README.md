[![Build](https://github.com/mibere/wireguard-fedora/actions/workflows/publish-image.yml/badge.svg?branch=main)](https://github.com/mibere/wireguard-fedora/actions/workflows/publish-image.yml)

_Image for my personal use, not for the general public._

### Download pre-built Docker image for _armv7_
```
docker pull ghcr.io/mibere/wireguard-fedora
```

### or build locally
```
mkdir ~/docker-builds
cd ~/docker-builds
git clone https://github.com/mibere/wireguard-fedora.git
cd wireguard-fedora
docker build -t wireguard-fedora --pull --no-cache .
docker rmi $(docker images -qa -f "dangling=true")
```

### Preparations on the host
```
sudo nano /etc/sysctl.d/99-sysctl.conf
```

> net.ipv6.conf.all.disable_ipv6 = 1  
> net.ipv4.ip_forward = 1

```
sudo sysctl -p
```

### Start container
Adapt the values for _DNS_ and _ENDPOINT_.

```
docker run --name=wireguard -e DNS=xx -e ENDPOINT=xx --restart=always --cap-add SYS_MODULE --cap-add NET_ADMIN --network=host -v /etc/wireguard/:/etc/wireguard/ -d ghcr.io/mibere/wireguard-fedora
```

### Update container
Adapt the values for _DNS_ and _ENDPOINT_.

```
docker stop wireguard
docker rm wireguard
docker pull ghcr.io/mibere/wireguard-fedora
docker run --name=wireguard -e DNS=xx -e ENDPOINT=xx --restart=always --cap-add SYS_MODULE --cap-add NET_ADMIN --network=host -v /etc/wireguard/:/etc/wireguard/ -d ghcr.io/mibere/wireguard-fedora
```
