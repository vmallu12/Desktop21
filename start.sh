#!/bin/bash

set -e

export USER=desktop
export HOME=/home/desktop

mkdir -p "$HOME/.vnc"

sudo chown -R desktop:desktop "$HOME"
chmod 700 "$HOME/.vnc"

cat > "$HOME/.vnc/xstartup" <<'EOF'
#!/bin/sh

unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

xrdb $HOME/.Xresources

xset s off
xset s noblank
xset -dpms

exec startxfce4
EOF

chmod +x "$HOME/.vnc/xstartup"
