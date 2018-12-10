FROM ubuntu:16.04

MAINTAINER yaiceltg@gmail.com

# Install COTURN
RUN apt-get update && \
    apt-get install -y \
            coturn \
            redis-server \
            --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

#
RUN echo "TURNSERVER_ENABLED=1" > /etc/default/coturn

# Copy KMS entrypoint
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# Coturn listens on port 3478 by default
EXPOSE 3478 3478/udp

# These ports are recommended to be opened, as WebRTC randomly exchanges media through any of them
EXPOSE 49152-65535/udp

#
CMD ["coturn"]
