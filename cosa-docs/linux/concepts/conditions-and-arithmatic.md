In **shell scripting**, arithmetic calculations, command substitution, and conditional statements are fundamental concepts that allow for dynamic script behavior. Let’s go over the **logical concept** behind each of these and how they work in shell scripts.

---

### 1. **Arithmetic Calculations**:

Shell scripting supports basic arithmetic operations like addition, subtraction, multiplication, and division. You can perform arithmetic operations using **`$(( expression ))`** or the **`expr`** command. Arithmetic in shell scripting is generally performed with **integers**, and shell arithmetic doesn’t handle floating-point numbers (for that, you need tools like `bc` or `awk`).

#### Syntax:
```bash
result=$(( expression ))
```

#### Common Operators:
- **`+`**: Addition
- **`-`**: Subtraction
- **`*`**: Multiplication
- **`/`**: Division (integer division)
- **`%`**: Modulus (remainder)
- **`**`**: Exponentiation

#### Example:
```bash
a=10
b=5

sum=$((a + b))
difference=$((a - b))
product=$((a * b))
quotient=$((a / b))
modulus=$((a % b))

echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"
echo "Modulus: $modulus"
```

**Logical Explanation**:
- **`$(( ))`**: This is the arithmetic expansion syntax. It evaluates the expression inside the double parentheses and returns the result.
- The result of the calculation is stored in a variable (like `sum`).
- All calculations are **integer-based**, so division truncates any remainder.

---

### 2. **Command Substitution**:

**Command substitution** allows you to **capture the output** of a command and store it in a variable or use it directly in your script. There are two ways to perform command substitution in shell scripting:

- Using **backticks**: `` `command` ``
- Using **`$()`**: `$(command)` (preferred because it’s easier to nest)

#### Syntax:
```bash
variable=$(command)
```

#### Example:
```bash
current_date=$(date)
current_directory=$(pwd)

echo "Today's date is: $current_date"
echo "Current directory is: $current_directory"
```

#### Explanation:
- **`$(command)`** runs the command inside the parentheses and returns the output, which is then assigned to a variable.
- **Backticks** (`` `command` ``) perform the same function but are less readable when nesting commands.
  
#### Logical Example of Nesting Commands:
```bash
files_count=$(ls | wc -l)
echo "There are $files_count files in the current directory"
```

This runs the `ls` command, which lists the files, and pipes it to `wc -l` to count the lines (number of files). The result is stored in `files_count`.

---

### 3. **Conditions (If-Else Statements)**:

Conditional statements allow the script to make decisions based on the evaluation of expressions. The most common types of conditions in shell scripting include:

- **Numerical comparisons**.
- **String comparisons**.
- **File condition checks** (such as file existence, file type, etc.).

#### Syntax:
```bash
if [ condition ]; then
    # Commands to execute if condition is true
elif [ condition ]; then
    # Commands to execute if the second condition is true
else
    # Commands to execute if no conditions are true
fi
```

#### Common Comparison Operators:

##### Numerical Comparison:
- **`-eq`**: Equal to
- **`-ne`**: Not equal to
- **`-lt`**: Less than
- **`-le`**: Less than or equal to
- **`-gt`**: Greater than
- **`-ge`**: Greater than or equal to

##### String Comparison:
- **`=`**: Equal to
- **`!=`**: Not equal to
- **`-z`**: String is empty
- **`-n`**: String is not empty

##### File Tests:
- **`-e file`**: File exists
- **`-d file`**: File is a directory
- **`-f file`**: File is a regular file
- **`-r file`**: File is readable
- **`-w file`**: File is writable
- **`-x file`**: File is executable

#### Example: **Numerical Comparison**:
```bash
a=10
b=20

if [ $a -eq $b ]; then
    echo "a and b are equal"
elif [ $a -lt $b ]; then
    echo "a is less than b"
else
    echo "a is greater than b"
fi
```

#### Example: **String Comparison**:
```bash
name="John"

if [ "$name" = "John" ]; then
    echo "Hello, John!"
else
    echo "You're not John."
fi
```

#### Example: **File Condition**:
```bash
file="/path/to/file.txt"

if [ -e "$file" ]; then
    echo "File exists"
else
    echo "File does not exist"
fi
```

#### Logical Explanation:
- **`if [ condition ]`**: Tests the condition inside the square brackets. If it evaluates to true, the commands after `then` are executed.
- **`elif`**: Used to specify another condition if the first condition is false.
- **`else`**: Specifies the block of code to execute if none of the conditions are true.
- **`fi`**: Marks the end of the conditional block.

### Combining Conditions:
You can also combine multiple conditions using logical operators:
- **`-a`**: Logical AND (both conditions must be true).
- **`-o`**: Logical OR (one condition must be true).

#### Example:
```bash
if [ $a -gt 5 -a $b -lt 30 ]; then
    echo "a is greater than 5 AND b is less than 30"
fi
```

---

### Putting It All Together:
A shell script that uses **arithmetic calculations**, **command substitution**, and **conditions**:

```bash
#!/bin/bash

# Arithmetic
a=10
b=5
sum=$((a + b))
echo "Sum of $a and $b is: $sum"

# Command Substitution
current_time=$(date +%H:%M)
echo "Current time is: $current_time"

# Conditions
if [ $sum -gt 10 ]; then
    echo "Sum is greater than 10"
else
    echo "Sum is less than or equal to 10"
fi
```

### Logical Flow of the Example:
1. **Arithmetic Calculation**: Performs addition on variables `a` and `b`.
2. **Command Substitution**: Captures the current time using the `date` command and stores it in the variable `current_time`.
3. **Condition**: Checks if the sum is greater than 10 and prints an appropriate message based on the result.

---

### Summary:

- **Arithmetic Calculations**: Use `(( ))` for basic math like addition, subtraction, multiplication, and division. It only works with integers.
- **Command Substitution**: Use `$()` to run a command and store its output in a variable. This is useful for dynamic data in your script.
- **Conditions**: Use `if-else` to make decisions based on comparisons (numerical, string, or file conditions). Conditional logic is a key part of controlling the flow of your script.

By mastering these concepts, you can create dynamic and powerful shell scripts that can handle complex logic and computations.

Let me know if you'd like to see more examples or details!