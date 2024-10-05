# `interrupthandler()`

Interrupt is an trigger that is initiated from the external responses and whenever there is command given from the external resoruces such as Keyboard, Touch screens etc.

```
interrupthandler(){
    #1 Save Execution Context 
    of current process in its PCB

    #2 Find Address of ISR from IVT
    for recieved intrrupt

    #3 Call ISR function

    #4 Restore the Execution COntext
}
```

#### ISRs 

**ISRs (Intrrupt Service Routine)** that stores the function that stores the information on intrrupt actions, such that whenever you initiate a intrrupt it will require some action and all that action programming is done within this ISR. There are multiple ISRs and multiple ISRs action that stores the action to be prformed.

#### IVT (Intrrupt V)

**IVT** is another function that stores the intrrupt number, becuase there are multiple [ISRs](#isrs) and for the respective Intrrupt there is need for the right ISR to be executed, therefore IVT takes that ISR number that it has stored, once that ISR is learned, the command is returned to the `intrruphandler()` function and repective ISR is called accordingly.


Thus, remember that when it comes to the Intrrupt, there are two mode involved within that, that is called **User-Mode** and another is **Kernel-Mode**. **Kernel Mode** is called *Privledged mode* because every other resources is accessible to the kernel and therefore you get limited access on the user-mode. 

Again, kernel mode can access all the assembly language code and hence kernel mode has access to the systems registers, i.e., it is called **Dual Mode** Operation. But that's not only thing about the **Intrrupt**, because it is about the **function calling** that intrrupt initiates.

Working with applications and other things we do on system, always there is **intrrupt** that acts a medium to communicate with **user-mode** and **kernel-mode**.

When Intrrupts are generated there is **TRAP** initiated that taken action and start the `intrrupthandler()` function and therefore remember there is difference when **intrrupt is generated** and **intrrupt function is called**, becuase the CPU executes the **`intrrupthandler()`** function.


# System call API Layer

For every function that we execute on the system behind the scene it is calling **System call API**, these calls are made when there is a library function called by the **user**, it is the first one that **generates the intrrupt**. Remember that this generation of intrrupt is done by **CPU** only and CPU only call `intrrupthandler()` function to resolve the request for the intrrupt. Just like a `open()` file function that is called by the user who is using that function, and then API system call is made
```
# API System Call
open(){
    # Setting
    # switchmode intrrupt handler
}
```

The **API system call**, in our case `open()` function, is doing nothing but calling OS functions to resolve the user-mode functions. There is respective another function in the kernel-mode i.e., ISRs that resolves the system call. 

```
# Intrrupt Function Call
swi_handler(){
    #1 Save Execution Context 
    of current process in its PCB

    #2 Find Address of ISR from IVT
    for recieved intrrupt

    #3 Call ISR function

    #4 Restore the Execution Context
    of the paused process
}
```

Intrrupt actions that are executed by CPU is taken care by the **Intrrupt controller**.   

# Symbolic Links and Hard Links

Whenever a **file** or a **directory** is created there is File control Block is created that keeps the data of the file or directory. It stores the data of the file, in case of directory, there is mention of the number of files and entries, basically has **iNode** number that uniquely identifies the file within the directory. Similarly for directories also have **iNode** number. You can also check the inode number using `ls -li` which will give you result:

```
19738600 drwxr-xr-x  13 utkarshsingh  staff   416 Oct  1 05:58 python-docs
```

So you can think of it like there are entries within the directory and everything that created or exists within the system, there will **inode** and **4Kb** of Data block is given to the files and directory.

Create **Hard link** of file with another file, thus, if you create one you'll see the same inode number of the file, but the **link count** will be changed. Becuase the file with same inode will be given single data block. You can create a hardlink using `ln` ***source-file*** ***target-file***.

```
❯ ls -li file1.txt file3.txt
21870926 -rw-r--r--@ 2 utkarshsingh  staff  0 Oct  4 09:27 file1.txt
21870926 -rw-r--r--@ 2 utkarshsingh  staff  0 Oct  4 09:27 file3.txt
```

If you delete the hard link then you'd notice that there is only one link count. If you create a hardlink then a system call `link()` is made and when you delete the link to unlink you target file `unlink()` is used.

The symbolic link can be created using the **`ln -s`** ***source-file*** ***target-file***, but remember that there is seperate Data block given in this case, it is only that that linked file will be having the path to the **target-file**. 

```
❯ ls -li file4.txt file1.txt
21870926 -rw-r--r--@ 2 utkarshsingh  staff  0 Oct  4 09:27 file1.txt
21871483 lrwxr-xr-x  1 utkarshsingh  staff  9 Oct  4 09:40 file4.txt -> file1.txt
```
Now, if you delete the symbolic source file, the link will be unaccessible and because the link to the file is deleted. But if you created another file on the same path and with the same file name, then it will come **active**.

Remember if there are going to be multiple partitions, refer to [operating system partition](../../operating-system-doc/os-partition.md) to learn more about it, there will be multiple hard links are might not be unique.

# Positional Parameters

|  |  |
|--|--|
|`$*`| All positional arguments|
|`$1`, `$2`, `$3`| Positional Parameters individually|
|`$0`| Name of the script, say `./script27.sh` will give `script27.sh`|
|`$$`| Process ID of current Shell|


# Functions in Shell

The function can be defined using the `name()` and the body should be within the `{ . . . }` as the functions are accessed similar to positional parameters. And another way of defining the function is using prefix `function` before the name. 

```
function print_msg
{
	echo "Hello Neo"
}

addition()
{
	res=`expr $1 + $2`
	echo "$res"
}

print_msg
res=`addition 20 20`
echo "res = $res"
```

Here in the above example there are two parameters passed and are accessible only in the local scope of the function `addition()`.

The concept of Scope can be seen by the fact that when you pass the argument while executing the script directly from the shell and therefore when you do `$1`, it will take the global value from the shell while execution of the script. 

*On the other hand*, if arguments passed with the function as shown below, they would be taken within the shell itself. *Now how you **return** a value?* It can be done using the `echo` command. 

# Array

Lets create an array using implicit declaration of the array, using the following syntax:
```
declare -a arr
```
Use the following syntax for the same:
```
declare -a arr

arr[0]=10
arr[1]=20
arr[2]=30

echo "Array -> ${arr[*]}"
echo "Array -> ${arr[@]}"
```
To get result as given below:
```
Array -> 10 20 30
Array -> 10 20 30
```

Use `#` to print the lenght of the array:
```
Array -> 3
Array -> 3
```

Let see the explicit implementaion of the array, use the following syntax to do the same:
```
arr=(1,2,3,3,4,4)

echo "Number of element : ${arr[*]}"
```
The following below is the output of the syntax:
```
❯ bash ae.sh
Number of element : 1,2,3,3,4,4
```

# Strings

You can use the following command to see if the string is empty of not empty:
```
str="sunbeam"
if [ -z $str ]
then
    echo "$str is empty"
else 
    echo "$str is not empty"
fi
```
You can perform various operation such as concatenation of the strings.

```
str1=Sunbeam
str2=Pune
str=$str1$str2

echo "String = ${str:3}"
echo "3rd Element onwards 4 characters : ${str:3:4}"
```

lets check if the stirng is pallindrome or not:
```
```

The condition that is required for checking the conditional statements is use **`test`**. It tests the **exit status** of the last command. This can be checked using the following command:
```
❯ test 10 -eq 10
❯ echo $?
0
``` 
As you can see that the `echo $?` give you are **zero** value which if it is not, that would mean that the command was not successful. In the below example there is an value displayed as **1** which means that command was not successful.
```
❯ pwd -a
pwd: bad option: -a
❯ echo $?
1
```

# Package installation script

You can use the followoing script to install the packages:

```
pkgs=("vim" "rename" "ncal" "net-tools")

echo "Updating package list!!!
sudo apt-get update
if [ $? -ne 0 ] then
    echo "Package not intalled"
    exit 
done

echo "Installation initiated!"
for pkg in ${pkgs[*]}
do
    echo "Installing package: $pkg"
    sudo apt-get install $pkg
done
```

The scripts are to be used while automating the task and making pre-configurations. 












