### `cd`

Use `cd` to change the directory from current directory **(pwd)** and `cd ..` to move to the previous directory or say parent directory. 

In case you need to go to the home directory use `cd ~` to move to home directory. You can also say that if `~` is by default argument with `cd`.

You can also use `cd -` in to move the the previous working direcotry.

### `ls [OPTIONS]`

There are two kinds of directory, one is `.` , meaning hidden directory and another is `..`, which means that directory

Use `ls -a` to find the `.` and `..` files within the direcoty and `ls -A` will show all the direcotry ignoreing the `.` and `..` directories.

Use `ls -l` meaning it can list all the **10 types of information**

In **Linux**, there are 7 types of files and every file is expresses as following letters:

- Regular file - denoted by `-`
- Directory file - denoted as `d`
- Link file - denoted by `l`
- Pipe file - denoted by `p`
- Socket file - denoted by `s`
- Character Speacial file - denoted by `c`
- Block Speacial file - denoted by `b`


The data is when flowed **character-by-charater (Charater Speacial File)** then those devices files are saved using `c` and sometimes the data flows **block-by-block (Block Speacial)** that is represented by `b`, you see these files in the `dev` directory.

- In `c` the data flows sequentially, meaning on character at a time, this can be seen in `/dev` dir that stores files of such types.
    ```
    ❯ cd /dev
    ❯ ls -la ttyw0
    crw-rw-rw-  1 root  wheel  0x4000070 Sep 28 04:19 ttyw0
    ```
- In case of `b` the data flow is in the block of data, meaning it could be pendrive or any storage device that has a contineous flow of data.
    ```
    ❯ ls -la disk0
    brw-r-----  1 root  operator  0x1000000 Sep 28 04:19 disk0
    ```

### `mkfifo`

It is used to create the pipe file, used as `mkfifo fifo` which is a **pipe** file.

```
prw-r--r--  1 utkarshsingh  staff    0 Sep 27 08:50 fifo
```

### Groups in Linux

You can assign the groups to the users, when you assign the users their respective groups. Whenever the user create a file, to which ever group the user will be part of, that group will be assigned to that file. 

There are three levels of permissions given to the user, based on which categroy it lies in. Either **user/owner**, or **group**, and **others**.

Cosider a scneario where yo have std1, std2, std3, all lies in **group1**, then there is staff1 and staff2, lies inthe **group2**, then admin1 and admin2 lies in **group3**.

There can three file system, read, write, and execute. These permission are given on three level, wither user/owner, group, and others.
| | |
|-|-|
|user/group| rw- |
|group| rw- | 
|other| r-- |

*Now how these can be manipulated?* Meaning there can be used octal for assigning the permissions, these permissions can be given on these respective levels.

| | |
|-|-|
|0 | 000|
|1 | 001|
|2 | 010|
|3 | 011|
|4 | 100|
|5 | 101|
|6 | 110|
|7 | 111|

If the permission to be given is read and write then you need to provide the **1** otherwise **0**. This is also explicated in th table given below:

| rw- | rw- | r--|
|-|-|-|
|110|110|100|

drwxr-xr-x  4 utkarshsingh  staff   128 Sep 28 03:43 test



