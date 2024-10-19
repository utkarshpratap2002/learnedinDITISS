#  Process inside the Memory

When we say that there is process getting scheduled, basically it is thread, a live entity that gets created **by default** when a **process** is created. That thread then starts functioning and CPU scheduler will start performing scheduling on the Threads. Therefore ther eis only thread that gets executed not process.

Then in [day4](cosa-docs/day4/day4.md) we discussed that there different types of processing such as multi-processing, multi-threading, multi-tasking and multi-users.

#### `uname`

This is the command which is called **simultaneous multiprocess**, which is nothing but returns a information on Operating system.

```
❯ uname & uname -r && uname -a
[1] 21570
Darwin
24.0.0
[1]  + 21570 done       uname
Darwin Utkarshs-MacBook-Air.local 24.0.0 Darwin Kernel Version 24.0.0: Mon Aug 12 20:49:48 PDT 2024; root:xnu-11215.1.10~2/RELEASE_ARM64_T8103 arm64
```

We'll try to understand what meant with **Darwin Kernel**. 

# Shell Programming

There arr various editor in the shell, out of which `nano` and `vi` editor commands are very important and crucial, becuase they are powerful and delivers the job. 

#### `rename` *s/old-pattern/new-pattern* *pattern

`rename` can be very efficient while changing the multiple name of the same pattern of files or dirctories. The syntax is given below:
```
rename 's/file/test` *.txt
```
The files as well as folder can be changed, in 
 
#### `ls -la | grep "^d"`

```
❯ ls -la | grep "^d"
drwxr-xr-x  7 utkarshsingh  staff  224 Oct  2 08:40 .
drwxr-xr-x  9 utkarshsingh  staff  288 Oct  2 08:35 ..
drwxr-xr-x  2 utkarshsingh  staff   64 Oct  2 08:40 doc1
drwxr-xr-x  2 utkarshsingh  staff   64 Oct  2 08:40 doc2
```

#### `ls -l | tr -s " " | cut -d ' ' -f1,3,9`

```
❯ ls -l | tr -s " " | cut -d ' ' -f1,3,9
total
drwxr-xr-x utkarshsingh doc1
drwxr-xr-x utkarshsingh doc2
-rw-r--r-- utkarshsingh file1.txt
-rw-r--r-- utkarshsingh file2.txt
-rw-r--r-- utkarshsingh file3.txt
```

We used the `tr` because we needed to remove the extra spaces which we don't want to get insluded in delimiter.

# `vi` Editor

If you don't have it already, use `sudo apt-get install vim`, its a debian based command used for the package managers, thus in MacOS you can `brew isntall vim` you can install the **vim**.

- Now there are various modes of the `vim` editor, one is **command mode**, another is called **text mode** , then there is **visual mode**. 
- Use ***esc*** to for enter into the command mode to give commands, to save, copy, and cut, etc.
- Use ***i*** for getting into the Insert mode to insert, edit, and add content to the file.
- Use ***v*** for getting into the Visual mode.
- By default opens in the **command mode**.
- `:w` is for write the changes but in order to quit use `:q` and therefore you can use `:wq` for write and quite simultaneously.

In order to copy and paster there are different methods in order to copy and paste the lines:

- Use `:y` in the **command mode** in order to copy the line and use *p* to paste the line to another line.
- Use `yy` to copy the current line
- Use `:ny` to copy the *nth* line of the content
- Use `:nyy` to copy the next *n* lines
- Use `n,my ` to copy *n* to *m* lines of the editor 
- Use `:yw` to copy the next word
- Use `y$` to copy th
- Use `p` and `u` to paste and undo 

Replace all the `:y` paradigm with **`d`** and you'll be able to cut the lines from the file. Remember if you didn't paste the lines and saves them, then those lines will **deleted**. 

You can temporarily enable the lines using `:set number` on the command-line mode. Thus, this is temporary so it won't be saved, therefore, go to `~/.vimrc` using the cmd `


# Shell Scripting 

We are here to talk about another **interpreted** progarmming after the [**python**](python-docs/day1.md) as this is also called another interpreted programming. Basically there are commands used for the automation of scripts, configruations settings and creating the security patches. Configuration of servers and cloud. Shell scripts are used for **development** support, thus all the dependencies for the software are given using the shell scripting.

You might ask what is Shell Scripts, *Shell Scripts is set of commands along with programming concepts*. Just like a python file would have a `.py` extension, we need to create a file with `.sh` for the shell scripts.

```
vim script01.sh
```

Once you are done with the file you need to save it and then execute the script using the command below:
```
bash script01.sh
```

You can also run the scripts using the `./script01.sh` but this along won't run the script because there is no execute permission for the same file, therefore you need to give the file execute permission using cmd:

```
chmod +x script01.sh
```

When you run using the `./` convention, there are multiple shells in linux the but the script will run on default shell of the OS. Therefore if you are creating scripts on different shells there could be conflict between cmds.

To prevent the problem, you need to tell your OS to recognise what shell your writing the scripts, use **`#!` *shell-path***, called as **Shebang Line** that tells the OS which **shell** the script is made for. It is not a compulsion, but a convention.

