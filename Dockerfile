FROM ubuntu:22.04

LABEL org.opencontainers.image.description="Basic systemd-enabled ubuntu lts image"
LABEL org.opencontainers.image.licenses=MIT

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y systemd ca-certificates \
    && apt-get clean \
    && truncate -s0 /etc/machine-id \
    && truncate -s0 /var/lib/dbus/machine-id

CMD ["/lib/systemd/systemd"]
