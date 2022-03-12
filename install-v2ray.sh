#! /bin/bash
sudo cp v2ray-core/v2ray /usr/local/bin/v2ray
sudo cp v2ray-core/v2ctl /usr/local/bin/v2ctl

sudo mkdir /usr/local/share/v2ray
sudo cp v2ray-core/geoip.dat /usr/local/share/v2ray/geoip.dat
sudo cp v2ray-core/geosite.dat /usr/local/share/v2ray/geosite.dat

sudo mkdir /usr/local/etc/v2ray
sudo cp v2ray-core/config.json /usr/local/etc/v2ray/config.json

sudo mkdir /var/log/v2ray
sudo touch /var/log/v2ray/access.log
sudo touch /var/log/v2ray/error.log

sudo cp  v2ray-core/systemd/system/v2ray* /etc/systemd/system/

sudo mkdir /etc/systemd/system/v2ray.service.d
sudo mkdir /etc/systemd/system/v2ray@.service.d

sudo systemctl daemon-reload
sudo systemctl enable v2ray.service
sudo systemctl start v2ray.service

echo "v2ray INSTALL SUCCESSFULLY!"