### `ls`

Use `d` to see the info on directory itself. Normally the `ls` command will show you the contents of the directory (current directory or of the path directory), but if you need to see the details of the directory itself you can use the `-d` option, perhaps along with `l`, meaning `-ld`

```
❯ ls -ld TEST
drwxr-xr-x  10 utkarshsingh  staff  320 Sep  1  2023 TEST
```

### `$()`

Whenever you need to calcalate the expression on extract the value out of expression, you need to use this **substitution** methods.

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
