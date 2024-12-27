# Writing Scripts

**Basic Redirections:**

1. **Capture Output:** Write the output of the `ls -l` command to a file named "file_list.txt".

    ```bash
    ls -la > file_list.txt
    ```

2. **Append Output:** Add the current date and time (using the `date` command) to the end of "file_list.txt" without overwriting the existing contents.

    ```bash
    date >> file_list.txt
    ```


3. **Redirect Input:** Write a script that reads a list of filenames from a file called "input.txt" and prints the contents of each file to the console.

    ```bash
    #!/bin/bash 

    read filename
    sudo echo "Reading files from $filename"

    sudo cat $filename | tr -s " " | cut -d " " -f 9 > newfile.txt
    sudo sh -c "cat newfile.txt" 
    echo "NJOY!"
    ```

4. **Overwrite vs. Append:** Create a file called "output.txt". Run a command that writes "Hello" to it. Then, run another command that writes "World" to the same file, first by overwriting and then by appending. Observe the difference.
5. **Discard Output:** Run the `find / -name "*.txt"` command (be careful, this searches the entire filesystem!) but discard its output.  (This is useful for suppressing unnecessary output).

    ```
    find / -name "*.txt" > findResult.txt
    ```

**Redirecting Standard Error:**

6. **Capture Error Messages:** Run a command that is known to produce an error (e.g., trying to access a non-existent file).  Redirect only the error messages to a file named "errors.txt".

```bash

```
7. **Redirect Both Output and Error:** Run a command and redirect both its standard output and standard error to a file called "all_output.txt".
8. **Separate Output and Error:** Run a command and redirect its standard output to "output.txt" and its standard error to "errors.txt".


**Piping and Redirections:**

9. **Chained Commands:** Find all files in the current directory ending with ".txt", count the number of lines in each file using `wc -l`, and then sort the output numerically using `sort -n`. Redirect the final sorted output to "line_counts.txt".
10. **Filtering Output:** List all running processes (using `ps aux`) and filter the output to show only processes owned by your user. Redirect the filtered output to "my_processes.txt".
11. **Process Substitution:** Use process substitution to compare the contents of two directories (`dir1` and `dir2`) using `diff`. Redirect the output of `diff` to a file named "directory_diff.txt".


**Advanced Redirections:**

12. **Redirecting File Descriptors:**  Experiment with redirecting file descriptor 3 to a file. For example: `ls -l /tmp 2>&3 3> tmp_listing.txt`. Understand how this works.
13. **Here Strings and Here Documents:** Write a script that uses a here document to create a multi-line text file with variables expanded.
14. **Creating Empty Files:** Use redirection to create an empty file named "empty.txt" without using the `touch` command.
15. **Backup and Redirect:**  Create a backup of a file (e.g., "important.txt") to "important.txt.bak" and simultaneously redirect the output of the backup command to `/dev/null` to suppress output.


**Example solutions (for a few problems):**

* **Problem 1:** `ls -l > file_list.txt`
* **Problem 2:** `date >> file_list.txt`
* **Problem 6:** `cat non_existent_file 2> errors.txt`
* **Problem 7:** `ls -l / /nonexistent 2>&1 > all_output.txt` or `ls -l / /nonexistent &> all_output.txt` (Bash shortcut)
* **Problem 9:** `find . -name "*.txt" -exec wc -l {} \; | sort -n > line_counts.txt`


These problems cover a wide range of redirection scenarios.  Experiment with these and try variations. The `man bash` command is an excellent resource for learning more about redirections in Bash.  Practice is key to mastering these concepts!