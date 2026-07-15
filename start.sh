#!/bin/bash

set -e

export USER=desktop
export HOME=/home/desktop
export DISPLAY=:1
export VNC_RESOLUTION=${VNC_RESOLUTION:-1366x768}
export TZ=${TZ:-UTC}

mkdir -p "$HOME/.vnc"

# Kill old sessions if they exist
vncserver -kill :1 >/dev/null 2>&1 || true
rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1

# XFCE startup
cat > "$HOME/.vnc/xstartup" <<'EOF'
#!/bin/sh

unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

xrdb $HOME/.Xresources

# Disable screen blanking
xset s off
xset s noblank
xset -dpms

exec startxfce4
EOF

chmod +x "$HOME/.vnc/xstartup"

# Start PulseAudio
pulseaudio --start --exit-idle-time=-1 >/dev/null 2>&1 || true

# Start VNC Server
vncserver :1 \
    -geometry "${VNC_RESOLUTION}" \
    -depth 24 \
    -localhost no

# Start noVNC
/usr/share/novnc/utils/novnc_proxy \
    --vnc localhost:5901 \
    --listen 6080 &

echo ""
echo "======================================"
echo " Ubuntu Desktop Started"
echo " VNC      : 5901"
echo " noVNC    : http://localhost:6080/vnc.html"
echo " Resolution: ${VNC_RESOLUTION}"
echo "======================================"

# Keep container running
tail -f "$HOME/.vnc/"*.log
