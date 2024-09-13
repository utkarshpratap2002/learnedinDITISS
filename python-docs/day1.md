# Day 1

* Python going to be functinal programming language.
* Going to use OOPs for scripting in Linux -> Abstraction, Encapsulation Basically, Reussability.
* Modules. Using packages and modules, need to know about Modules.
* Advance Features. How to use packages for REST API
    * Project must use REST API
    * Focus on specifc projects that use packages for REST
    * Flask is one of them.
* Web Services, learn OWASP for Web Security.
* Numpy, Pandas
* Data Analysis
* Data Visualisation
    * matplotlib
* Testing
    * Selenium and data srapping. basically it would be used for researching the data.

## Langauge Fundamentals

1. How the language is used to communicate with the system (basically the CPU), if you remember the punched cards where there was use of punched card for input of codes and communication was really tough, then came assembly language, mnemonic language, having intructions in mnemonics (like ADD A B), converting instruction to binary. 
2. The major problem was to reduce the instruction providing process, becaue Assembly language was Arch dependent. There are various archs, namely CISC, RISC, SPARC.
3. Denis Ritchie and Ken Thompson wrote the first UNIX for Honeywell Corporation,basically, the usage of UNIX was so popular that is was used by most of the computer made by Honeywell Coorporation.
4. If you created a script, say in C program, script.c, remember that .obj object file is created by the compiler(`gcc` compiler), this file containes the machine code for the source code you wrote. But you do need that compiler that understand that same architecture as that of system, therefore this .obj file is OS independent, but arch dependent.
5. But again, you can’t  send .obj to OS, because ther need another mediater, an OS dependent Linker, that generates a .exec file.
6. In Compiled languages, it gives native application, i.e., giving executable files. The .exec file is native application that can run on any operating system. Another is that it is fast, C/C++ is fast, but OS dependent. 
7. Let’s talk about python, Python file, through `.py` is first translatd to `.pyc` file, meaning python compiled, this process is called Python3 Compilation. After ….
8. Another is Interpreted language. Python is interpreted language, in which a bytecode is generated. which is eventually done by python interpreter (`python3`). This lower-rpresentational form is called bytecode. Bytecode has two things in its defination, first is lower-level representation, second is platform-independent, meaning it is not OS dependent. Just like .html file that is directly rendered on Chrome, the code directly parsed to Chrome, not executed. Note, Browser itself uses the Javascript Engine.
9. This is the reason python is efficient, because it has interpreter lanugage. The code gets directly executed.
10. Interpreted languages are OS indepedent, but it is slow, therefore, python isn’t used in high-performance environment, but it is OS dependent, because again, you are using browsers, that again is OS dependent and needs the arch specific infrastructure.
11. Online compiler is no different, it also follow the same steps and compiles the language.
12. walter Issac history of computers
13.  Programming lanugage came with different types:
    1. General Purpose languages : Python is a general purpose language
    2. Markup language
    3. Stylesheet language
    4. Configuration languages
    5. Query language
    6. Scripting language : Python language

## Python as a language

* Python is general purpose, high-level, interpreted language.
* Python is dynamically typed.
* Python collects all the garbage itself, it manages the memory itself.
* It supports line by line code, oops, functional, and importantly, it is metaprogramming metaobject programming language, meaning it can be used to create another language.
* Remember it is undentation specific language, so you need to use specific indentation
* Python’s got 300,000 packages:
    * Graphical user interface

## History of Python

* Came out in 1980s, focused on simplicity and ability to use advance frameworks
Note* Remember the developers of languages.
* Java got inspired by python.
* Yes, python is community based language, more features and data types of the language keeps getting introduced.
* Why we often use Python Version 3? Becuase it is better version of the language.
* There are various version of language, CPython, Pypy, Jpython, InronPython. When you download python from the default python is CPython, which is what most of us get, this can be checked when you write `python3` on terminal, you get something like, `[Clang 13.0.0 (clang-1300.0.29.30)]`, highlighting `Clang`

## What happens after `python script.py` 

* When you write a code and save it as `script.py` and when you try to run the script directly, the cmd creates a file `script.pyc`, called python compiled, then this .pyc gets loaded to python virtual machine (PVM), this PVM is responsible for loading the .pyc to PVM.
* But also these two level prcess , where one is Compilation, leading with Interpretaion. Here, note that Python Vitual Mahines need to be installed on the machine. 
* First .py code to byte code, in compilation process, then byte code to asm code, during the interpretation process.
* But remember, because .py to .pyc, then .pyc to PVM, python do it itself, there this process is not done by OS, python is doing it itself.
* What is byte code? It is similar to ASM, not make for real CPU, and it is only made for PVM, nothing other than this can understand the .pc file. Note that PVM is also OS dependent, and python takes care of this whole process of coverting the code and getting it on the PVM.
* Python is both, compiled and interpreted language. 
* Remember to look after the Scripting and pragramming, and Compilation and Interpretation process.

## Identifiers and Keywords

* In python 3.8, threre are 35 such keywords.
* Operator used in python - `and`, `or`, `not`, `in`, `is`
* Control flow keywords - `if`, `else`, `elif`
* clouser, generaters, decoraters, iteraters are the three ers in python

## Rules and Consideration

* All uppercase letters used as a variable will ne considered as CONSTANT.
* Python is case-sensitive.

#### HIghlights of Day 1I

* Compiler - is OS independent but Arch dependent
* Linker - It is OS dependent and arch dependent
* Interpreter - It is OS and arch independent
* .obj - OS independent and arch dependent 
* .exe - it is OS dependent and arch dependent
* .py/.pyc - It Independent of OS and arch