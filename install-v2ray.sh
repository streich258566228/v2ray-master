#! /bin/bash
install -m 755 v2ray-core/v2* /usr/local/bin/
install -d  /usr/local/share/v2ray
install -m 644 v2ray-core/geo*.dat /usr/local/share/v2ray/
install -d /usr/local/etc/v2ray
touch ocnfig.json /usr/local/v2ray/config.json
echo "{}" > /usr/local/etc/v2ray/config.json
if id nobody | grep -qw 'nogroup'; then
    install -d -m 700 -o nobody -g nogroup /var/log/v2ray/
    install -m 600 -o nobody -g nogroup /dev/null /var/log/v2ray/access.log
    install -m 600 -o nobody -g nogroup /dev/null /var/log/v2ray/error.log
else
    install -d -m 700 -o nobody -g nobody /var/log/v2ray/
    install -m 600 -o nobody -g nobody /dev/null /var/log/v2ray/access.log
    install -m 600 -o nobody -g nobody /dev/null /var/log/v2ray/error.log
fi
install -m 644 v2ray-core/systemd/system/v2ray*.service /etc/systemd/system/v2ray*.service
mkdir -p "etc/systemd/system/v2ray.service.d"
mkdir -p "/etc/systemd/system/v2ray@.service.d"
touch /etc/systemd/system/v2ray.service.d/10-donot_touch_multi_conf.conf
touch /etc/systemd/system/v2ray@.service.d/10-donot_touch_multi_conf.conf
echo "# In case you have a good reason to do so, duplicate this file in the same directory and make your customizes there.
# Or all changes you made will be lost!  # Refer: https://www.freedesktop.org/software/systemd/man/systemd.unit.html
[Service]
ExecStart=
ExecStart=/usr/local/bin/v2ray -config usr/local/etc/v2ray/config.json" > '/etc/systemd/system/v2ray.service.d/10-donot_touch_single_conf.conf'
echo "# In case you have a good reason to do so, duplicate this file in the same directory and make your customizes there.
# Or all changes you made will be lost!  # Refer: https://www.freedesktop.org/software/systemd/man/systemd.unit.html
[Service]
ExecStart=
ExecStart=/usr/local/bin/v2ray -config usr/local/etc/v2ray/%i.json" > '/etc/systemd/system/v2ray@.service.d/10-donot_touch_single_conf.conf'
systemctl daemon-reload
systemctl enable v2ray.service
systenctl start v2ray.service

echo "Installing progress completed!!!"