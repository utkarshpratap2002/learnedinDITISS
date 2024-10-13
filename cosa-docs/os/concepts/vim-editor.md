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

---

