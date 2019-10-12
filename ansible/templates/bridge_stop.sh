#!/bin/bash

####################################
# Tear Down Ethernet bridge on Linux
####################################

# Define Bridge Interface
br="br0"

# Define list of TAP interfaces to be bridged together
tap="tap0 tap1 tap2 tap3 tap4 tap5 tap6 tap7 tap8 tap9 tap10 tap11 tap12 tap13 tap14 tap15 tap16 tap17 tap18 tap19 tap20"

ifconfig $br down
brctl delbr $br

for t in $tap; do
    openvpn --rmtun --dev $t
done