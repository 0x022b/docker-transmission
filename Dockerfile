FROM alpine:3.6
MAINTAINER Janne K <0x022b@gmail.com>

COPY rootfs/ /
ARG VOLUME=/data

RUN \
apk upgrade --no-cache && \
apk add --no-cache \
	su-exec && \
mkdir -p "${VOLUME}"

VOLUME ["${VOLUME}"]
WORKDIR "${VOLUME}"

ENTRYPOINT ["docker-entrypoint"]
CMD ["container-daemon"]
