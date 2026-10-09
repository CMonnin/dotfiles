#!/usr/bin/env bash
# Install the monitor hotplug handler system-wide (needs sudo).
# Files are copied root-owned rather than symlinked: udev and systemd run them
# as root, so they must not be writable by the user. Re-run after editing them.
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"

sudo install -m 0755 -o root -g root "$DIR/monitor-hotplug" /usr/local/bin/monitor-hotplug
sudo install -m 0644 -o root -g root "$DIR/monitor-hotplug.service" /etc/systemd/system/monitor-hotplug.service
sudo install -m 0644 -o root -g root "$DIR/95-monitor-hotplug.rules" /etc/udev/rules.d/95-monitor-hotplug.rules

sudo systemctl daemon-reload
sudo udevadm control --reload
echo "OK: monitor hotplug handler installed"
