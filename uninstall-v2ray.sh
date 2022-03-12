#! /bin/bash
sudo systemctl stop v2ray
sudo systemctl disable v2ray
sudo rm /usr/local/bin/v2ray /usr/local/bin/v2ctl /etc/systemd/system/v2ray.service /etc/systemd/system/v2ray@.service
sudo rm -r /usr/local/share/v2ray /usr/local/etc/v2ray /var/log/v2ray /etc/systemd/system/v2ray.service.d /etc/systemd/system/v2ray@.service.d
sudo systemctl daemon-reload
echo "v2ray UNINSTALL SUCCESSFULLY!"
