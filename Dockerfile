FROM registry.fedoraproject.org/fedora-minimal:35-armhfp
COPY start-wg /usr/local/bin/
RUN microdnf upgrade -y --nodocs --setopt=install_weak_deps=0 && \
	microdnf install -y --nodocs --setopt=install_weak_deps=0 wireguard-tools iptables iproute qrencode && \
	microdnf clean all && \
	chmod 755 /usr/local/bin/start-wg && \
	mkdir -p /etc/wireguard/ && \
	rm -rf /var/cache/dnf/ /var/cache/yum/ /var/lib/dnf/ /tmp/* /var/tmp/* /var/log/*
VOLUME ["/etc/wireguard/"]
ENV WG_ENDPOINT_RESOLUTION_RETRIES="infinity"
CMD ["/usr/local/bin/start-wg"]
