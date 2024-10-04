# Kernel Types

Kernel is the binary file of one executable binary of the programs for different management systems of the OS. This kind of kernel is called **monolithic** kernel.

### A good Story of Compilation

Whenever you compile a file into an executable binary, remember there are two steps to note, one is the `.o` file and another is `.exec/out` file, `.exec/out` is the file that is used by the loader to load the file. You just can't go and put the `.o` file into the memory because it doesn't have any **executable header**. Executbale header is added by **linker**, linker is the one that adds the **executbale header**, and therefore when ther is such `.c` file ther is and `.o` file created for every such `.c` file and then linker links all those connected file into the `.exec/out` executable binary file.

Similar to this there are different functinalities are programmed seperatly and therefore for every functinality different file is created and different `.o` file is created and then is linked to form a `.exec` file and is loaded in memory, therefore the size of file is **large**.

But there is possible to load all the functinality seperately, only few programs are loaded together but reset other functinalities such as **I/O**, **Memory Maangement**, **Network Management**, and other **Visual Management** are implemented seperately, this is called **micro** kernel. Becaause now every porgram is implemetned seprately, there still will be one process for all the programs written, so in one **container** there will be multiple **threads** in the kernel. Therefore remember that there will be only container running, which will be must faster than the **monolithic** kernel.

- *Now, which one is said to be more flexible and easy to maintain?* Of course, there is **micro** kernel which is easy to maintain becuase there are various functinalities are implemented so we don't need to change the whole design while we do in any one of them. 

- *But you need to note*, that is easy to see that **monolithic** kernel is much more faster becuase there are one only file loaded so this prevent any chances of **IPC**, but *dont forget that **micro** kernle is very easy to maintain*.

### Dynamically Loaded Modules

Everytime any of the functionality of the OS is needed, that module is loaded into the memeory dynamically into the memory, due to this module implementaion of the functinalities, we call it **modular** kernel. 

Because every other functionality is getting loaded at the runtime, it is much more efficient than that of the **micro** kernel, though, ofcourse the **monolithic** kernel is much more faster because there is only file that needs to be maintained, but then it is not that **maintainable**.

# What linux kernel uses?

Linux kernel uses the combination of all the kernel types, if you see there are few important functinalities that are used and are loaded all the time so those functionalities are added into **static components**, those functionalites are not used all the time and therfore are not used 

**Linux Kernel = Static Component + Dynamic components + Visual Process servers (XServer)**

|Static      |Dynamic      |Visual Process (Xserver)       |
|------|------|-------|
|Process Management| File system |Visual Process is loaded seperately |
|CPU Management| Device Drivers | |
|Memory Management| | |
|IO Mangement| | |
|File Management| | |
|Hardware Management| | |
|System calls|  | |

#### Static Components

These are static components that are forever present on the memory and are not dynmamcially loaded into the memory during the **runtime**. It can be found in the `/boot` and named as **vmlinuz**.

#### Dynamic Components

These dynamically loaded modules can be seen inside `/lib/modules` and are called `.ko` files. All these components are called **Kernel Objects**, stored in **`/lib/modules/`** `` `uname -r` ``. 

Just as an info, that MacOS terminal is called **Darwin**.

# Loops 

For loops in the shell, you need to consider *four** things:

- **Initialisation**
- **Condition**
- **Body**
- **Modification**/ **Increament**

    ```
    init
    while [ condition ]
    do 
    body
    mod
    done
    ```

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>NOTE</strong> You can use the <code>seq</code> for implememting the sequencing of the numbers and this can help in preventing the number series repetiion. But you need to remember that when you write the <code> for i in seq 10</code>. This won't work, instead, there would be error because what you need is the output of the same command therefore you need to do this <code> for i in `seq 10`</code> that will give hte right output instead of error
</div>
<br> 

#### `select name in collection`

This is another kind of loop where you can collect the value that you need from the values, here you hav more control over the numbers.

```
select name in collection
do 
  body
donei
```







