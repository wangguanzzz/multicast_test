image id: ami-031290b4bd9eaa715

ansible-playbook release.yml --extra-vars "version=1.23.45 other_variable=foo"

#n2n
supernode -l 1200
sudo edge -l 172.31.36.239:1200 -c Buckhill -a 192.168.1.x -E

sysctl -w net.core.rmem_max=26214400

You can also make it permanent by adding this line to /etc/sysctl.conf:
net.core.rmem_max=26214400

#epel
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

openvpn --cipher none --proto udp --dev tun --comp-lzo --auth none --prng none --mode p2p --ifconfig 192.168.1.2 192.168.1.3 --port 1194
openvpn --cipher none --proto udp --dev tun --comp-lzo --auth none --prng none --mode p2p --ifconfig 192.168.1.3 192.168.1.2 --remote 192.168.100.2 1194

openvpn --cipher none --proto udp --dev tun --auth none --prng none --mode p2p --ifconfig 192.168.1.2 192.168.1.3 192.168.1.4 192.168.1.5 192.168.1.6 192.168.1.7 --port 1194
openvpn --cipher none --proto udp --dev tun --auth none --prng none --mode p2p --ifconfig 192.168.1.2 192.168.1.3 192.168.1.4 192.168.1.5 192.168.1.6 192.168.1.7 --remote 172.31.29.76 1194

#openvpn
#server systemctl start openvpn@server.service
when switch to upd need to comment ;explicit-exit-notify 3

#openvswitch
#systemctl start openvswitch && killall dhclient && ovs-vsctl add-br OFSWITCH -- set Bridge OFSWITCH other-config:hwaddr=\$MAC && ovs-vsctl add-port OFSWITCH eth0 && ifconfig eth0 0.0.0.0 && dhclient OFSWITCH && service network restart
systemctl start openvswitch && killall dhclient && ovs-vsctl add-br OFSWITCH -- set Bridge OFSWITCH other-config:hwaddr=\$MAC && ovs-vsctl add-port OFSWITCH eth0 && ifconfig eth0 0 up && dhclient OFSWITCH && service network restart
