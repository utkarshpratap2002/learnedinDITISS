# Variables 

In **shell scripting**, **variables** play a crucial role by allowing scripts to store, manipulate, and access data dynamically. A **variable** is essentially a placeholder that stores a value, which can be a string, a number, or even a command output. Understanding how to define, use, and manipulate variables is key to writing effective shell scripts.

Here’s a breakdown of the **logical concept** of variables in shell scripting:

### 1. **Defining Variables**:
Variables in shell scripts are created by assigning a value to a variable name without any spaces around the `=` sign.

#### Syntax:
```bash
variable_name=value
```

- **No spaces** are allowed between the variable name, the equal sign (`=`), and the value.
- Variable names can include letters, numbers, and underscores but must not start with a number.

#### Example:
```bash
name="John"
age=25
```

- **`name`** is a variable holding the string "John".
- **`age`** is a variable holding the number `25`.

---

### 2. **Accessing Variables**:
To use (or **access**) the value stored in a variable, you need to prefix the variable name with a **`$`**.

#### Example:
```bash
echo $name
echo $age
```

- **`$name`** outputs the value "John".
- **`$age`** outputs the value `25`.

### 3. **Quoting Variables**:
In shell scripting, variables can be enclosed in **double quotes** (`" "`). This is important when the variable contains spaces or special characters.

- **Double quotes**: Preserves spaces within the value of the variable but allows variable expansion.
- **Single quotes**: Prevents variable expansion and treats everything literally.

#### Example:
```bash
greeting="Hello, $name"
echo "$greeting"
```
This will output:
```
Hello, John
```

If you used single quotes (`'`):
```bash
greeting='Hello, $name'
echo "$greeting"
```
The output would be:
```
Hello, $name
```
because the variable is **not expanded** within single quotes.

---

### 4. **Types of Variables**:
There are two main types of variables in shell scripting:

#### a) **Local Variables**:
These are variables defined within a script or a shell session and are only available to that specific script or session.

#### Example:
```bash
username="admin"
```
This variable exists only within the current shell session or script and is not available to other programs.

#### b) **Environment Variables**:
Environment variables are system-wide variables available to all programs running in the shell session. They are defined in uppercase by convention.

#### Example:
```bash
export PATH=/usr/local/bin:$PATH
```
The **`export`** command is used to make a variable available to other programs and scripts run by the shell.

---

### 5. **Command Substitution**:
Shell scripts allow you to **store the output** of a command into a variable. This is called **command substitution** and is done using **backticks** (\``command`\) or **`$()`**.

#### Example using `$()`:
```bash
current_date=$(date)
echo "Today's date is: $current_date"
```

This will store the output of the `date` command in the variable `current_date`.

#### Example using backticks:
```bash
current_time=`date +%H:%M`
echo "Current time is: $current_time"
```

Both examples will capture the output of the `date` command and store it in a variable.

---

### 6. **Default Values and Null Checking**:
In shell scripts, you can assign default values to variables if they are not set or empty. This is done using the syntax **`${variable:-default_value}`**.

#### Example:
```bash
name=${name:-"Guest"}
echo "Hello, $name"
```

If `name` is not set, the default value "Guest" is used.

- **`${variable:-value}`**: If the variable is unset or null, use the provided value but **don't** modify the variable.
- **`${variable:=value}`**: If the variable is unset or null, assign the provided value to the variable.

---

### 7. **Modifying Variables (Arithmetic and String Manipulation)**:
Shell scripting allows basic arithmetic operations and string manipulations using variables.

#### a) **Arithmetic Operations**:
You can perform basic arithmetic using **`$(( ))`** syntax.

#### Example:
```bash
num1=5
num2=10
sum=$((num1 + num2))
echo "Sum is: $sum"
```

This will output:
```
Sum is: 15
```

#### b) **String Operations**:
You can extract or modify parts of strings stored in variables.

- **Length of a string**:
  ```bash
  str="Hello"
  echo ${#str}  # Outputs: 5
  ```

- **Substring**:
  ```bash
  str="Hello, world"
  echo ${str:7:5}  # Outputs: world
  ```

---

### 8. **Special Variables**:
Shell scripting provides special variables to handle arguments passed to the script or special situations:

- **`$0`**: The name of the script.
- **`$1, $2, $3, ...`**: The positional parameters (arguments passed to the script).
- **`$#`**: The number of positional parameters.
- **`$@`**: All the positional parameters (arguments).
- **`$?`**: The exit status of the last command.
- **`$$`**: The process ID of the current shell.

#### Example:
```bash
#!/bin/bash
echo "Script name: $0"
echo "First argument: $1"
echo "Number of arguments: $#"
```

If you run the script with:
```bash
./script.sh argument1 argument2
```

The output will be:
```
Script name: ./script.sh
First argument: argument1
Number of arguments: 2
```

---

### 9. **Best Practices**:
- **Use descriptive variable names**: Choose meaningful variable names for clarity.
- **Quote variables**: Always quote variables (`"$var"`) to prevent issues with spaces and special characters.
- **Initialize variables**: Ensure variables are initialized before use to avoid unexpected behavior.

---

### Logical Concept Summary:
- **Variables store data** in shell scripts that can be reused throughout the script.
- **Local variables** exist only within the script or session, while **environment variables** are global.
- Variables are **accessed using `$`** and can be assigned values, including **command outputs**.
- Shell scripting supports **arithmetic and string operations** on variables, making them versatile for various tasks.
- **Special variables** are used for script arguments and process control.

Would you like a specific example of how variables are used in a script? Let me know if you need further clarification!