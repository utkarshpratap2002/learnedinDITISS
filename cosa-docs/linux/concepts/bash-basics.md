# Bash Basics

## Bash Scripting Cheat Sheet:

This cheat sheet covers common commands and utilities for various tasks in Bash scripting.

**1. Reading and Writing Inputs/Outputs:**

* **`read`**: Reads user input from the terminal.
    ```bash
    read -p "Enter your name: " name
    echo "Hello, $name!"
    ```
* **`echo`**: Prints output to the terminal.
    ```bash
    echo "This is a message."
    ```
* **`printf`**: Formatted output.  More control than `echo`.
    ```bash
    printf "The value of pi is approximately %.2f\n" 3.14159
    ```
* **Redirections**:
    * `>`: Redirect output to a file (overwrites). `command > file.txt`
    * `>>`: Append output to a file. `command >> file.txt`
    * `<`: Redirect input from a file. `command < file.txt`
    * `|`: Pipe output of one command to another. `command1 | command2`


**2. Variables:**

* **Assignment**: `variable_name=value` (no spaces around `=`)
* **Access**: `$variable_name` or `${variable_name}` (curly braces are needed for complex expressions)
* **`cmd` variable**: Stores the last executed command.


**3. Basic Math Operations:**

* **`expr`**:  (For integer arithmetic)
    ```bash
    result=$(expr 5 + 2)
    ```
* **`let`**: (For integer arithmetic)
    ```bash
    let result=5+2
    ```
* **`bc`**: (For floating-point arithmetic)
    ```bash
    result=$(echo "scale=2; 5.2 / 2.1" | bc) 
    ```
* **Arithmetic Expansion**:  (Integer and some basic floating-point operations within double parentheses)
    ```bash
    result=$((5 + 2))
    result=$((5.2 * 2.1))  #Bash 5.1+
    ```


**4. Conditional Commands:**

* **`if` statement**:
    ```bash
    if [ condition ]; then
        commands
    elif [ another_condition ]; then
        commands
    else
        commands
    fi
    ```
* **Comparison operators**: `-eq`, `-ne`, `-lt`, `-le`, `-gt`, `-ge` (for integers), `=`, `!=`, `<`, `<=`, `>`, `>=` (for strings), `-f` (check if file exists), `-d` (check if directory exists), etc.
* **Logical operators**: `&&` (AND), `||` (OR), `!` (NOT)


**5. Exit Codes:**

* **`exit`**: Exits the script with a specific code. `exit 0` (success), `exit 1` (error), etc.
* **`$?`**:  Special variable that holds the exit code of the last executed command.


**6. `while` Loops:**

```bash
while [ condition ]; do
    commands
done
```


**7. Updating Scripts (No specific "update" command):**

* Use a text editor (e.g., `vim`, `nano`, `emacs`) to modify the script.
* Version control systems like `git` are highly recommended for managing script changes.


**8. `for` Loops:**

* **Iterating over a list:**
    ```bash
    for item in list1 list2 list3; do
        commands
    done
    ```
* **C-style `for` loop:**
    ```bash
    for (( i=0; i<10; i++ )); do
        commands
    done
    ```
* **Iterating over files:**
    ```bash
    for file in *.txt; do
        commands
    done
    ```


**9. Data Streams:**

* **Standard input (stdin)**: File descriptor 0.  Usually the keyboard.
* **Standard output (stdout)**: File descriptor 1. Usually the terminal.
* **Standard error (stderr)**: File descriptor 2.  Usually the terminal.  Used for error messages.
* **Redirecting stderr**: `command 2> error.txt`


**10. Functions:**

```bash
function_name() {
    commands
    return value  # Optional
}

# Calling a function:
function_name arg1 arg2 
```

**Example:**

```bash
greet() {
    echo "Hello, $1!"
}

greet "World"  # Output: Hello, World!
```

**11. Corncobs (No such standard command in Bash)**:  Perhaps you meant "coproc"?  This creates a background process with its own input and output streams, but it's less commonly used.


**12. Backup Scripts:**

* **`cp`**: Copy files/directories. `cp -r source destination` (recursive copy)
* **`rsync`**:  A powerful tool for synchronizing files and directories locally or remotely.
* **`tar`**: Create and extract archives.  `tar -czvf backup.tar.gz files_to_backup` (create a compressed archive)
* **Version control (e.g., `git`)**: The best approach for managing script backups and history.


**13. Arguments:**

* **`$0`**: Script name.
* **`$1`, `$2`, ...**:  Positional arguments.
* **`$#`**: Number of arguments.
* **`$@`**: All arguments as a single string.
* **`$*`**: All arguments as separate strings.


This is a summary of commonly used commands.  The `man` command (e.g., `man bash`, `man cp`, `man if`) provides detailed information about each command and its options.  There are many other powerful utilities and techniques available in Bash scripting, so continued learning and exploration are encouraged.