#!/usr/bin/env bash
echo "X-Run-Every-Seconds: 1800"

re='^[0-9]+$'
IFS=$'\n'
for disk in `lsblk -d -o name | tail -n +2`; do
    temp=`sudo hddtemp -n /dev/$disk 2> /dev/null`
    if [[ $temp =~ $re ]]; then
        echo "smart_status($disk).name = 'HDD temperature result on /dev/$disk'"
        echo "smart_status($disk).expected = <= 46"
        echo "smart_status($disk).value = $temp"
    fi
done
