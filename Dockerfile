FROM --platform=linux/amd64 ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
ENV DISPLAY=:1
ENV VNC_RESOLUTION=1366x768

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    xfce4 \
    xfce4-goodies \
    tigervnc-standalone-server \
    novnc \
    websockify \
    dbus-x11 \
    x11-xserver-utils \
    x11-utils \
    xterm \
    firefox \
    curl \
    wget \
    git \
    vim \
    nano \
    sudo \
    ca-certificates \
    openssl \
    fonts-dejavu \
    fonts-liberation \
    pulseaudio \
    pavucontrol \
    tzdata && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash desktop && \
    echo "desktop ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN mkdir -p /home/desktop/.vnc

COPY start.sh /start.sh
RUN chmod +x /start.sh

USER desktop
WORKDIR /home/desktop

EXPOSE 5901
EXPOSE 6080

HEALTHCHECK --interval=30s --timeout=5s CMD pgrep Xtigervnc >/dev/null || exit 1

CMD ["/start.sh"]
