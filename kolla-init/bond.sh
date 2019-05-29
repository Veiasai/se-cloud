#!/bin/bash

# Create NIC alias for a unified name structure.

nmcli con add type bond ifname em3 ip4 192.168.2.135/24 gw4 192.168.2.1 ipv4.dns 202.120.2.101
nmcli con add type bond-slave ifname eno1 master em3
nmcli con up bond-slave-eno1

nmcli con add type bond ifname em1 ip4 10.1.0.135/16
nmcli con add type bond-slave ifname enp59s0f0 master em1
nmcli con up bond-slave-enp59s0f0

