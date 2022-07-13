#!/bin/sh

arm-none-eabi-objcopy -I binary dist/blackmagic_all.bin -O ihex dist/blackmagic_all.hex  --change-address 0x8000000
if [ "X$BMP" = X ] ; then
BMP=`ls /dev/cu.usbmodem????????1`
fi

arm-none-eabi-gdb <<EOF
file dist/blackmagic_all.hex
target extended-remote $BMP
monitor connect_srst disable
monitor swdp_scan
attach 1
load
quit
EOF
