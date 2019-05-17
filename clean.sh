#!/bin/bash
salt-run  state.orch ceph.stage.5
salt '*' grains.delval deepsea destructive=True
salt-key -D -y
zypper rm -y deepsea salt-api salt-minion salt-master salt ceph-common
rm -r /srv/modules
rm -r /srv/pillar
rm -r /srv/salt
rm -r /etc/salt
rm -r /var/cache/salt
rm /srv/pillar/ceph/master_minion.sls.rpmsave /srv/pillar/ceph/deepsea_minions.sls.rpmsave /etc/salt/master.d/sharedsecret.conf.rpmsave
for node in 1 2 3 4
 do
   ssh osd-0$node 'zypper rm -y salt salt-minion ceph-common; rm -r /etc/salt /var/lib/ceph /var/cache/salt /etc/salt'
   scp wipe_disk.sh osd-0$node:/tmp/
   ssh osd-0$node 'bash /tmp/wipe_disk.sh sdb sdc sdd'
   ssh osd-0$node 'rm /tmp/wipe_disk.sh'
   ssh osd-0$node 'reboot'
 done

sleep 30

for node in 1 2 3 4
 do
  echo "wait to start osd-0$node after reboot"
  until (ping osd-0$node -c 1 > /dev/null) ; do sleep 10; done
 done

sleep 30

for node in 1 2 3 4; do ssh osd-0$node 'rm -r /var/lib/ceph'; done
