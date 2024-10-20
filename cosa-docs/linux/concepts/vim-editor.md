# `vim` Editor

In the **`vi`** (or **`vim`**) editor, there are several commands for copying, cutting, and deleting text. Below is a breakdown of the most common commands for **copying**, **deleting**, and **pasting** in `vi`:

---

### 1. **Copy (Yank)**:
In `vi`, the term for **copying** is called **yanking**. The yank command is used to copy text into the buffer.

- **`yy`**: Yank (copy) the **current line**.
- **`2yy`**: Yank (copy) **two lines** starting from the current line (you can replace `2` with any number to yank that many lines).
- **`yw`**: Yank (copy) a **word**.
- **`y$`**: Yank (copy) from the **current cursor position to the end of the line**.
- **`y^`**: Yank (copy) from the **current cursor position to the beginning of the line**.
- **`yG`**: Yank (copy) from the current line to the **end of the file**.
- **`ygg`**: Yank (copy) from the current line to the **beginning of the file**.
  
#### Example:
To copy 5 lines starting from the current line, you would type:
```bash
5yy
```

---

### 2. **Delete (Cut)**:
In `vi`, the **delete** command also cuts the text (it removes it and stores it in the buffer, so you can paste it later).

- **`dd`**: Delete (cut) the **current line**.
- **`2dd`**: Delete (cut) **two lines** starting from the current line (you can replace `2` with any number to delete that many lines).
- **`dw`**: Delete (cut) a **word**.
- **`d$`**: Delete (cut) from the **current cursor position to the end of the line**.
- **`d^`**: Delete (cut) from the **current cursor position to the beginning of the line**.
- **`dG`**: Delete (cut) from the current line to the **end of the file**.
- **`dgg`**: Delete (cut) from the current line to the **beginning of the file**.

#### Example:
To delete 3 lines starting from the current line, you would type:
```bash
3dd
```

---

### 3. **Paste (Put)**:
Once you have yanked (copied) or deleted (cut) text, you can **paste** it elsewhere using the following commands.

- **`p`**: Paste the yanked/cut text **after** the cursor.
- **`P`**: Paste the yanked/cut text **before** the cursor.

#### Example:
If you have yanked a line using `yy`, you can paste it below the current line by typing `p`.

---

### 4. **Undo and Redo**:
- **`u`**: Undo the last change.
- **`U`**: Undo all changes on the current line.
- **`Ctrl + r`**: Redo the last undone change.

---

### Quick Reference of Copy, Delete, and Paste Commands:

| Action              | Command                                      | Description                                          |
|---------------------|----------------------------------------------|------------------------------------------------------|
| **Copy (Yank)**     | `yy`                                         | Copy the current line                                |
|                     | `2yy`                                        | Copy two lines                                       |
|                     | `yw`                                         | Copy a word                                          |
|                     | `y$`                                         | Copy from cursor to the end of the line              |
|                     | `yG`                                         | Copy from current line to the end of the file        |
| **Delete (Cut)**    | `dd`                                         | Cut the current line                                 |
|                     | `2dd`                                        | Cut two lines                                        |
|                     | `dw`                                         | Cut a word                                           |
|                     | `d$`                                         | Cut from cursor to the end of the line               |
|                     | `dG`                                         | Cut from current line to the end of the file         |
| **Paste (Put)**     | `p`                                          | Paste after the cursor                               |
|                     | `P`                                          | Paste before the cursor                              |
| **Undo**            | `u`                                          | Undo the last change                                 |
| **Redo**            | `Ctrl + r`                                   | Redo the last undone change                          |

<br>

# **Using `read` in Vim and Shell: Flexibility and Usage**

In **Vim**, `read` allows the user to load the contents of files or execute shell commands and insert the output directly into the current buffer. This adds a powerful level of interactivity to Vim by giving you access to both text files and shell command outputs without leaving the editor.

Let’s explore **what `read` does in Vim** and **how `read` works in shell scripting** to give you a complete understanding of the flexibility this command provides.

