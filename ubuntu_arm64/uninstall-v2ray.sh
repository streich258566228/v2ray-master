#! /bin/bash
systemctl stop v2ray
systemctl disable v2ray
rm /usr/local/bin/v2ray /usr/local/bin/v2ctl /etc/systemd/system/v2ray*.service
rm -r /usr/local/share/v2ray /usr/local/etc/v2ray /var/log/v2ray /etc/systemd/system/v2ray*.service.d
sudo systemctl daemon-reload
echo "Uinstalling progress completed"