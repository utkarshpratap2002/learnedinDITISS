### `ls`

Use `d` to see the info on directory itself. Normally the `ls` command will show you the contents of the directory (current directory or of the path directory), but if you need to see the details of the directory itself you can use the `-d` option, perhaps along with `l`, meaning `-ld`

```
❯ ls -ld TEST
drwxr-xr-x  10 utkarshsingh  staff  320 Sep  1  2023 TEST
```

### `$()`

Whenever you need to calcalate the expression on extract the value out of expression, you need to use this **substitution** methods.

### `tr` 

You can use **tr** for tanslation and transformation of strings and texts in such a way that you can use **/character** to specify say new-line and replace it with anything you want. <br>

```
❯ cat test.txt | tr "\n" " "
```

You can also use the complement concept to replace the string character that doesn't match with the specifed set of desired characters. <br>

```
❯ echo "abcderf5322" | tr -c "abc" "o"
abcooooooooo
```

Here, all the characters that arn't **a**, **b**, or **c** are replaced by **o**.

### `cut` and `grep`

You can use cut command to search for particular pattern within the selected section of collection using `cut`.

```
❯ ls -la | tr -s " " | cut -d ' ' -f 1
total
drwxr-xr-x
drwxr-xr-x
-rw-r--r--
-rwxr-xr-x
-rw-r--r--
-rw-r--r--
-rw-r--r--
-rw-r--r--@
-rw-r--r--@
-rw-r--r--@
```

Now if you wish to search for any particular pattern within the system you can do that by adding `grep` *pattern*.

### `tee`

The `tee` method is used for reading from standard input and writing to the standard output and files. Basically you can use it to write or append same contents to multiple files.

```
echo "\nBack to the Matrix! I remember it all!" | tee -a file*
```

If there are multiple files in which you need to write the same content, you can use echo and pipe the content with the **tee** passing arguments as multiple files.

### `vim file*`

You **can** open multiple files at a time using vim. Use `vim file*`, such that the first will open up, but you can switch between the files, and you also have the freedom to open desired files using `vim file[1-3]`, it will open the selected files.

You can check which files are open using **:ls**. You can move to the next file using **:n** and use **:N** to move to the previous file. You can directly move to the first and last file using **:first** and **:last**.

### `script session.log`

Script will allow you to create your session logs that will store or say record the commands and output to the commands within the log file. Use `script session.log` to start the session and the session.log file will save all the commands and outputs executed on the terminal. Use `exit` to exit the session recording.

### Parameter Expansion

The method used in your script is parameter expansion with curly braces. It allows you to append text to a variable without confusion, the method you are using is called **parameter expansion** (or **variable expansion**), It allows you to expand variables and manipulate their values inside strings or commands.

```
name="Raya"
echo "This is my name: ${name}rsha"
```

- `${name}` expands the value of the variable **name**, which is *Raya*.
- By using **curly braces `{}`**, you can append extra characters *rsha* directly after the variable. <br>

```
This is my name: Rayarsha
```

The curly braces around the variable **`${name}`** are used to avoid ambiguity when appending additional characters. Without the braces, the shell might misinterpret the variable expansion.

You can append Characters:
<br>

```
echo "${name}rsha"   # Outputs: Rayarsha
```

You can provide Default Values: <br>

```
echo "${name:-Guest}"   # Prints "Raya" if name is set, otherwise "Guest"
```

You can also do Substring Extraction: <br>

```
echo "${name:0:2}"   # Outputs: Ra (first two characters)
```

You can also check the Length of the Variable:

```
echo "${#name}"   # Outputs: 4 (length of "Raya")
```



