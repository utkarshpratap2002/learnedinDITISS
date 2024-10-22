# MacOS Installation

Installing macOS requires an understanding of several hardware and kernel boot specifications. The key requirements, such as kernel boot flags and hardware configurations, are detailed below.

### Kernel Boot Specifications

One of the primary parameters for macOS installation is the **kernel boot specification**, which includes parameters like `-v`, specifying verbose mode during boot. This allows you to see detailed output, making it easier to debug issues during the installation process.

The **CPU requirements** involve configuring **at least 2 CPUs** to ensure smooth performance. Modern versions of macOS require multiple CPU cores to effectively distribute workloads, making dual-core or higher configurations optimal. The concept of **Bus Ratio** also plays a vital role here. The **Bus Ratio** represents the relationship between the **Front Side Bus (FSB)** and the **Back Side Bus (BSB)**:
- The **FSB** runs between the CPU and the chipset, managing data communication between the CPU and the motherboard components.
- The **BSB** is responsible for handling communication between the CPU and the system memory (RAM).

To calculate the **Bus Ratio**, you use the formula:

\[ \text{Bus Ratio} = \frac{\text{CPU Speed}}{\text{RAM Speed}} \]

This ratio ensures efficient data flow between the CPU and memory, which is essential for the macOS kernel to communicate effectively with hardware.

### Prerequisites for macOS Installation

There are a number of prerequisites to prepare the hardware and system configuration before installing macOS. Below are the requirements:

- **Dedicated Machine**: macOS requires its own dedicated machine for installation. Unlike Linux or Windows, you cannot run macOS on a typical virtual machine efficiently, due to strict hardware compatibility requirements and Apple's system-specific optimizations.
  
- **Primary Disk**: macOS must be installed on a **primary disk**, which ensures that the disk takes precedence during system boot. This allows the system to directly interact with the macOS kernel without relying on secondary drives.

- **GPT (GUID Partition Table)**: macOS requires the use of **GPT** for disk partitioning. GPT is a modern partitioning system that supports larger disk sizes compared to the older **MBR (Master Boot Record)**. It is a prerequisite for running macOS with UEFI, enabling advanced features like secure boot and support for larger hard drives.

The above prerequisites need to be implemented on the first disk only, ensuring that macOS is always the primary OS on the system, thus avoiding compatibility or boot management issues.

### Logic Boards and Power Configuration

The installation process also necessitates specific **logic boards**. In the case of macOS, **ASUS** provides motherboards that are compatible, and these motherboards are customized to meet macOS's unique requirements. The configuration of **Logic Boards** and **Logic Cards** forms the core of how macOS interacts with hardware components. 

One key differentiator in macOS systems compared to others is the **Power Configuration**. macOS uses specific power management settings, which differ from other operating systems. To make the system compatible with macOS, you need to manipulate the **SSDT (Secondary System Descriptor Table)** and **DSDT (Differentiated System Descriptor Table)**. These tables provide detailed power management configurations and define how different components interact with the operating system during power states, including sleep and hibernate modes.

### Technical Language and Kernel Extensions

- **ACPI Machine Language (AML)**: The **ACPI Machine Language** is used to make changes to the system tables for macOS installation. ACPI defines power and thermal management, among other functions, and writing in **AML** allows for customized configurations that enable macOS to recognize the hardware accurately.

- **HCL (Hardware Compatibility List)**: A **Hardware Compatibility List** is crucial when determining which hardware components are compatible with macOS. This ensures that all peripherals, processors, and other hardware are supported, leading to fewer issues during and after installation.

- **Kext (Kernel Extensions)**: macOS relies on **Kexts**, which are kernel extensions that function as device drivers. They enable the operating system to communicate with hardware peripherals like graphics cards, audio interfaces, and network adapters. Installing the correct **Kexts** is crucial to ensure that your hardware operates smoothly. If incompatible Kexts are used, it can lead to kernel panics or dysfunctional hardware components.

### Installation Options and Best Practices

There are multiple methods you can follow when installing macOS. The most common approach is to use boot flags to make the installation smoother. Boot flags like `-v` (for verbose mode) are used to diagnose issues during installation. Other flags may include settings for safe mode, single-user mode, or custom device settings.

For those building a **Hackintosh**—installing macOS on non-Apple hardware—careful attention is required to create a system with components listed on the **HCL**. Choosing the right hardware that is compatible with macOS will reduce the likelihood of hardware conflicts. Additionally, configuring the SSDT and DSDT tables correctly will help manage power effectively, resulting in fewer errors during the installation process.

When preparing a system for macOS, it’s also advisable to:
- **Use a dedicated disk with GPT**: This ensures that macOS can take full advantage of disk space and features.
- **Use compatible hardware**: Checking the **HCL** guarantees compatibility, which is critical for maintaining stability and performance.
- **Modify system tables (SSDT/DSDT)**: Accurate configuration of these tables is needed to manage power effectively and ensure that all hardware works as expected.

### Summary

Installing macOS, especially on non-Apple hardware, requires careful planning and configuration. From understanding the **Bus Ratio** to modifying **power configuration tables** (SSDT and DSDT), every step plays a crucial role in ensuring that macOS installs and runs smoothly. Selecting compatible hardware components, setting the correct **boot flags**, and installing the appropriate **Kexts** are all essential tasks that determine the overall success of the installation.

By following the steps outlined and ensuring that all prerequisites are met, you can create a stable macOS environment that leverages its powerful capabilities, regardless of whether you're using official Apple hardware or a Hackintosh.

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




