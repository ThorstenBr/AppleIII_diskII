# Apple III to disk II / FloppyEmu Adapter
This project contains a KiCad PCB to create an adapter to connect an Apple III to an original Apple disk II drive, or to a FloppyEmu from [Big Mess of Wires - FloppyEmu](https://www.bigmessowires.com/floppy-emu/) - an SD-card based disk drive emulator.
The adapter allows to connect the internal or external floppy port of the Apple III to a FloppyEmu or disk II drive.

## License
This project is released under the "Creative Commons Attribution 4.0 International Public License". See [LICENSE](/LICENSE).

## Description
The adapter allows to connect an Apple III to an original Apple disk II drive - or to a FloppyEmu disk emulater. You can connect the adapter to the internal or external floppy ports of the Apple III. The internal port connects the boot drive (drive #1). You can simply unplug the ribbon cable from the internal drive and plug it to the adapter's Apple III port (26pin).
Your disk II or floppy emu ribbon cable plugs into the 20pin header on the adapter.

When connected to the internal Apple III floppy port, then the connected drive acts as drive #1 (boot drive). However, the internal port does not support the signals for the external drives. So, you cannot use FloppyEmu's dual drive support to also emulate drive #2. (There is an advanced workaround to allow drive 1+2 emulation on the internal floppy port though - see below).

When connected to the external Apple III floppy port, then the connected drie acts as drive #2 (which is "_external_ drive #1"). FloppyEmu's dual drive support works with the external port, so you can also emulate drive #3 ("_external drive #2"). So, including the internal drive, you then had 3 drives connected to your Apple III.

![AppleIIIDiskIIAdapter](/resources/DuoDiskPlugged.jpg)

There are three switches solder jumpers on the bottom side of the adapter:

* **JP1**: connects the "drive 2" signal to the 20-pin connector. This signal enables dual drive support of FloppyEmu. This signal cannot be used when connecting an original Apple disk II drive, though. Setting this jumper will do not any harm when a disk II drive was connected, since there is also a resistor protecting the pin. But it adds unnecessary load. So, it's recommended to only close JP1 when you connect a FloppyEmu (and intend to use the dual drive support). Otherwise leave this jumper open.
* **JP2, JP3**: These jumpers connect +12V and -12V to the 20pin header. These voltage supplies are required for the Apple disk II drive. But they are not required by FloppyEmu. It's recommended to leave these jumpers open if you intend to connect a FloppyEmu. But they have to be closed when you wanted to use an original disk II drive.

![AppleIIIDiskIIAdapter](/KiCad/DuoDiskAdapter3D.png)

## Parts List
Parts list for the completed PCB:
* 1x 2x10pin box header
* 1x 2x13pin box header
* 1x 470 Ohm resistor

I ordered parts from my usual German electronics online shop for a few bucks. I created a public shopping list containing all the parts.
All parts are extremely common and will be available for a long time.

[Shopping List at Reichelt.de](https://www.reichelt.de/my/1958081?LANGUAGE=EN):
* 1x WSL 20G
* 1x WSL 26G
* 1x 1/4W 470

## Gerber Files, Ordering a PCB
If you wished to directly order a PCB (PCBWay, JLCPCB etc) you could use the latest Gerber files from the [Gerber](/Gerber/) directory. Just upload the ZIP file to your preferred PCB manufacturer and order the PCB. My PCBs were manufactured by JLCPCB (using the cheapest options, I got mine already after about 1.5 weeks for a few bucks/Euros).

## Soldering
Soldering is straight forward. Only simple through-hole components are used. All part numbers and component values are marked directly on the PCB.

Just take care to not mix up the male and female DB-25 connectors. Having to desolder these is messy - you do not want the experience... :)
* Solder the female DB-25 connector to J1 (Apple II Drive Controller).
* Solder the male DB-25 connector to J2 (DuoDisk).

The DB-25 connectors for J1/J2 use simple "solder bucket" pins (not straight, nor angled pins).
The PCB is simply plugged in between the two bucket rows - and then soldered. It's easy - and indeed a very rigid connection.

**DOUBLE-CHECK THE PROPER ORIENTATION OF THE BOX HEADERS!**  
The notch for the box headers are clearly marked on the PCB.
Incorrect orientation of the box headers for the Apple III or FloppyEmu port will damage or destroy your Apple III and FloppyEmu/disk II drive - or both...

![AppleIIIDiskIIAdapter](/resources/CompletedPcb.jpg)

### Soldering Options
The toggle switch to SWAP drive 1+2 of FloppyEmu is optional. You may find it convenient when mixing drives of DuoDisk and FloppyEmu.
Otherwise, if you mainly plan to either use DuoDisk, or otherwise FloppyEmu, but rarely a combination, then the additional switch may just add confusion.
You can omit the "swapping switch" (SW3) and just solder jumpers instead - as shown:

![AppleIIIDiskIIAdapter](/resources/NoSwapSwitchJumpers.jpg)

Also, if you just wanted an adapter to map a single drive only (i.e. keep drive 2 fixed to DuoDisk or FloppyEmu, while only drive 1 can be switched), you can also replace switch SW2 with a soldered jumper - as shown:
* Red jumper to map disk 2 always to DuoDisk.
* Blue jumper to map disk 2 always to FloppyEmu.

![AppleIIIDiskIIAdapter](/resources/NoDisk2SwitchJumpers.jpg)

Note, SW2 to switch drive 2 only makes sense for newer FloppyEmus (rev C or newer), which support dual disk emulation.
If you are using an older FloppyEmu Model B, supporting single disk emulation only, then omit switch SW2 and solder the red jumper as shown above.

## Installation
Make sure the Apple II is switched off.

**DO NOT CONNECT THE ADAPTER OR THE FLOPPY EMU WHILE YOUR MACHINE IS POWERED!**

* Disconnect the DB-25 cable from the DuoDisk.
* Instead of the DB-25 cable, plug the completed PCB into the rear of the DuoDisk.
* Connect the DB-25 cable to the adapter.
* Finally connect FloppyEmu's ribbon cable to the adapter.

The adapter will be conveniently placed just above the Apple II's main power switch. You will be used to "hug" your Apple II with your left arm, when swiching it on/off. In the same way you can now reach the switches, to chose between DuoDisk and FloppyEmu drives.

![AppleIIIDiskIIAdapter](/resources/DuoDiskPlugged2.jpg)

I was a initially concerned that I might have to shorten FloppyEmu's ribbon cable, since the long cable is now in series with the original DuoDisk cable. However, so far, I have not experienced any issues (reading/writing FloppyEmu disks) and I just kept the ribbon cable at its original length.

## Usage
* The middle switch (SW1) maps Disk 1 to DuoDisk when the switch is flipped to the rear, otherwise Disk 1 of FloppyEmu is enabled.
* The front switch (SW2) maps Disk 2 to DuoDisk when the switch is flipped to the rear, otherwise Disk 2 of FloppyEmu is enabled.
* SW3, if installed, allows to swap Disks 1/2 of Floppy Emu. Default setting is when SW3 is flipped to the front (Disk 1/2=FloppyEmu Disk 1/2), otherwise the drives are swapped.

In most cases you can flip the middle switch only (toggle drive 1 between DuoDisk and FloppyEmu). The other switches are only relevant when you plan to use multiple drives, e.g. to copy data from a real disk to FloppyEmu or vice versa.

Do not flip the switches while the drives are actively used. This could result in corrupted disks, when writing.
It's safe to flip the switches, however, while the drives are not being accessed.

## Schematics and KiCad Project
The [KiCad](/KiCad/) folder contains the schematics and PCB project files, if you wished to adapt the design.

![AppleIIIDiskIIAdapter](/Images/AppleIII_diskII_adapter_schematics.png)