#### Few Things

- Disable the new line in the echo using `-n` that will prevent the new line character.
- A new line character can also be used using `-e` to supress the new after the message, basically enable the escape the sequences.


#### `env`

When you say variables, OS itself have few variables, called **env** variables, it is basically used to create and edit the path for environment. 

If you pass the cmd `env` on the shell you'll observe few environment variables such as:

```
HOME=/Users/utkarshsingh
HOMEBREW_REPOSITORY=/opt/homebrew
``` 
So that the terminal know where to access or refer to any command that you using, that path know what operations can be performed, everything about the command usage an their path vairables knows where the commands are from where they can be accessed. If there is an error on the command, it is becuase the path env is not **initialised** and therefore you need to specify it first.

Just like in Python there is an convention that you can use UPPERCASE for th decalaration of the Environment Variables.

# `man man`

There are various sections in which the system stores the man pages of the commands that are distributed into **9** sections. Therefore when you do `man man` you'll see:

```
     The sections of the manual are:
           1.   General Commands Manual
           2.   System Calls Manual
           3.   Library Functions Manual
           4.   Kernel Interfaces Manual
           5.   File Formats Manual
           6.   Games Manual
           7.   Miscellaneous Information Manual
           8.   System Manager's Manual
           9.   Kernel Developer's Manual
```

Thus, there are **9** sections in which system stores the command information, so some commands are in **general commands mannual** and some are in **administration commands mannual**. So whereever you say `whereis ls` it will show:
```
❯ whereis ls
ls: /bin/ls /usr/share/man/man1/ls.1
```
You can also use number after the `man` to specify which section you need the command from:
```
man 3 printf
``` 

#### `variable=$((expression))` 

You can create a variable using the syntax:
```
variable=value
```

The usage of variable is simple, through `$` before the variable name:
```
echo $variable-name
```

#### `read variable`

You can use the following cmd to read the variable using the `read` command. As in `read` command it is not compulsary to define the variable as before you use them. 

```bash
a="hllo reva!"
echo "it says $a"
```
Remember this with your life that you always need to make sure that there is no spaces left during the variable declaration. If there is space between, then there would be error.

```
❯ ./scr3.sh
it says hllo reva!
```

Before you execute the **script**, you need to make sure that you've given `chmod +x` *filename* permission to the **file**.

#### Arithmatic Calculation

You can also perform the operations such as `*`, `-`, `+`, and `/` using the `expr` or using expressions. Thus, you need to rememebr that these operations can only be performed on integer variables.
```
a=10
b=20

add=$((a+b))
sub=expr $a - $b
mul=expr $a \* $b
div=expr $a / $b
echo "Add : $add"
echo "Sub : $sub"
```
Remember don't use `expr` within the `$(( expression ))`, then you might errror. It is called [command substitution](#command-substitution). 

#### Command Substitution

- Use **`$(command)`** for specifying the result of the command executed
- Else you can use the **`` `command` ``**

```
$(command)
`command`
```

Remember that you can't perform the `expr` operation with floating numbers. Instead take help of `bc` command. 
```
a=10.111
b=20.43242

add=`echo "$a + $b" | bc`
echo "ADD : $add"
``` 
Our motive is not to add the floating numbers, but to show that how the command can be used within shell scripting.

#### Conditions

You can use the following syntax for the creation of **if-else** block in order:

```
if [ condition ]; then
    ...
elif [ condition ]; then
    ...
else 
    ...
fi
```

#### Numerica Comparison

Similarly there can be relational operators are `-eq`, `-ne`, `-lt`, `-gt`, `-le`, and `-ge` and logical operators such as `-a`, `-o`, `!`.

#### File Test

Similar to relational and logical there are file operations:

- `-e "$file-path"` - This checks whether *file-path* is valid or not.
- `-d "$file-path"` - This check if the file is *directory*.
- `-f "$file-path"` - This tells if the file is regular file.
- `-r "$file-path"` - This tells if file is *readable*.
- `-w "$file-path"` - This tells if file is *writable*.
- `-x "$file-path"` - This tells if file is *executable*.


#### Example

```
echo -n "Give the unit price : "
read unit_price

echo -n "Give the quantity price : "
read quant

totalPrice = $(echo "$unit_price * $quant" | bc)
discount = 0
echo $totalPrice
```

#### Another Example

```
echo -n "Enter two inter operands : "
read op1 op2

# case $<variable> in
# 1|4)
#   . . .
# 2) 
#   . . .
# *) default case
#   . . .
# esac


echo -e "1. Addition\n2. Substraction"
echo -n "Enter the Choice : "
read choice

res=0

case $choice in
    1|one) 
       res = `expr $op1 - $op2 `
    2|two)
       res = `expr $op1 + $op2`
    *)
       res = `expr $op1 * $op2`

```

While shell scripting there is major role played by the **spaces**, if yo didn't used the spaces before and after the operator, it won't be a trouble, but if you used spaces while assignement, remember, **spaces** are **not** allowed while assignments.

```
if [ condition ]; then
  - -         - 
  | |         |
  space      space
```