# Day 6

One of biggest difference between `java` and `python` in string formatting is that python got a complete customisation option, a modification benefit over `java`. 

One of major usecase of the collection is that you can store lot of functions and call them simulatneously, and can store them in lists.

### File IO

* Why you want file IO?  If you want to manipulate, change, or modify the files. 
    * You can open file using `open(filepath, mode = ‘r’, encoding = None)`, thus passing different modes which will decide what can be done with the file.
    * `r` when specified as the mode, it means the file is only readable. When using `w`, means the the file is readable and writable, you can also specify `a`, meaning the contents you ‘ll write will be appended to the file.
    * Modes can be specified in two types, meaning you can also decide how you want to treat the contents of file: text, binary, by specifing `b`, or `t` as suffixes to modes, like, `’rb’`, `’wb’`, `’ab’`
* In python, while you pass the path, `.extensions` doesn’t matter
* `w` means you are overwriting the file, and `a` means that you are appending the file, `wt` means file will be opened with write mode along with text type.
* If the file doesn’t exist, it will be created 
* If file exists, it will be opened for writing
* use `file.close()`
```
>>> f = open("opening.txt", 'w')
>>> f.write("This is for testing purpose!")
28  # funtion returns number of characters 
>>> f.close()
```
If you tried doing something like this, `f = open("opening.txt")` you can only do this only if `opening.txt` already exists. You will see a `FileNotFoundError: [Errno 2] No such file or directory: 'opening.txt’` exception, this occur only when the file doesn’t exists. Know this, becasue in future you might be needing to handle the exception when you have one.

* Once you open the file in variable `f`, use `f.read()` if you want to read the file. Just that! Simple!

```
>>> f.read()
'This is for testing purpose!'
```

* Note that if you open file using **writing `w`** or **appending `a`** mode, you’ll witness that in both the scenarios the file will be created, though opening file with reading `r` mode, you won’t witness that same because the file doesn’t exist to be read.
* Remember, you can specify the `rb` as mode which will be able to store and show information is binary and you should know that when you need to open a image file that contains information in binary, you need to specify `rb` that reads file in binary

There is different way of of handling the file, you can use `with` block, which automatically closes the file without specifying the `file.close()`. This is exemplified below:
```
def function4():
    take_ = input("Give inputs").split()

    with open("opening.txt", "w") as file:       # File closes on its own
        file.write(" ".join(take_))

    with open("opening.txt", "r") as file:
        print(file.read())

    return

function4()
```

* You can see `seek(0)`, when you try reading the file again, as you would see that it returns a empty string when reading the file again. This happens due to the pointer that stopped at the end of the file, so when reading the file again, it is pointing the end. 
```
>>> f = open("file1.txt", 'r')
>>> f.read()
"'Reva' 'Mrdhvi'"
>>> f.read()
''
>>> seek(0)  # Initializing the pointer.
```
* You can use string functions with the `f.read()` to furnish the data. Let’s consider a file name file1.txt, as shown the given example:

