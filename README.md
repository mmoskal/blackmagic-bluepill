![Image of Bluepill used as a BMP debugger](img/bluepill-in-action.jpg)

# BMP firmware for Bluepill

This repo contains instructions needed to turn a [Bluepill board](https://stm32-base.org/boards/STM32F103C8T6-Blue-Pill.html)
into a [Black Magic Probe](https://github.com/blacksphere/blackmagic/wiki) debugger.
Black Magic Probe (BMP) runs a GDB server on the debug probe itself which allows for programming and debugging.
I've had best luck with connecting to targets under periodic sleep with BMP compared to openocd or pyocd.

The `dist/` folders contains binary builds of the BMP firmware.
The following changes have been applied, compared to `PROBE_HOST=stlink` default configuration:
* the SWDIO pin has been moved from PB14 to PB0
* the LED pin has been moved to PC13 (where the LED is on the Bluepill)
* the probe will assert target RESET signal on boot; this way the Bluepill reset button will reset both the probe and the target
* the Vref can be connected to PA0 without voltage divider

You can flash the firmware using STLINK/V2 and the following command:

```
openocd -c 'set FLASH_SIZE 0x20000' -f interface/stlink-v2.cfg -f target/stm32f1x.cfg -c 'program dist/blackmagic_all.bin verify reset exit 0x08000000'
```

You can also just run `./flash.sh` which does the same.

Many Bluepill boards announce 64KB, which is not enough for BMP.
The command above force-configures flash size to be 128KB
(the STM32F103C8 parts typically have 128KB but the upper half may be defective or not tested).
The command also verifies if the flash was written correctly - in case you get an error there, get a different Bluepill.

You can also use some STLINK GUI application, or any other methods for flashing.

## Pinout

The basic SWD pinout follows.

|Pin |Function| Comments
|----|--------| ------------
|PB0 |SWDIO   | Required
|PA5 |SWCLK   | Required
|PB1 |RESET   | Optional - can be connected to NRST line of target
|PA10|SWO     | Optional - SWO is for logging, but is rarely used
|PA0 |Vref    | Optional - prints out target voltage on startup
|PC13|LED     | LED already connected on the Bluepill

The Bluepill will also act as a USB-Serial adapter (on the higher-numbered serial port).

|Pin |Function|
|----|--------|
|PA3 |RX      |
|PA2 |TX      |

If you want to use JTAG, here are the connections (but I have not tested these).

|Pin |Function|
|----|--------|
|PB0 |TMS     |
|PA7 |TDI     |
|PA6 |TDO     |
|PA5 |TCK     |

To use the debugger with [Hack-Connect-XS](https://arcade.makecode.com/hardware/dbg)
follow the [guide to build breakout cable](https://arcade.makecode.com/hardware/dbg#breakout-cable)
and then connect to Bluepill as indicated above.

![Bluepill BMP shield assembled](img/bluepill-bmp-shield.jpg)

## Bluepill-BMP shield

If you don't feel like breadboarding the pinout above,
the `eagle/` folder contains design files for a shield with 2x5pin 50mil Cortex debug connector,
a switch for powering the target, and a reset button for the target.
The Gerber files are also included.

It also lets you optionally use pin 5 of the Cortex debug connector as RESET line,
so you can use Hack-Connect-XS without any cable slicing - once you set the jumper into HC-XS position,
just use a regular 2x5pin IDC cable, with
[the male header inserted on target side](https://arcade.makecode.com/hardware/dbg#target-end).

(This shield is why I do not use the `swlink` BMP target)

## License

The Black Magic Probe firmware https://github.com/blacksphere/blackmagic
is licensed under GPL v3.
See https://github.com/mmoskal/blackmagic/tree/bluepill for the
[patches applied](https://github.com/blacksphere/blackmagic/compare/master...mmoskal:bluepill?expand=1);
to build use `make PROBE_HOST=stlink BLUEPILL=1`

The Eagle files contain parts based on ones from 
* SparkFun Eagle Libraries https://github.com/sparkfun/SparkFun-Eagle-Libraries licensed under CC-SA-4.0
* Adafruit Eagle Libraries https://github.com/adafruit/Adafruit-Eagle-Library

Any new content is licensed under MIT.