---

### **1. `read` Command in Vim: Loading External Content**

#### **Reading a File into Vim**
To **load the content of a file** inside the current buffer:
```vim
:read filename
```
**Example**:
```vim
:read /etc/hosts
```
- This command reads the content of `/etc/hosts` into the current buffer, starting at the current cursor position.

#### **Reading Output from a Shell Command into Vim**
You can **insert the output of a shell command** directly into the buffer:
```vim
:read !ls -l
```
- This command runs `ls -l` and places the output in the buffer.
- **Flexible Usage**: Any shell command can be used, allowing you to pull real-time data into your editing session (e.g., system stats, logs).

**Key Concept**: 
- This feature is especially helpful when you need to embed **command outputs** into documentation or when working on **configuration files** that rely on system states.

---

### **2. `read` Command in Shell Scripting: Interactive Input Handling**

In **shell scripting**, `read` is used to **take input from users or files** during script execution. 

#### **Basic Usage of `read`**
```bash
read -p "Enter your name: " name
echo "Hello, $name!"
```
- **Explanation**: The `-p` flag allows a prompt to be displayed before accepting input.

---

### **3. Advanced Scenarios Using `read` in Shell**

#### **Reading Multiple Values**
```bash
read -p "Enter your age and city: " age city
echo "You are $age years old and live in $city."
```
- **Explanation**: `read` can split input into multiple variables using **spaces** as delimiters.

#### **Reading Input with a Timeout**
```bash
read -t 5 -p "Enter your username: " user
echo "Username: $user"
```
- **Explanation**: The `-t` flag sets a timeout, and if no input is given within the time limit, the script continues.

#### **Silent Input (No Echo) for Passwords**
```bash
read -sp "Enter password: " password
echo "Password entered."
```
- **Explanation**: The `-s` flag disables the echo, making it ideal for password entry.

---

### **4. Combining Vim and Shell `read` for Flexible Scripting**

If you're editing a script inside Vim and want to **embed real-time input**, you can use Vim’s **`:read !command`** feature in conjunction with `read` in shell scripts.

**Example**: Reading user input into a file from within Vim:
1. Start editing a file in Vim.
2. Run this command in Vim:
   ```vim
   :read !read -p 'Enter username: ' user && echo $user
   ```
3. **Result**: The input provided to `read` is placed directly into the buffer.

---

### **5. Summary: Flexibility of `read` in Vim and Shell**

#### **In Vim**:
- `:read` can **load file contents** or **insert shell command outputs** into the buffer.
- Ideal for automating workflows, embedding system information, or working on dynamic documentation.

#### **In Shell**:
- `read` provides **interactive input** capabilities.
- It allows **silent input** (for passwords), **time-limited input**, and **multiple value inputs**.
- You can use `read` within scripts for **dynamic user interaction**.

By understanding how both Vim’s and Shell’s `read` commands work, you can seamlessly combine them for flexible editing and scripting workflows, enhancing productivity and automation.

# Shebang Header 

Refer to [environment](environment.md) when it comes to adding a shebang header, it tells the script about the program that need to be executed, remember that it doesn't tell about the bash that is being used, but it tells about the program to be executed. When executing the shell script, you might need to executed different programs but the shell should know where those programs are, when you give shebang header it recognises the program to be used within the scope of the script. 

```
#!/etc/bin/python3
```

The above shebang header might be containing the program which could be python script and if you don't give the extension to the file then also you'll be able to execute the file irrespective of the extension or the command (python3 or bash) you give, just you need to make sure that the file is executable. And you can run the file using **`./pythoncode`**. 

Remember that there is only **one** shebang header in a bashh file, the first line of the file is interpreted as shebang header, next line are considered as normal and regular lines, so even if you tried adding a header other than shebang header, it won't be one becuase it'll be interpreted as code. Refer to 
[can a bash script have multiple shebang header](can-a-bash-script-have-multipe-shebang-header.md) to learn more about it.