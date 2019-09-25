image id: ami-031290b4bd9eaa715

ansible-playbook release.yml --extra-vars "version=1.23.45 other_variable=foo"

#n2n
supernode -l 1200
sudo edge -l 172.31.25.208:1200 -c Buckhill -a 192.168.1.x -E

sysctl -w net.core.rmem_max=26214400

You can also make it permanent by adding this line to /etc/sysctl.conf:
net.core.rmem_max=26214400

#epel
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

openvpn --cipher none --proto udp --dev tun --comp-lzo --auth none --prng none --mode p2p --ifconfig 192.168.1.2 192.168.1.3 --port 1194
openvpn --cipher none --proto udp --dev tun --comp-lzo --auth none --prng none --mode p2p --ifconfig 192.168.1.3 192.168.1.2 --remote 192.168.100.2 1194

openvpn --cipher none --proto udp --dev tun --auth none --prng none --mode p2p --ifconfig 192.168.1.2 192.168.1.3 --port 1194
openvpn --cipher none --proto udp --dev tun --auth none --prng none --mode p2p --ifconfig 192.168.1.3 192.168.1.2 --remote xxxx 1194
#openvpn
#server systemctl start openvpn@server.service
when switch to upd need to comment ;explicit-exit-notify 3
systemctl start openvpn@server
for multiple instance need to run in command line:
openvpn --config /etc/openvpn/server.conf

#openvswitch

sudo ifconfig br1 192.168.1.1/16 up
sudo ovs-vsctl add-port br1 vx1 -- set interface vx1 type=vxlan options:remote_ip=172.31.19.231


ovs-vsctl set Bridge br1 mcast_snooping_enable=true

ovs-vsctl set Bridge br1 other_config:mcast-snooping-disable-flood-unregistered=true
ovs-appctl mdb/show br1

socat STDIO UDP4-DATAGRAM:224.1.1.1:4444, ip-add-membership=192.168.1.2:br1
socat -d -d -d -d - udp-datagram:224.1.1.1:4444,bind=:4444,ip-add-membership=192.168.1.2.:br1

# build ovs

[root]
54 yum -y install wget openssl-devel gcc make python-devel openssl-devel kernel-devel kernel-debug-devel autoconf automake rpm-build redhat-rpm-config libtool
55 adduser ovs

[ovs@ip-172-31-16-225 ~]\$ history
1 mkdir -p ~/rpmbuild/SOURCES
2 wget http://openvswitch.org/releases/openvswitch-2.5.0.tar.gz
3 cp openvswitch-2.5.0.tar.gz ~/rpmbuild/SOURCES/
4 tar xfz openvswitch-2.5.0.tar.gz
5 sed 's/openvswitch-kmod, //g' openvswitch-2.5.0/rhel/openvswitch.spec > openvswitch-2.5.0/rhel/openvswitch_no_kmod.spec
6 rpmbuild -bb --nocheck ~/openvswitch-2.5.0/rhel/openvswitch_no_kmod.spec

sudo ifconfig br1 192.168.1.1/16 up
sudo ovs-vsctl add-port br1 vx1 -- set interface vx1 type=gre options:remote_ip=172.31.33.102

wget http://vault.centos.org/centos/7.6.1810/os/Source/SPackages/omping-0.0.4-6.el7.src.rpm
