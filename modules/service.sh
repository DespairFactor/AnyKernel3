#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode

echo "262144 524288 8388608" /proc/sys/net/ipv4/tcp_wmem
echo y > /sys/kernel/mm/lru_gen/enabled
echo 5000 > /sys/kernel/mm/lru_gen/min_ttl_ms
