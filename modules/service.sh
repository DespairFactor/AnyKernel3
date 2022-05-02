#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode

echo 2 > /sys/devices/system/cpu/cpufreq/policy0/sched_pixel/lcpi_threshold
echo 44 > /sys/devices/system/cpu/cpufreq/policy0/sched_pixel/spc_threshold
echo 1401000 > /sys/devices/system/cpu/cpufreq/policy0/sched_pixel/limit_frequency

echo 6 > /sys/devices/system/cpu/cpufreq/policy4/sched_pixel/lcpi_threshold
echo 30> /sys/devices/system/cpu/cpufreq/policy4/sched_pixel/spc_threshold
echo 1826000 > /sys/devices/system/cpu/cpufreq/policy4/sched_pixel/limit_frequency

echo 5 > /sys/devices/system/cpu/cpufreq/policy6/sched_pixel/lcpi_threshold
echo 40 > /sys/devices/system/cpu/cpufreq/policy6/sched_pixel/spc_threshold
echo 2401000 > /sys/devices/system/cpu/cpufreq/policy6/sched_pixel/limit_frequency

echo 10 > /sys/kernel/vendor_sched/pmu_poll_time
echo 1 > /sys/kernel/vendor_sched/pmu_poll_enable
echo 1 > /sys/devices/system/cpu/cpufreq/policy0/sched_pixel/pmu_limit_enable
echo 1 > /sys/devices/system/cpu/cpufreq/policy4/sched_pixel/pmu_limit_enable
echo 1 > /sys/devices/system/cpu/cpufreq/policy6/sched_pixel/pmu_limit_enable

sleep 30;


magiskpolicy --live "allow hal_power_default proc file { write read open getattr map }"
magiskpolicy --live "allow hal_power_default proc_sched file { write read open getattr map }"

stop vendor.power-hal-aidl;

start vendor.power-hal-aidl;
