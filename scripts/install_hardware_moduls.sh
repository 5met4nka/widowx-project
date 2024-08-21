#!/bin/bash

if [ $(id -u) -ne 0 ]
then
    echo "This script must be run as root";
    exit 1;
fi

rules_file="/etc/udev/rules.d/widowx.rules"

if [ -f "$rules_file" ]; then
    echo "The WIDOWX device is already installed"
else
    echo 'SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", ATTRS{serial}=="AR0JW9R1", MODE:="0666", GROUP:="dialout", SYMLINK+="ttyUSB_WIDOWX"' > /etc/udev/rules.d/widowx.rules

    service udev reload
    sleep 2
    service udev restart
    sudo udevadm trigger
fi
