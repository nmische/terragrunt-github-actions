FROM debian:bullseye-slim

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		bash \
		ca-certificates \
		curl \
		git \
		jq \
		openssh-client \
		uuid-runtime \
		awscli \
	; \
	curl https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb \
		-o /tmp/session-manager-plugin.deb \
	; \
	dpkg -i /tmp/session-manager-plugin.deb; \
	rm -rf /tmp/session-manager-plugin.deb; \
	rm -rf /var/lib/apt/lists/*

COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]
