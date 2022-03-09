#! /bin/bash
sudo systemctl stop v2ray
sudo systemctl disable v2ray
sudo rm -r /var/log/v2ray /usr/local/share/v2ray /usr/local/etc/v2ray /etc/systemd/system/v2ray.service.d /etc/systemd/system/v2ray@.service.d
sudo rm /etc/systemd/system/v2ray.service /etc/systemd/system/v2ray@.service /usr/local/bin/v2ray /usr/local/bin/v2ctl
echo "v2ray UNINSTALL SUCCESSFULLY!"
