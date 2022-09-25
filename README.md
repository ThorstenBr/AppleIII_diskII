# Apple III to disk II / FloppyEmu Adapter
This project contains a KiCad PCB to create an adapter to connect an Apple III to an original Apple disk II drive, or to a FloppyEmu from [Big Mess of Wires - FloppyEmu](https://www.bigmessowires.com/floppy-emu/) - an SD-card based disk drive emulator.
The adapter allows to connect the internal or external floppy port of the Apple III to a FloppyEmu or disk II drive.

## License
This project is released under the "Creative Commons Attribution 4.0 International Public License". See [LICENSE](/LICENSE).

## Description
The adapter allows to connect an Apple III to an original Apple disk II drive - or to a FloppyEmu disk emulator.
You can connect the adapter to the internal or external floppy ports of the Apple III.
Your disk II or FloppyEmu ribbon cable plugs into the 20pin header on the adapter.

### Using the Apple III external floppy port
You can connect the adapter to the external floppy port at the rear of your Apple III (you'll need a separte short 26pin ribbon cable).

* **Disk II**: When using the external floppy port, the connected disk II drive acts as the system's "drive #2" (which is "**external** drive #1").
* **FloppyEmu**: When connecting a FloppyEmu, you can enable its dual drive support. In this case your FloppyEmu will emulate the system "drive #2" and "drive #3" (which are "**external** drives #1 and #2"). So, including the internal drive, you then have three floppy drives connected to your Apple III.

![Apple III external floppy port](/Images/AppleIII_external_floppy_port.jpg)

### Using the Apple III internal floppy port
The internal port connects the boot drive (system drive #1).
You can simply unplug the installed ribbon cable from the internal drive and plug it to the adapter's Apple III port.
No extra cable is required.
![Apple III external floppy port](/Images/AppleIII_internal_floppy_cable.jpg)

When using the internal Apple III floppy port, then the connected drive acts as drive #1 (boot drive). The internal port does not support the signals for the external drives, however.
So, you cannot use FloppyEmu's dual drive support to also emulate drive #2.
(There is an advanced workaround to allow drive 1+2 emulation on the internal floppy port though, using a botch wire - see below).

If you connect a new cable to the mainboard: the internal port is located on the mainboard right next to the external port:
![Apple III external floppy port](/Images/AppleIII_internal_floppy_port.jpg)

## Parts List
Parts list for the completed PCB:
* 1x 2x10pin box header
* 1x 2x13pin box header
* 1x 470 Ohm resistor

Additionally, if you wanted to use Apple III's external floppy port, you may need a short 26pin ribbon cable with appropriate sockets.
* 2x 2x13-pin IDC socket (with strain relief)
* 1x 26pin ribbon cable (a few inches/centimers are enough)

A very short ribbon cable will be enough for the external port (since your disk II/floppyEmu already comes with a long ribbon cable). Note, if you have any wider ribbon cables, you can easily reduce them to the appropriate wire count (so you would not need to shop an entire roll of new 26-write ribbon cable).

For the internal floppy port you can reuse the existing floppy cable of your Apple III (unplug the internal floppy and plug the cable into the adapter instead).

I ordered parts from my usual German electronics online shop for less than a buck (add a few bucks if you need a new ribbon cable).
I created a public shopping list containing all the parts. All parts are extremely common and will be available for a long time.

[Shopping List at Reichelt.de](https://www.reichelt.de/my/1980987?LANGUAGE=EN):
* 1x WSL 20G
* 1x WSL 26G
* 1x 1/4W 470

Optional (extra cable for external floppy port):
* 2x PFL 26
* 1x AWG 28-26G 3M

## Gerber Files, Ordering a PCB
If you wished to directly order a PCB (PCBWay, JLCPCB etc) you could use the latest Gerber files from the [Gerber](/Gerber/) directory. Just upload the ZIP file to your preferred PCB manufacturer and order the PCB. My PCBs were manufactured by JLCPCB (using the cheapest options, I got mine already after about 1.5 weeks for a few bucks/Euros).

## Soldering
Soldering is straight forward. Only simple through-hole components are used. All part numbers and component values are marked directly on the PCB.

**DOUBLE-CHECK THE PROPER ORIENTATION OF THE BOX HEADERS!**  
The notch for the box headers are clearly marked on the PCB.
Incorrect orientation of the box headers for the Apple III or FloppyEmu port will damage or destroy your Apple III and FloppyEmu/disk II drive - or both...

![Completed PCB with orientation of the box headers](/Images/AppleIIIFloppyEmu_front.png)

### Soldering Options
There are three solder jumpers on the bottom side of the adapter:

* **JP1**: connects the "drive 2" signal to the 20-pin connector. This signal enables dual drive support of FloppyEmu. This signal cannot be used when connecting an original Apple disk II drive, though. Setting this jumper will not damage anything when a disk II drive was connected, since there is also a resistor protecting the pin. But it adds unnecessary load. So, it's recommended to only close JP1 when you connect a FloppyEmu (and intend to use the dual drive support). Otherwise leave this jumper open.
* **JP2, JP3**: These jumpers connect -12V and +12V to the 20pin floppy header. These voltage supplies are required for the Apple disk II drive. But they are not required by FloppyEmu. It's recommended to leave these jumpers open if you intend to only connect a FloppyEmu. But they have to be closed when you wanted to use an original disk II drive.

![Jumpers on the Apple III disk II adapter](/Images/AppleIII_adapter_jumper.png)

## Installation
Make sure the Apple III is switched off.

**DO NOT CONNECT THE ADAPTER, THE DISK II or FLOPPY EMU WHILE YOUR MACHINE IS POWERED!**

* Connect the adapter to the external floppy port at the rear of your Apple III (26pin ribbon cable required). Alternatively, connect it to the internal floppy port: pull the 26pin ribbon cable from the internal disk drive and plug it into the adapter.
* Finally connect disk II's or FloppyEmu's ribbon cable to the adapter.

![AppleIIIDiskIIAdapter](/resources/DuoDiskPlugged2.jpg)

## Schematics and KiCad Project
The [KiCad](/KiCad/) folder contains the schematics and PCB project files, if you wished to adapt the design.

![Schematics of the adapter](/Images/AppleIII_diskII_adapter_schematics.png)

