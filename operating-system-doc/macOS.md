# MacOS Installation

MacOS installation happens in several ways, blow is the kernel boot specification that are needed:

- **-v** 
- **CPUs == 2**
- **Bus Ratio** - It is Front side bus and Back side bus, and for every laptop and computer is different.
  - The one that runs to CPU is FSB
  - The one that runs to the RAM is BSB

The formula for calculation of the Bus Ratio can be calculated using = CPU/RAM speed.

There are various prerequisite for installing the **MacOS**:

- **It needs its own Machine**
- **Primary Disk**
- **First**
- **GPT**

Thus for each condition we need to implement them on the first disk only.

- **Logic Boards** - **ASUS** sells the motherboard to the mac and that same motherboard ASUS make them to 
- **Logic Cards**

The major difference between between what MacOS is **Power Configuration** and this configuration is what makes mac different from the other vendors. Thus, you need to manipulate **SSDT Table** and **DSDT Table** in order to change the settings of the machine. Apart from that:

- **ACPI Machine Language** - This is the language that is to be imlemented in order to make the installation.

- **AML** - 

- **HCL (Hardware Combatible list)** - It is the partition for 

- **Kext (kernel Extension)** - Mac device drivers are called Kext, such that it is called Kext, so that you can choose the best device driver for your mac.

There are four options you have to go with Mac:

- **Use the following 

# GPT (GUID Partitioning Table)
GPT is part of EFI speacification, and it comes from the EFI, the maximum disk allowed is 8 ZB, 

| | |
|-|-|
|2^10 | KB|
|2^20 | MB|
|2^30 | GB|
|2^40 | TB|
|2^50 | PB|
|2^60 | XB|
|2^70 | ZB|
|2^80 | YB|
|2^90 | BB|
|2^100 | JB|

- **120 Partition** 

- **Backward Combatibilty is MBR**, if corrupted there can be backup for the partition will be there. Thus, there is another way to 

- **Every partition is given a unique identifier**, for every partition of the GUID has included unique partitioning of all the parameters and therefore it is called GUID.

# MacOS Installation


- **DS-MOS (Don't Steel Mac OS)** is important as if it won't be able to start with the installation process.

- **QECI (Quard Extreme Code Image)** - If you've enabled and all the screensavers will run smooth, if QECI is not detectable and therefore it won't be working.

# EFI (Extensible Firmware Infrastructure) 

- **Intel Boot Iitiative** 
  - BIOS was going to have trouble as the size was very limited factor and therefore **Intel** initated and **IBI (Intel Boot Initiating)**, which collaborated with the **EFI** system, primarily focussed on 64-bit machine.
  - Itanium - x64 was the first Intel architecture which came out in 2005. 
  - Initially there was EFI, later Intel came out publishing the newer and public version of the UEFI (2.8) called as **Unified EFI**.
  - The difference between UEFI and BIOS, is such that instead of BIOS, but now it is EFI. It is Extensible Firmware Infrastructure.
  - If you've observed while booting process there are two kinds of booting, one is modern booting and another is legacy booting.

Today BIOS is very enhanced because of the EFI:

- You can have Good Interface.
- Then you could also have good networking support
- Then you can have multi-language
- It is diognostics support on the system
- Infact before the original OS starts, those programs will start running along with the startup of BIOS, this is called EFI. 
- Thus you can create your own programming and keep it inside the BIOS and therefore you can go and write thes programming which will be saved inside the **`.efi`** extension.
- Remember that these **`.efi`** files are available on .
- Remember all these boot loader programs are kept inside the **EFI** space, i.e., roughly of **1.05GB** typically.
- Second, there is another feature which is **Secure Boot**, which came out in EFI only.
- There has to be a proper installation 

ALmost all the files partitions are stored in EFI. 

- Remember that **EPBR** is where the all information of the starting point and ending point of the partitioning is stored. 




