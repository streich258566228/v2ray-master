#! /bin/bash
sudo mv v2ray-core/v2ray /usr/local/bin/v2ray
sudo mv v2ray-core/v2ctl /usr/local/bin/v2ctl

sudo mkdir /usr/local/share/v2ray
sudo mv v2ray-core/geoip.dat /usr/local/share/v2ray/geoip.dat
sudo mv v2ray-core/geosite.dat /usr/local/share/v2ray/geosite.dat

sudo mkdir /usr/local/etc/v2ray
sudo mv v2ray-core/config.json /usr/local/etc/v2ray/config.json

sudo mv  v2ray-core/systemd/system/v2ray* /etc/systemd/system/

sudo systemctl daemon-reload
systemctl enable v2ray.service
echo "v2ray INSTALL SUCCESSFULLY!"