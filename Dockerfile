FROM registry.fedoraproject.org/fedora-minimal:35-armhfp
COPY start-wg ./
RUN microdnf upgrade -y --nodocs --setopt=install_weak_deps=0 && \
	microdnf install -y --nodocs --setopt=install_weak_deps=0 wireguard-tools iptables iproute qrencode && \
	microdnf clean all && \
	mkdir -p /etc/wireguard/ && \
	chmod 755 ./start-wg
	rm -rf /var/cache/dnf/ /var/cache/yum/ /var/lib/dnf/ /tmp/* /var/tmp/* /var/log/*
VOLUME ["/etc/wireguard/"]
ENV WG_ENDPOINT_RESOLUTION_RETRIES="infinity"
CMD ["./start-wg"]
