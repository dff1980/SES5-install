# SES5-install
SES5 Install file doc and script
ipv6 for hostname?
fqdn for admin
salt-run state.event pretty=True
deepsea monitor
salt-run state.orch ceph.stage.0
salt-run state.orch ceph.stage.1
cp policy.cfg /srv/pillar/ceph/proposals

exec hosts.sh at osd node (if dint using autoyast)

## OpenStack Integration (new in SES 5.5!)
DeepSea now includes an openstack.integrate runner which will create the necessary storage pools and cephx keys for use by OpenStack Glance, Cinder, and Nova. It also returns a block of configuration data that can be used to subsequently configure OpenStack. To learn more about this feature, run the following command on the administration node: salt-run openstack.integrate -d

## ceph-authtool
To create a new keyring containing a key for client.foo:

ceph-authtool -C -n client.foo --gen-key keyring
To associate some capabilities with the key (namely, the ability to mount a Ceph filesystem):

ceph-authtool -n client.foo --cap mds 'allow' --cap osd 'allow rw pool=data' --cap mon 'allow r' keyring
To display the contents of the keyring:

ceph-authtool -l keyring
When mount a Ceph file system, you can grab the appropriately encoded secret key with:

mount -t ceph serverhost:/ mountpoint -o name=foo,secret=`ceph-authtool -p -n client.foo keyring`
