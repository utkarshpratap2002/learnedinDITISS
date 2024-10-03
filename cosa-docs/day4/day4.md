# Internal & External Commands

Basically there are two types of commands:
- Internal Commands
- External Commands

| Internal Cmds   | External Commands |
|-----------------|-------------------|
|These cmds are implemented in the shell program itself| Theses commands are implenmented seperately|
|These cmds don't have any executable on harddisk  | These cmds are available on harddisk such as /bin, /sbin, /usr/sbin|

You can use `type` command to check whether command is internal or external, it tells what kind of command is it, whether it is stored on some **path** or it would tell you that it is **builtin** with the shell.

```
❯ type cd
cd is a shell builtin
❯ type mkdir
mkdir is /bin/mkdir
❯ type ls
ls is an alias for ls -G
```

Then there is **`which`** cmd that tells what path the cmd has. You can also use `whereis` to know the mannual page and the cmd location of the where is.

```
❯ whereis alias
alias: /usr/bin/alias /usr/share/man/man1/builtin.1
```

These commands are builtin within the shell only, there is no executable logics are written within the shell only, therefore you won't see their directory. **Shell** itself is a never ending process, and thus it only ends once you end the kernal or cmd prompt process, otherwise one after another cmd shell returns back to you.

#### `open` is just like double-click

When you open a file, it opens the file using the magic number of the file through which it is able to recognise the 

#### `objdumb` and `readelf` for reading executable files

Baiscally you can read the executable files of the processes and functions used and other memory management information.

Feel free to visit information page.

#### `man bash` 

You can use `man bash` to seach for builtin commands.

#### Synchroneous Execution of Commands

The shell program waits until the program that you've entered or that you are running, say if there is a cmd like `ls` only when ls is done, the shell will return. It is same as `cat` that synchroneously execute after reading from stdout and write onto the stdout.

#### Asynchroneous Execution 

When you are executing cmd like `cat`, cat is synchroneous, but when you use the `&` after cat, you are telling the shell to not wait for the **`cat`** cmd. 

```
❯ cat &
[1] 14979
[1]  + 14979 suspended (tty input)  cat
```

Shell hasn't teminated the `cat` cmd yet.

```
14979 ttys001    0:00.00 cat
```

When you do *Contrl + C*, the process gets terminated and the shell returns backk to you. It is possible through the **SIGINT** which is an number 2 signal that stops the signal. Then, there is **SIGCONT**, another signal that is used to continue the process. *Similarly, there are many*, such that when you use `kill -l` that shows other various signals.

Remember `kill` and `pkill` are used to send the signals, they never stops or teminate the processes. 

```
❯ kill -2 14979
[1]  + 14979 interrupt  cat 
```
You can also use the cmd like `kill -SIGKILL` *process-id* to send the signals of the respective type.
```
```

Another is `pkill` that us used to send the signal to the processes using the porcess name. 
```
❯ pkill -9 cat
```
In case you need to kill the process we need `pkill` and `kill` both have there own way of using the commands as there can be different requirement for both of them.

Another cmd is using the `;` and `&&` most of the time you won't see the difference between the two but incase the first command will fail the execution of the second cmd will not occur.
```
command1 ; command2
command1 && command2
```
Then there is `&&`, `command2` will not be executed if there is failure of the `command1` but in case of the `;` this won't affect the execution of both.

# Types of Operating System

OS used on Servers are different from that ofthe OSs used on the Desktop, as there is difference of requirement and different perspective work on them. **Desktops** are majorly focused on Through-put (Amount of work done), and real-time complexity. 

- Hand-held Devices
- Embedded Devices, mostly **linux** operating system is used, it is very popular used in these devices.
- Real-time OS, where timing is very important, result calculation is important along with the calculated time, and it is also used in the Automation systems, as they are expected to be accurate and within the time.
- Distributed Systems - distributed operating system is to devide the task over the multiple machines, also needs to distribute equal load to every machine.

#### Resident Monitors

Back in days of the 1950s the Operating systems were called **resident monitor** and were having only two functions :

- Hardware Extraction - It only use to deal with hardware, like using punch cards and other resources.
- Program Monitor - Its job was only to monitor the contorl panel, as the program were to be inserted and extracted out after the use. It was the job of **operator**, *real busy guy*.

#### Batch System

It was called batch system because the operatoer could sibmit all the batches of programs at once. Operating system were given batches, the punch cards were inserted one after another and were executed the same way as that of the Resident Monitor.


<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<storng>Note:</storng> There are two types of programs that are exxecuted on system.
</div>
<br> 

#### Multiprogramming system

In **multiple** progamming system, there are multiple programs are loaded inside the memory. Therefore there is degree of multiple programming, meaning number of programs loaded inside the memory, similar to our example, therare four prgrams loaded inside the memory. 

As there are two different concept for the logical execution of programs one is I/O and another is CPU, there are different codes written for I/O and for CPU is different. Therefore, the code executed on CPU is called CPU burst and process spending time on I/O is called I/o burst. And every process is **combinatin of both**.

Therefore there are two types of process:

- If CPU time is greater that I/O time, then that process is called CPU bound process.
- If the I/ time id greater than CPU time, then that process is called I/O bound process.

But there can be **problem**, if same kind of processes are loaded inside the RAM, then there will one part sitting without doing any job, therfore, **mixture** of CPU bound and I/O bound processes is loaded inside the RAM.

*Who will do the selection of Processes?* Its the job of **job scheduler**, that manages the jobs that needs to be picked in order to select the process from the listed programs. **Selection of submitted processes**.

*Who will do the selection of CPU processes?* It does the **selection of process that are inside the RAM**. But becuase the biggest job is of the the **job scheduler**, and that CPU scheduler comes in action for a very short period of time. Therefore the CPU scheduler is called **short-term scheduler**.

