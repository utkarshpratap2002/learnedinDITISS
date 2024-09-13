# Day 2

Day goes with the revision of the last session, such that explaining how different modules of python, storing `.py` file will be setting up in the memory, therefore you need to understand the Operating system itself. This means when the OS boots, what exactly happens relating to the memory, how the memory management works, like how the variables are saved into the memory.

Symbol	data type	value	address
num	int	34	0x24

Symbol table is nothing but an identifier, as when you try to define a varibale `num` symbol table keeps track of the variables formed.

* **Convention in Python** - Declaring a constants can be done using the uppercase letters, naming them with uppercase letters doesn’t mean that this is a constant, it can be changed but we as a developer consider it as constant, meaning while writing in python we will consider uppercase variables as constants. It conventional to use it as constant.
* **Statements**, we all know statements, which is the one that will get executed and will returns to a instruction.
```
>>> num                                                      # This is not allowed
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'num' is not defined. Did you mean: 'sum'?                                  
>>> PI = 4.56`                                               # is a statment
>>> name = "abc"                                             # in python we execute a single line statement
```

* `name = “abc”` is a single line statement, you can also write multiple line statement like this:
```
print(num); print(name)         # semi-colen is optional but necessary only in multi-statements in a single line
```

* So what kinds of data types are available in python? If you need to store an integer value in variable `int`, you need to tell the python that it needs to be seen as `int`, telling python how to interpret those values, not only interpretation, but it helps python to understand what kind of operations can be performed on a variable.
* Under the category of Numeric data types there are:
    * Integers : 20, -100, 100
    * Float : 15.6
    * Complex : 20 + i5
* Remember, `int` object is totally different from the `float`

Distionary is not a sequence?

|Numeric	|Dictionary|Sequence  | Set |	Boolean  |
|-----------|----------|----------|-----|------------|
|Integers|	*key:value pair*|	List. [20,40]|	Collection of unique values|	True/False|
|Float|		|Tuple. (23, 22, 90)	|	
|Complex	|	|String. “String”		

* So How python knows what is data type is the variable? Literals, is a raw variable to tell python what kind of data type a variable is. Through literals python decides what kind of data type a variable is.
```
>>> print(f"{l}")
[1, 2, 3, 4]
>>> print(f"{[i for i in range(1,6)]}")
[1, 2, 3, 4, 5]
```

* In python you can use single, double or triple quotes while declaring a string literals. Remember if you want to write a multiple line of code, you will specifically use triple quotes.
```
>>> print('''
... We
... are 
... using 
... triple 
... single
... quotes
... '''
... )

We
are 
using
triple 
single
quotes
```
* You can assign a True or False value to specify a boolean value.

There is no other decalration paradigm other than True and False to declare a varible as boolean.

* Special Literals is a one that has None in its value means that you can specify a nontype class, you can assign it a uncertain type.

|Static typing| 	Dynamic typing|
|-------------|-------------------| 
|Compiler checks the type of variable|	Data type will be assigned at the tim of running app| 
|Compiler assigns data type at compilation|	Data type wil be inferred (Automatically assigned a lanugage)|
|Dev must provide data type to every var|	
|C, C++, Java|	Python and Javascript are dynamically assigned language|

Let’s understand what it means by Static and Dynamic Typing in details:

1. Checking type of variable happens when compilation beings, meaning the type of variable is assigned by the compiler, this means that the developer should assign the type of variable, a variable should be fixed, and should be known as well. At the compile time, compiler ckeck the variable and all the shoulds of it, and assignment of data type happens on compilation.
2. On the other hand, In dynamically typed languages, the data type is checked by the interpreter during the run-time of the program, meaning when program is running, the variables are checked by the interpreter to automatically infer the type of the variable. This adds a layer of flexibility to variables that they can carry different types at the different times, becaue python will check which type is to be inferred while it is executing the program.
  
* But remember, python is both dynamically typed as well as weakly typed language, meaning that you can assign and change the value with different data types in python.
* But there is something called type hinting feature, thus, giving the hint about the variable what it might be, you are giving the hint of what an object might be.
```
>>> num: int = 30
>>> num
30
>>> num: int = "String"
>>> num
'String'
```
* But remember, type hint is helpful while wrting codes in PyCharm which gives IDEs an intelligent indicator for the developers when trying to change the contents of variables, but this doesn’t change the fact the you can put interger literals in the string type hint. 
```
# variable creation
my_var = 20

# assignment
my_var = 40

num: int = 20
print(f"num = {num}, type = {type(num)}")

