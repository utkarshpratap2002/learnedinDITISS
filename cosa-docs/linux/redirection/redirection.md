# Redirection

The I/O *Input/Ouput* files have standsard input, standard outpput and standard error fies, through this meethod we can redrect the *input/output*. Normally output goes to the screen and input is directly taken from the keyboard, but you can change this through redirection, meaning you can change where the input comes from and where the output goes.

#### Redirection of Standard Output

The commands when executed will show the result at the standard output, i.e., the screeen. When we talk about the redirection of standard output, we are manipulating the way the the output will be redirected to our choice of file, instead of **standard output**. 

Use `>` redirection operator for that, as when you use redirection operator, the output will be written inside the file `ls-output.txt` and if you see it'll store the output of `ls -la`. 
```
❯ ls -la > ls-output.txt
❯ cat ls-output.txt
total 928
drwxr-xr-x  5 utkarshsingh  staff     160 Sep 30 21:03 .
drwxr-xr-x  9 utkarshsingh  staff     288 Sep 30 21:01 ..
-rw-r--r--@ 1 utkarshsingh  staff  469630 Sep 30 11:53 some-other-file-name.pdf
-rw-r--r--@ 1 utkarshsingh  staff    3073 Sep 30 11:57 some-file-name.txt
-rw-r--r--  1 utkarshsingh  staff       0 Sep 30 21:03 ls-output.txt
```

Use `>>` redirection operator when you don't want the same file to be overwritten when using the same file with another redirection operation. But this is only limited to the standard output, if there is an error you won't be able to save it in the file, as when the file will getting written, the error will stop the writing process and the file will be trauncated. So in that case we'll see further what can happen in [Redirection of Standard Error](#redirection-of-standard-error).

#### Redirection of Standard Error

Though there is way to control the **standard error**, as when the error messages come out, a file descriptor is used directly to redirect the std input, output, and error, using 0,1, and 2.

```
❯ ls -la /etc/bin &>> ls-output.txt
❯ cat ls-output.txt
total 928
drwxr-xr-x  5 utkarshsingh  staff     160 Sep 30 21:03 .
drwxr-xr-x  9 utkarshsingh  staff     288 Sep 30 21:01 ..
-rw-r--r--@ 1 utkarshsingh  staff  469630 Sep 30 11:53 Day03_Diagrams.pdf
-rw-r--r--@ 1 utkarshsingh  staff    3073 Sep 30 11:57 classwork_history.txt
-rw-r--r--  1 utkarshsingh  staff       0 Sep 30 21:03 ls-output.txt
ls: /etc/bin: No such file or directory
```

You can use the `&>` for redirection of **std error** to the file `ls-output.txt` and `&>>` for appending the std error to the file just like in std outout we were doing. You only need to use the modern **`bash`** method in order to do it. 

Sometimes *Silence is golden*, so you can just throw away the unwanted error in the **`dev/null`** to quiten the error message.

```
❯ ls -la /etc/bin 2> /dev/null
```

#### Redirection of Standard Input

Lets get through this `cat` command hacks that are quite good, `cat` cmd is usually thought of a cmd which shows the content of the file but there can be concatenation of files that can be performed using `cat` cmd. The example is given below:

```
❯ cat file.txt.* > file.txt
❯ cat file.txt
this is file testing
this is is another line
```

As we know already that `cat` command doesn't just sits when we type `cat` on the CLI, it waits for input from the keyboard and prints on the screen, meaning it takes input from the std input and prints is on the std output. But we can change that by giving the `<` redirection operator.

```
❯ cat < file.txt
thisi fiel
thisis is ano
```

As the `cat` cmd is doing nothing above here except that it is now accepting a response from the another file `file.txt`.

# Pipelines

Pipelines are *super handy*, when you need to join the two commands or say programs together, as the **std output** gets piped with the **std input** of another command. If you can recognise the `less` command, which has the functionlity of opening the contents in a powerful like `vim` but with less feature, `less` basically allows the forward and backward movement of the file that you open with **less**.

Imagine using the functinality of `less` with out std output of the `ls -la` followed  by some large file that you need to consider while inspection. 

```
❯ ls -la ~ | less
```

The above command will pipe the **std output** with the second command which is `less`. So the pipelining is *super handy* when it comes to filtering, piping different commands. Refer to [how the command redirection works?](../day3/day3.md#how-the-redirection-stuff-works) to learn more about Piping and IPC (Inter-Process Communication).