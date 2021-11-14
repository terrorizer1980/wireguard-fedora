FROM registry.fedoraproject.org/fedora-minimal:35-armhfp
COPY start-wg /usr/local/bin/
RUN microdnf upgrade -y --nodocs --setopt=install_weak_deps=0 && \
	microdnf install -y --nodocs --setopt=install_weak_deps=0 wireguard-tools iptables iproute qrencode && \
	microdnf clean all && \
	chmod 755 /usr/local/bin/start-wg && \
	mkdir -p /etc/wireguard/clients/ && \
	rm -rf /var/cache/dnf/ /var/cache/yum/ /var/lib/dnf/ /tmp/* /var/tmp/* /var/log/*
VOLUME ["/etc/wireguard/"]
ENV WG_ENDPOINT_RESOLUTION_RETRIES="infinity"
ENV DNS="192.168.1.1"
ENV ENDPOINT="my.dyn.dns"
CMD ["/usr/local/bin/start-wg"]
