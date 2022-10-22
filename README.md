# Apple III to disk II / FloppyEmu Adapter
This project decribes how to build an adapter connecting an Apple III to a [FloppyEmu from Big Mess of Wires](https://www.bigmessowires.com/floppy-emu/) - an SD-card based disk drive emulator.
Alternatively, the adapter can also be used to connect the Apple III to an original Apple **Disk II** drive (yes, Disk II, not Disk III).
The adapter works with either the internal or external floppy port of the Apple III.

![Apple III FloppyEmu adapter PCB](/Images/Adapter_pcb.jpg)

## License
This project is released under the "Creative Commons Attribution 4.0 International Public License". See [LICENSE](/LICENSE).

## Description
It doesn't take much to connect a FloppyEmu to an Apple III. The disk drive interface of the Apple III is very similar to the Apple II - with most signals being completely identical. The Apple III, however, has a few extra signals and features, hence it uses a wider 26pin connector, instead of the 20pin connector of the Apple II. The extra pins are not required for normal operation.

You could make the connection between Apple III and FloppyEmu/DiskII with a simple ribbon cable: using a 26pin IDC connector at one end, and a 20pin IDC connector (stripping the top 6 wires) at the other end. That would already work (if you don't mess up, reverse the connectors or strip wires from the wrong side, that is...). You can find more on this in [Steve's (BMOW) blog post](https://www.bigmessowires.com/2017/01/25/floppy-emu-on-the-apple-iii/).

However, such a 26pin to 20pin cable was too incovenient to me. It would require me to swap cables, forcing me to disassemble my FloppyEmu enclosure every time I wanted to switch between using it at an Apple II or Apple III.
Likewise, I'd have to disassemble the Disk II enclosure, if I wanted to connect it as an external drive to my Apple III.
Also, such a cable would only support a single drive - and couldn't support FloppyEmu's "dual drive emulation" feature.

So, instead, I designed this little adapter.
It can be connected to the Apple III disk port (internal or external port) and provides a standard 20pin connector, which can be used directly with the original FloppyEmu/Disk II cables.

### Using the Apple III external floppy port
You can connect the adapter to the external floppy port at the rear of your Apple III.

* **Disk II**: When using the external floppy port, the connected disk II drive acts as the system's "drive #2" (".D2", which confusingly is sometimes also refered to as "**external** drive #1").
* **FloppyEmu**: When connecting a FloppyEmu, you can enable its dual drive support. In this case your FloppyEmu will emulate the system "drive #2" and "drive #3" (".D2" and ".D3" - which are sometimes also called "**external** drives #1 and #2"). So, including the internal drive, you then have three floppy drives connected to your Apple III.

![Apple III external floppy port](/Images/AppleIII_external_floppy_port.jpg)

### Using the Apple III internal floppy port
The internal port connects the boot drive (system drive #1).
You can simply unplug the installed ribbon cable from the internal drive and plug it to the adapter's Apple III port.
No extra cable is required.
![Apple III internal floppy cable](/Images/AppleIII_internal_floppy_cable.jpg)
![Apple III internal floppy cable](/Images/Adapter_internal_floppy_cable.jpg)

When using the internal Apple III floppy port, the connected drive acts as drive #1 (".D1", boot drive).
The internal port does not support the signals for the external drives, however.
So, unfortunately you cannot make use of FloppyEmu's dual drive support to also emulate drive #2, when using the internal connector.

If you connect a new cable to the mainboard: the internal port is located on the mainboard right next to the external port:
![Apple III internal floppy cable](/Images/AppleIII_internal_floppy_port.jpg)

## Parts List
Parts list for the completed PCB:
* 1x 20pin box header
* 1x 26pin box header
* 1x 470 Ohm resistor
* PCB (see Gerber files below)

![Adapter parts list](/Images/Adapter_parts_list.jpg)

Additionally, if you wanted to use Apple III's external floppy port, you may need a short 26pin ribbon cable with appropriate IDC sockets.
* 2x 26-pin IDC socket (with strain relief)
* 1x 26pin ribbon cable (a few inches/centimers are enough)

![Short 26wire ribbon cable](/Images/RibbonCable.jpg)

A very short ribbon cable will be enough for the external port (since your disk II/floppyEmu already comes with a long ribbon cable). Note, if you have any wider ribbon cables, you can easily reduce them to the appropriate wire count (so you would not need to shop an entire roll of new 26-write ribbon cable).

If you make your own ribbon cable: **MAKE SURE THE IDC SOCKETS ARE ORIENTED CONSISTENTLY!** Do not flip or reverse the orientation of the connectors (place them on the same side of the ribbon cable and with the notch facing the same direction).

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
* **JP2, JP3**: These jumpers connect -12V and +12V to the 20pin floppy header. These voltage supplies are required for the Apple disk II drive. But they are not required by FloppyEmu. It's recommended to leave these jumpers open if you intend to only connect a FloppyEmu. But they have to be closed when you wanted to connect an original disk II drive.

![Jumpers on the Apple III disk II adapter](/Images/AppleIII_adapter_jumper.png)

## Installation
Make sure the Apple III is switched off.

**DO NOT CONNECT THE ADAPTER, THE DISK II or FLOPPY EMU WHILE YOUR MACHINE IS POWERED!**

* Connect the adapter to the external floppy port at the rear of your Apple III (26pin ribbon cable required). Alternatively, connect it to the internal floppy port: pull the 26pin ribbon cable from the internal disk drive and plug it into the adapter.
* Finally connect disk II's or FloppyEmu's ribbon cable to the adapter.

![AppleIIIWithFloppyEmu](/Images/AppleIII_floppy_emu.jpg)

### Configuring the System for Three Drives

If you connect the FloppyEmu to the external connector, your system has three drives (the internal disk drive, and two external drives emulated by FloppyEmu).
However, with Apple's "SOS" operating system it is necessary to configure the system to make the third drive work (in case it is configured to two drives only).

Here are some hints on how to configure the Apple III:

* Use the "system utilities" disk.
* Enter the "System Configuration Program (SCP)".
* Select "Read a Driver File" to read ".D1/sos.driver".
* Select "Change System Parameters".
* Set "Number of Disk III Drives" to 3 (or 4...).
* Select "Generate New System" and write the new configuration to ".D1/sos.driver"

Yes, the configuration of the Apple III is rather inconvenient. :)
And make sure you have a backup of your boot disk, before you reconfigure anything.

![Apple SCP - generate new system](/Images/AppleIII_scp_generate_system.jpg)

![Apple SCP - change number of drives](/Images/AppleIII_scp_change_drives.jpg)

## Schematics and KiCad Project
The [KiCad](/KiCad/) folder contains the schematics and PCB project files, if you wished to adapt the design.

![Schematics of the adapter](/Images/AppleIII_diskII_adapter_schematics.png)

