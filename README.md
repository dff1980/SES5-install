# SES5-install
SES5 Install file doc and script
ipv6 for hostname?
fqdn for admin
salt-run state.event pretty=True
deepsea monitor
salt-run state.orch ceph.stage.0
salt-run state.orch ceph.stage.1
cp policy.cfg /srv/pillar/ceph/proposals

## OpenStack Integration (new in SES 5.5!)
DeepSea now includes an openstack.integrate runner which will create the necessary storage pools and cephx keys for use by OpenStack Glance, Cinder, and Nova. It also returns a block of configuration data that can be used to subsequently configure OpenStack. To learn more about this feature, run the following command on the administration node: salt-run openstack.integrate -d