# here the str hint will be safely ignored
# the str hint is made for IDE (PyCharm)
name: str = 670
print(f"name = {name}")
```
See that declaration of `name: str = 670` is made `str` but the IDE is able to recognise the fact that `name` isn’t `str`.

Python has its own way of looking at memory, so this means that when you run scripts you don’t need to take care of memory becuase PVM manages you memory that the PVM itself is a software using system resources but the memory, the resources (basically memory) is seen in a very different paradigm than that of the system. The way your system manages memory is different than that of the Python interpreter. When we talk about C/C++, these languages use system memory directly, therefore, you must be familiar with the sizeof() and pointers in the C/C++, infact you can also access the address of the memory.

* Python has two kind of conversion:
    * Implicit Conversion - Python tries to convert the data type from one to another, only wehnn smaller type gets converted to bigger one, meaning if `result = 10 + 35.50`, float is bigger than integer, therefore, python will convert the data type of result to flaot. This is called Implicit conversion.
    * Explicit Conversion - Python also supports the explicit type casting as it can be explicitly converted to the type you assign, meaning of `result = 10 + 35.50`, where if you assign a int before operation, it will convert the result to int, hence, will give result as 45. Though, remember that in Explicit conversion, there might be loss of data becuase you are enforcing the data to a specific type.

If you tried the conversion of `str` to `int` then it will give an error, but if you tried converting `’30’` or any number which is string will be converted to `int`. This behavious is because python checks if the string contains characters that can be converted to numberic and perform a valid operation, like `+` or `-`.  Python’s got a intelligent  Note that if you try converison of True of False using explicit conversion, it will give the values 1 and 0. In case you want to write the oppsite, when converting the interger values to bool, say, `bool(1)`, `bool(100)`, `bool(-100)`, you’ll get value True, otherwise to only `bool(0)` you’ll get False. 

* Python supports various operators, operator that helps in performing the operation that allow logical and relational operations. We already know things like floor division, that return a int value like `40 // 21` gives `1`, when you use `40 / 2` gives `20.00` which we call as true division, including `*` operator with string, it acts as repetition operator, `”0” * 10`. If tried something like this, `'string' / 3` gives a TypeError, but when do this, `'string' * 3` gives `'stringstringstring’`. Apart from this, the operators, and, or, not, operates and will be operated only on boolean values.
* Bitwise operators is worth talking but we’ll be talking about it later.

# `function(concept)`

So How the python function is different? Functions are very different from that other languages, let’s first look at different points.

* In python there are two kinds of errors, Compiled Time Error, as well as Run Time Error. In python, indentation creates a block of code that allows python to differtiate within different lines of code.
```
>>> age = 80
>>> if age >= 40:
... print("Yes")
  File "<stdin>", line 2
    print("Yes")
    ^
IndentationError: expected an indented block after 'if' statement on line 1
```
* If you missed the indentaion, you will see an error. 

For general understanding of the functions, there are two things, POP (Procedural Objective Programming) and OOP (Object Oriented Programming)

* If you want to define a function you need to declare a function using a name of the function followed by `def`, along with the semi-colen.
```
def f(parameter):
  """Documentation String"""
  print("Statments")

f(21)        # A function should be defined only after the function is defined.
```
* Python supports by default polymorphism, becuase you don’t need to specify what data type you are passing as argument to the function, meaning if you run above script as module, you can pass any argument and even can overload it without any extra function creation for overlaoding. This is show in the example below:
```
>>> learn.f(21)
Statments 21 and <class 'int'>
>>> learn.f()
Statments String Only and <class 'str'>
>>> learn.f((1,2))
Statments (1, 2) and <class 'tuple'>
```
* Python can return only one value, meaning only one value.
* And every function can return a value implicitly as well as explicitly, meaning if our function `f(parametre)` has no return statment, this doesn’t mean that it doesn’t return anything. This is exemplified below:
```
>>> print(learn.f(21))
Statments 21 and <class 'int'>
None
```
A function by default returns a None value. Remember, any statement after the return statement will never run, it is unreachable.

* A function within a function
* Scope in Python are of two types, Local scope, and Global Scope:
    * Global scope
        * Entity can be accessed from anywhere just that it shouldn’t be defined in any of the function.
    * Local scope
        * Entity is accessed within the scope of function, can be accessed within the same function only.
* You can only change the global variable within a function only after specifing the variable as `global` before the glabal variable. If you tried using the glabal variable within the same function it will only change the variable within the scope of that function only, not beyond that. 
