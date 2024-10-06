# What is `task_struct`?

**`task_struct`** is the critical data type in **Linux** used in the creation of PCB (Process Control Block), typically size of **4KB**. It stores all the necessary information about the process that kernel needs while execution. It has **pid**, **ppid**, **schedulign info**, **memory management (heap, stack, virtual memory)**, **timers**, and **file descriptor table**. 

PCB is called sometimes **uarea**, sometimes it is called **Process Descriptor**. Remember when `ps -e` use to show all thelist of the running processes in the memory, it is becuase there is a process list maintained by the system. There are various data structure that OS uses:

- **Job queue/ Process list** - contains the `init_task` head that maintain all the process running in the memory. 
- **Ready Queue** - CPU scheduler chooses from the **Ready queue** during the selection of processes that are ready to be executed. 
- **Waiting queues** - As it has a *plural sense* becuase there are various waiting queues, as it contains the processes that are waiting
- there can be multiple waiting queues, per device, as therr can be waiting queue for pendrive as well as for keyboard there are another waiting queue

# What is command redirection?

The commands below shows how the [redirection](cosa-docs/redirection/redirection.md) is taking place at `wc < testing.txt`, but this case explicates the **input redirection**, normally the first command when executed it was tkaing the input fromthe std input, via keyboard, but on the second command was taking the input from the desgnated file that we passed it.

```
❯ wc
hello sunbeam
waiting for input
taking input from std input
       3      10      60
❯ wc < testing.txt
       6      43     275
```

Similarly you can perform the input and output redirection at once, using the below command:
```
❯ wc < testing.txt > output-testing.txt
❯ ls
day1               day3               next_testing.txt   testing.txt
day2               linux-commands     output-testing.txt
❯ cat output-testing.txt
       6      43     275

```

This is how the redirection works, you can also specify the **error redirection**, thus, **2>&1** redirecting the std error to the std output.

```
❯ wc -p < testing.txt >> output-testing.txt 2>&1
❯ cat output-testing.txt
       6      43     275
wc: illegal option -- p
usage: wc [-Lclmw] [file ...]
```

# How the Redirection stuff works?

By default three key **file descriptors** are always open for every process and PCB have its pointer on the file descriptor `0` **stdin**, `1` **stdout**, and `2` **stderr**. 