Today we don't have **job scheduler**, because it was the demand of that time, when RAM was quite less. 

#### Time Sharing System / Multitasking

In this kind, there is Shared CPU time in all the processes of memory, therefore due to this the response time reduced to less than one sec.

There are two types of Time sharing system:

- Process based Multitasking, is called the paradigm of multitaksing where there is no logical relation between the three different processes running.
  - You can consider a three running application within your **system**, you system is managing these three application, and you won't have problem running these three apps simultaneously. 
- Thread based Multitasking, also called mutlithreading. 
  - But in case of the Multithreading, there is one application, and within that app or call it **process**, there are other processes running **parallely** within that application itself, then that is called **thread-based multitasking**.

Focus is not to understand the different between process or multithreading, but it is to know what is multitasking and how it is done within the **system** and **process**.

# Multitasking within System v/s Proceess

Thread is called **lightweight proceesses**, as when a process is created, there is another similar to PCB created for the thread with **limited information**, as there is only few information related to the **scheduling**.

#### TCB (Thread Control Block)

- *Lets understand it in more details.* When a process is created there is PCB created along with lots of information that is loaded into the RAM.  

- But when thread is created, with creation of every thread, there is another **stack** for that respective thread. 
- This means when the thread is created, there is **stack** added to the **memory** along with its **TCB**.

*There is another secret destined to be reviled.* **CPU scheduling** is only and only performed on threads, not processes. CPU is only destined to schedule threads. Whenever there is application opened within the system, there is only a single entity of thread created within the process. *Processes doesn't have to anything with the CPU scheduling*. 

THread is a live entity which is executed inside the container and the process the container starts running when you initiate a process.

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note:</strong> There are various analogies that should be used in order to explain things.
</div>
<br> 

# Multi-User Systems

A **Terminal** that is connected to ever other user or machine and is controlled using that. Thus, though **Terminal** every other machine or user is connected with the single system. Maximum of **7** terminals can be connected, that is 7 real terminals. 

`tty` is represented as one terminal that is used in order to create a multiuser environment. This is called the **real terminal** and **sudo terminals**. Thus, there can be many sudo terminals within one real terminal.

- Use the `tty` to know which terminal is being used within the system.
    ```
    ❯ tty
    /dev/ttys001
    ```
- Use `whoami` you can see the name of currently logged in user. Analogeous to this one, use `who am i` to get mor info of the user currently logged in.
- User `who` you will see all the possible terminals who are logged in.
    ```
    ❯ who
    utkarshsingh     console      Sep 28 04:19 
    utkarshsingh     ttys000      Sep 30 11:55 
    utkarshsingh     ttys001      Sep 30 12:58 
    ```
- Use `w` to see even more information about the users
    ```
    ❯ w
    11:42  up 3 days,  7:24, 3 users, load averages: 1.21 1.34 1.31
    USER       TTY      FROM    LOGIN@  IDLE WHAT
    utkarshsin console  -      Sat04   3days -
    utkarshsin s000     -      Mon11    2:54 -zsh
    utkarshsin s001     -      Mon12       - w
    ```

These commands can be used on system to get useful information.

# Multi-Process System

The concept of multicore precoessors started comming into the picture, as they had multiple processor called a multi-core processors that were on single **chip**.

The main thing about the multi-processes is that now OS start scheduling the proceses to the **multiple processors**. Now this part also has two types:

- Asymmetric Processing
- Symmetric Processing

# `grep`- GNU Regular Expression Parser

Used for **searching pattern**, can be used in the given below syntax:
```
grep [options] <pattern> <filename>
```

#### `grep -w "pattern" taste.txt`

Used for the display the exact word or exact pattern, so it will only show the selected pattern specified.

#### `grep -n "pattern" filname`

It'll show the result on each line within the text, along with the line number.

#### `grep -v "pattern" taste.txt`

All the lines that do not have the pattern in it will be displayed.

#### `grep -i "pattern" taste.txt`

This will ignore the case sentivity and will display irrespective of it existence in uppercase or lowercase.

#### `grep "^pattern" filename.txt`

It will check for the *pattern* character-by-character, meaning it will check if ther are spaces after, then also it will reject the word, even if there is *pattern*.

#### `grep "pattern$" filename.txt`

It will list all the lines that are ending with the *pattern*.

#### `grep "^pattern$" filename.txt`

It will show all the lines that contains only *pattern* in the whole line.

#### `grep "b[aeu]g" filename.txt`

It will list all the combination including a,e,u, as given the command.


##### `grep "b[^aeu]g" filename.txt`

It will list all the lines excluding **a**, **e**, **u**.

#### `grep "b.g" filename.txt`

It will include all the characters between **b** and **g**.

#### `grep "b\*q" filename.txt`

The `\` is used to escape the `*` character such that it is used as escape character.

#### `grep "b[*]q" select.txt`

Anything inside the `[]` does not have any meaning so it will act as **fixed** pattern character.

#### `grep -F "b*g" select.txt`


#### `fgrep "b*g" select.txt`



```
grep "b*g" repeat.txt
grep -E "ba?g" repeat.txt
egrep "ba?g" repeat.txt
egrep "ba+g" repeat.txt
egrep "ba{4}g" repeat.txt
egrep "ba{4,6}g" repeat.txt
egrep "ba{4,}g" repeat.txt
egrep "ba{,4}g" repeat.txt
egrep "b[aa]g" repeat.txt
egrep "b(aa)g" repeat.txt
egrep "b(aa){2}g" repeat.txt
egrep "b[aa]{2}g" repeat.txt
egrep "b[aa]g" repeat.txt
egrep "(good|cake)" taste.txt
egrep "good|cake" taste.txt
```

# `cut` 














