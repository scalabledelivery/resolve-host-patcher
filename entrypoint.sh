#!/bin/bash
cp /var/run/host-etc/resolv.conf /tmp/resolv.conf
echo > /var/run/host-etc/resolv.conf
for ip in $(grep ^nameserver /etc/resolv.conf | awk '{$1=""; print}'); do
    grep -q "$ip" /tmp/resolv.conf || echo "nameserver ${ip}" >> /var/run/host-etc/resolv.conf
done
cat /tmp/resolv.conf >> /var/run/host-etc/resolv.conf
