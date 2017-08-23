FROM alpine:3.6
MAINTAINER Janne K <0x022b@gmail.com>

COPY rootfs/ /
ARG VOLUME=/data

RUN \
apk upgrade --no-cache && \
apk add --no-cache \
	ca-certificates \
	su-exec && \
mkdir -m 0777 -p "${VOLUME}"

VOLUME ["${VOLUME}"]
WORKDIR "${VOLUME}"

HEALTHCHECK CMD nc -zw5 google.com 443 || exit 1
ENTRYPOINT ["docker-entrypoint"]
CMD ["container-daemon"]
