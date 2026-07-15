Ubuntu Desktop Docker (Optimized)

A lightweight, fast, and optimized Ubuntu Desktop running inside Docker with XFCE4, TigerVNC, and noVNC.

Features

- Ubuntu 24.04 LTS
- XFCE4 Desktop
- TigerVNC Server
- noVNC Web Client
- Firefox
- PulseAudio Support
- Clipboard Support
- Dynamic Screen Resolution
- Non-root Desktop User
- Docker Healthcheck
- Automatic Restart
- Low RAM Usage
- Optimized for Low Latency

Requirements

- Docker 24+
- Docker Compose
- 2 CPU Cores (Recommended)
- 4 GB RAM (Recommended)
- 20 GB Free Disk

Build

docker compose build

Start

docker compose up -d

Stop

docker compose down

Open Desktop

Open your browser and visit:

http://localhost:6080/vnc.html

Replace "localhost" with your VPS IP if accessing remotely:

http://YOUR_SERVER_IP:6080/vnc.html

Environment Variables

Variable| Default
TZ| UTC
VNC_RESOLUTION| 1366x768
DISPLAY| :1
VNC_PORT| 5901
NOVNC_PORT| 6080

Example:

TZ=Asia/Kolkata
VNC_RESOLUTION=1920x1080

Performance Tips

- Allocate at least 1 GB shared memory ("shm_size: 1gb").
- Use an SSD rather than an HDD.
- Disable XFCE animations and compositing.
- Close unused browser tabs.
- Use a wired or low-latency network connection when possible.

Default Ports

- 6080 — noVNC (Web)
- 5901 — VNC

Updating

docker compose pull
docker compose build --no-cache
docker compose up -d

Troubleshooting

Black Screen

docker compose restart

Container Logs

docker compose logs -f

Enter the Container

docker exec -it ubuntu-desktop bash

License

MIT
