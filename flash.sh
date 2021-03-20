#!/bin/sh

openocd -c 'set FLASH_SIZE 0x20000' -f interface/stlink-v2.cfg -f target/stm32f1x.cfg -c 'program dist/blackmagic_all.bin verify reset exit 0x08000000'