When we are performing [**redirection**](../redirection/redirection.md#redirection) the fiel descriptors are swapped with the specified file when we are making the redirection. In that case `dup()` system call is made to swap the pointers of the PCB from **std output** with the file specified.

```
commmand > output.txt
```

Remember initially the file descriptor `1` **stdout** was associated with the terminal to produce the output, but after the `dup()` function call take place the file descriptor `1` is pointing to the `output.txt`. So the output that was meant to go to **stdout** is now directed to **`output.txt`**.

**Pipe** is called IPC (Inter-Process Communication) that allows two programs to communicate with each. Pipe works by connection the **stdout** of one process to **stdin** of another process. 

```
command1 | command2
```

The pipe operator **|** logically connects the **stdout** of command1 with the **stdin** of the command2. 

- Basically the command1 will generte the **stdout**
- The **stdout** of the command1 will be directed as **stdin** of the command2
- command2 will then take **stdin** and will generate the **stdout**

The shell sets up this using the `pipe()` system call, one **writing** to the pipe connected to command1 (stdout) and another **reading** to the pipe connectd to command2 (stdin).

#### How does `sort number.txt > fifo` and `uniq < fifo` is working?

`sort number.txt > fifo` is writing inside the **fifo** which is getting replaced by the **stdin**, system will refer to **fifo** instead of the standard input. Once the data is written in the **fifo**, when you use `uniq < fifo` in that case there is another process created inside the system that will pass the standard output to the **fifo**.

#### How does `sort number.txt | uniq` is working?

Because both the command are of the same parent command, there is an 64 KB buffer that is called **circular buffer**, that contain two file descriptors, one is read, another is write descriptor. Remember whenever you'll pass the command, your shell will decide based on parameters such as **CPU scheduling**, theh type of **Shell** that yor using. 

If we are talking about pipe, the only thing is that these processes will read and write only once while communicating with the **Circular Buffer**.

Lets consider an example:

```
head -8 number.txt | tail -5
cat -n number.txt | head -8 | tail -5
head -n -7 number.txt 
```

- `head -n -7 number.txt `, the `-` before 7 means that it'll give the answer leaving the last 7 lines. 
- `tail -n +5 number.txt`, the `+` indicates that it'll leave the first five lines and rest will be answer.

```
cat -n number.txt | head -8 | tail -n 4
cat -n number.txt | head -8 | tail -n +4
```

- This is called **nesting** of head and tail.
<br>

- Similarly we can use `tr` command manipulating the standard input and output using the **pipe**. You might feel replacing the characters that are repetitive, so you can use `-s` command.

```
❯ echo "hllo reva" | tr " " "#"
hllo#reva
❯ echo "hllo              reva" | tr -s " "
hllo reva
❯ echo "hllo reva" | tr 'hllo' 'helloe'
hello reva
❯ echo "hello reva" | tr "a-z" "A-Z"
HELLO REVA
❯ echo 'Hello DITISS' | tr "A-Z|a-z" "a-z|A-Z"
hELLO ditiss
```

# Meta character of Shell

- The first meta character of shell is `*`, meaning it will *include all*. The below is given the usage of the meta character:

    ```
    ❯ ls
    day1               day3               next_testing.txt   testing.txt
    day2               linux-commands     output-testing.txt
    ❯ ls *.txt
    next_testing.txt   output-testing.txt testing.txt
    ```
- There is `?`, which means it *include single occurence*. It is used as below:
    ```
    ❯ ls day?
    day1:
    day1.drawio   day1.md       techniques.md

    day2:
    day2.drawio            day2.md                program-loading.png    program-to-process.png

    day3:
    day3.drawio day3.md
    ```
- There is another specified as `;` that is to include all the commands at a time, used as shown below:
    ```
    ❯ ls ; pwd
    day1               day3               next_testing.txt   testing.txt
    day2               linux-commands     output-testing.txt
    /Users/utkarshsingh/Documents/learnedinDITISS/cosa-docs
    ```

Remember that these are characters are also called **Wildcard Characters**. 

# `chmod`

`chmod` is used to change the permission of the files and folders. Remember the **chmod** can be used in following ways:

- to remove all the permissions of the file
    ```
    ❯ ls -la testing.txt
    -rw-r--r--  1 utkarshsingh  staff  275 Sep 30 05:42 testing.txt
    ❯ chmod 0 testing.txt
    ❯ ls -la testing.txt
    -r--------  1 utkarshsingh  staff  275 Sep 30 05:42 testing.txt
    ```

- Use **`+`*permission* (r/w/x)** or `-` to add or remove the read, write, and execute permissions of the file. This can be done using the following:

```
❯ ls -la testing.txt
-r-xr-xr-x  1 utkarshsingh  staff  275 Sep 30 05:42 testing.txt
❯ chmod -x testing.txt
❯ ls -la testing.txt
-r--r--r--  1 utkarshsingh  staff  275 Sep 30 05:42 testing.txt
```

- You can use `u+`*permission* in order to assign the respective level permission. For example, `g+rw`, `u+rw`, `g-rw` etc.
- You can also specify the **octal** method by providing the permission using the octal numbers. For example, `chmod 777 filename.txt`, `chmod 644 filename.txt` etc.
- Remember that you won't be able to navigate the directory if it doesn't have any executable permisssion, so you need the file executable permission to even navigate the directory.

# `chown` 

- You can use `chown` cmd in order to change the permission of ownership of the file. You need to remember that it is only through the **super user priveledge** to change the ownership of file.
    ```
    ❯ chown root next_testing.txt
    chown: next_testing.txt: Operation not permitted
    ❯ sudo chown root next_testing.txt
    ❯ ls -la next_testing.txt
    -r--------  1 root  staff  72 Sep 30 05:45 next_testing.txt
    ```

- Remember if you changed the ownership of the directory, it doesn't mean that it changes the permission of the content inside the directory, so in that case you might need `-R` which will change the permission within the directory **recursively**.

# `find`

- `find` allows you to search for particular pattern or **name** within the path or directory, using the syntax as given:
    ```
    find <path> -name <pattern>
    ```

- If you can specify the `.` and it will search for the pattern within the current working directory and its subdirectories. 
    ```
    ❯ find . -name "*.txt"
    ./testing.txt
    ❯ find . -name "*.md"
    ./linux-commands/life-cmds.md
    ./day3/day3.md
    ```
- Thus in the above example, we are using **wildcard** mask that is searching for all the .txt or .md files files within the path specified. Here in the below section we've used **~** that means search for pattern in the home directory.
    ```
    ❯ find ~ -name "*.md"
    /Users/utkarshsingh/.oh-my-zsh/CONTRIBUTING.md
    /Users/utkarshsingh/.oh-my-zsh/.github/PULL_REQUEST_TEMPLATE.md
    ....
    ```
- You can simplify your seach based on the **size** using the `-size` option in the `find`. The search will be based on the size of the file within the path specified or the current working directory.

    ```
    ❯ find . -size +200k
    ./Day03_Diagrams.pdf
    ```
-  
















