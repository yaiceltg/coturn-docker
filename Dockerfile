FROM ubuntu:16.06

MAINTAINER Yaicel Torres Garces

# Install COTURN
RUN apt-get update && \
    apt-get install -y \
            coturn \
            redis-server \
            --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

#
RUN echo "TURNSERVER_ENABLED=1" > /etc/default/coturn

#
RUN cp turnserver.conf /etc/turnserver.conf

#
EXPOSE 3478 3478/udp

#
CMD ["coturn"]