```
file1.txt
    Reva    Mrdhvi     
    Krtvi   Mrdhvi     
    Mrdhvi  Kuvira     
    Reva    Kuvira         
```
* You can now take the contents of file and store it in a proper manner, say using `strip()` and `split()` to remove the unnecessary white spaces and to split the contents into the list of strings.
```
>>> f = open("file1.txt", "r")
>>> f.read()
'Reva    Mrdhvi\nKrtvi   Mrdhvi\nMrdhvi  Kuvira\nReva    Kuvira'
>>> f.seek(0)
0
>>> f.read().strip()
'Reva    Mrdhvi\nKrtvi   Mrdhvi\nMrdhvi  Kuvira\nReva    Kuvira'
>>> f.seek(0)
0
>>> f.read().strip().split()
['Reva', 'Mrdhvi', 'Krtvi', 'Mrdhvi', 'Mrdhvi', 'Kuvira', 'Reva', 'Kuvira']
```
* **Why we need code re-usability?** Every file that we write is called module, that means we can import the module using `import` *filename* and can use all file's functions and variables. Modules contains the variables and functions, classes and all that it contains is called module.
```
# greet.py
def greet(user):
    print(f"Hello {user}! ")
    return

def ask_(user):
    ask_ = input(f"{user}, Do you any work exerience? ")
    if ask_ == 'Y' or 'Yes':
        print(f"That's good for you!")
```
* You can use variables and functions in the current file using, `import greet`
* Remember that when you say `import greet`, the initialisation of all the vairables and functions happens, that is why, when you run the code you’ll always get those statements of the module executed which are in written in **global space**.
* For example, if define a function call **`greet()`** in `greet.py` in the global space, then remember when you'd import the module in the another file, then the function call will happen in that file will also execute the global statements in that module `greet.py`. 
* If you try using `__name__` in the module that is getting executed gives `__main__`
```
# When executed the script directly
(main-file) module name: __main__
# When executed the script directly
(greet) module name: __main__
```
* **Is there entry point function?** No, when you specify, `if __name__ == “__main__”:` tells python that execute the code block within it only when the python script is executed directly. If it is executed as import module, then this code block will be ignored and will not run. 

Python iterpreter and compiler had an entry point funtion named **`pyMain()`**, but the programs that we write doesn’t have entry point function. `pyMain()` itself starts executing using entry point function.

* There are two types of modules:
    * **Standard library modules** - installed by default when python got installed, for example, **os, re, json** etc., called **internal modules**.
    * **Custom modules** - developed by python developers around the world, can used and implemented, also called external modules, they are installed explicitly, using pip/pip3.
* what can be said about standard library modules? 

A bult-in function can be seen using `dir()` that accepts a *module-name* that specifically tells the function and operation available within the module.
```
0
>>> dir(os)
['CLD_CONTINUED', 'CLD_DUMPED', 'CLD_EXITED', 'CLD_KILLED', 'CLD_STOPPED', 'CLD_TRAPPED', 'DirEntry', 'EX_CANTCREAT', 'EX_CONFIG', 'EX_DATAERR', 'EX_IOERR', 'EX_NOHOST', 'EX_NOINPUT', 'EX_NOPERM', 'EX_NOUSER', 'EX_OK', 'EX_OSERR', 'EX_OSFILE', 'EX_PROTOCOL', 'EX_SOFTWARE', 'EX_TEMPFAIL', 'EX_UNAVAILABLE', 'EX_USAGE', 'F_LOCK', 'F_OK', 'F_TEST', 'F_TLOCK', 'F_ULOCK', 'GenericAlias' ..... ] 
```
* Every other function within the `os` module can be accessed using the `(dot)` convention, say, `os.F_ULOCK`.
* `os.getcwd()` - current working directory
```
>>> os.getcwd()
'/Users/utkarshsingh/Documents/python-lec-docs'
```
* Use `os.mkdir(‘dir_name’)` to create a new directory, note that if the directory is already created, this will raise an error.
* There are many such functions so you can go and refer to **python docs** that you can use.
* **what is `.json`?** Every data is translated and is ingterpreted in `.json` file, where every `[ …. ]` is considered as array, and `{. ….  .}` is called object. 

### Few things are good for later

What is string intepolation? String interpolation is used for formatting of string, using it to store the string iterals, vairables, evalueated expressions within the string in consice and simple way. This is show below:
```
>>> eval = f"{'-' * 44}"
>>> eval
'--------------------------------------------'
>>> name = "Reva"
>>> age = 22
>>> def greet(name):
...   print(f"hey {name}!")
... 
>>> def greet(name):
...   return f"hello {name}"
... 
>>> greet('reva')
'hello reva'
>>> evaluated_string = f"{greet('Reva')}, Next year you'll be {age+1} year old!" 
>>> evaluated_string
"hello Reva, Next year you'll be 23 year old!"
```

#### Next day topics
Flask - Implementing a REST architecture
What is client server architecture
Build your own web server using flask
Functional Programming - map, filter, reduce
pandas, matplotlib

