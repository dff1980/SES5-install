#!/bin/bash
zypper in -y deepsea
echo "master: admin.ses5.suse.ru" > /etc/salt/minion.d/minion.conf
systemctl enable salt-master salt-minion
systemctl start salt-master
systemctl start salt-minion
sleep 15
salt-key
salt-key -A -y
sleep 15
salt '*' test.ping
salt '*' cmd.run date
salt '*' grains.append deepsea default

