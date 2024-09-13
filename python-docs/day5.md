Day 5

Day goes with the revision of dictionary, collection of {key:value} pairs but this is about the how the arguments are passed and dictionary has a role in argument passing.

* You can’t store element or information of person in `sets`
* Therefore, you need to use lists.
* If you can see in `inner_fun()` where we are printing the information of the dictionary, the elements of the dictionary was accessed using the key, because it allows you to directly access the values using keys.
```
def fun1():
    # creating person info*
    person = {
        "name": "Reva", 
        "age": 22, 
        "place": "pune"
        }

    def inner_fun(person):
        # printing person info*
        print(f"name => {person['name']}")
        print(f"age => {person['age']}")
        print(f"place => {person['place']}")

# Output:
name => Reva
age => 22
place => pune
```
If while accessing the keys of the dictionary, you use double quotes person[“key”], you might get an error, because that will be caused due to the improper use of double quotes, you need to use single quotes like mentioned in above snippet.

* Never prefer sequence for passing the elements as arguments if you don’t want any changes to occur, use tuple.
* You can define a dictionary in such as way:
```
# way 1
person1 = {"name": "reva", "age": 18, "address": "pune"}

#way 2
# create an empty 
car = {}
# add key:value pairs
car['color'] = "lmn"
car['color2'] = "xyz"
car['color3'] = "abc"

```
* Remember, there always will be one one key with one value, even if you tried making a key with same value, then you see your previous key getting overirde with the new value.

It is recommended that you only use the string value as the key, though you can also use the one with otherkind of sequences, but a convention to use only string type as keys while defining a dictionary. 
You can use `”color”: None` to define key:value pair, 

* In the below snapshot, you can’t leave a string after a comma, because it’ll expect a value for the respective key.
```
>>> # There can be any data type within a dictionary
>>> person2 = {"name": "reva", "age": 18, "address": ("agra", "284001")}
```
* In dictionary you can remove the element in the dictionary using `del` statement. In order to remove the element in the dictionary you need to know the key, you can’t remove the element without it. 
```
>>> del person2["age"]
>>> person2
{'name': 'reva', 'address': ('agra', '284001'), 'key': (1, 2, 23)}
```
* If you using `person2["hobbies"]` where hobbies doesn’t exists, the you’ll get a key error, but in `get()` method it doesn’t crashes, it will return None, instead of raising an error, because most of times, you don’t know what keys are present in dictionary, if you are not damm sure, you don’t use square brackets, then you use `get()` method. This is also exemplified in below example:
```
>>> person2["name"]
'reva'
>>> person2.get('name')
'reva'
>>> person2["hobbies"]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'hobbies'
>>> person2.get("hobbies")
>>> # It executes without any issue
```
* When iterating over the dictionary, never assign a key in double quotes because key is the key of the dictionary itself, not the value of key, meaning when you are iterating over `person2`, then you can simple use key to refer keys of the dictionary `person2`. Don’t use `person2[“key”]`, which is syntactically wrong.
```
>>> for key in person2:
...   print(f"{key}: {person2[key]}")
... 
name: reva
address: ('agra', '284001')
key: (1, 2, 23)
```
* You can use tuple unpacking in the eaiest way possible, even when you want them to run within a `for` loop. This is exemplified below:
```
# Create a list of tuple
l1 = [
        ("reva", 22, "address"),
        ("reva", 23, "address"),
        ("reva", 24, "address")
    ]
# A better way to print at once
for name, age, address in l1:
        print(f"name: {name}")
        print(f"name: {age}")
        print(f"name: {address}")

```
* Tuples ususally can be used as the best way of unpacking the values in quick and simplest way possible, because when you try to `print(person2.items())` you will get a list of tuples storing values normally tuples do.
```
>>> person2.items()
dict_items([('name', 'reva'), ('address', ('agra', '284001')), ('key', (1, 2, 23))])
```
* A list of tuples containg two values in (‘key’, ‘value’) paradigm. This allows easy access of the values in the tuples, as they an unpacked at ease. This is exemplified below:
```
def function1():
    # Printing a dictionary content using `items()` methods.
    d1_person = {
        "name": "reva",
        "age": 22, 
        "place": "pune", 
        "hobbies": "reading and writing"
    }

    print(d1_person.items())
    print()
    for key, values in d1_person.items():
        print(f"{key}: {values}")
```
* How dictionaries get stored in memory? Behind the scene it stores two collection are created, all the keys will be stored in one collection, then it get managed by another collection, that is why you can store them as an individual callection.

Remember that when using `item()` methods it is only giving the copy of dictionary in the format of list of tuples. It has nothing to do with the dictionary itself. Not even it is a restriction on the dictionary that it become immutable because the dictionary values are getting accessed using tuples. It is just the copy of values of dictionary. 

* If you looking for adding multiple values(parameters) to the function, you can do that using variable length arguments. 
    * To create a VLA, you can use `*` before the argument, such as `def function(*args, **kwargs)` where a single `* ` denotes positional arguments, and `**` denotes keyword arguments or say named arguments.
    * `*args` says that you can pass end number of parameter to it, which are stored as tuples of values you pass. Similarly, `**kwargs` says that it can store all the keyword arguments, which are stored as dictionaries, as keys: values pairs.
```
def outer_fun5(*args):           # '*' makes the arguments of variable length
    print(f"args => {args}, type => {type(args)}")

outer_fun5(23,23,2,3,{1,2,3,3},2,(1,2,3,4),21) # passing variable lenght arguments

output: args => (23, 23, 2, 3, {1, 2, 3}, 2, (1, 2, 3, 4), 21), type => <class 'tuple'>
```
Every time a function is create there will be a function activation record, but remember that symbol table isn’t the same, as a function activation table is executed during the compilation, and symbol table is executed during the runtime of the compiler (or python).

* If you want to pass the variable length keyword arguments, you can go with `**keyword_args`, remember that all the positional arguments needs to come before the keyword arguments. The example for the keyword arguments is exemplified below:
```
# keywords arguments
def outer_fun6(**keywords_args):
    print("Inside the outer_fun6")
    print(f"args => {keywords_args}, type => {type(keywords_args)}")

outer_fun6(k1 = 20, k2 = (1,2,3,4), k3 = ["hello", "reva"], k4 = {"one": 1, "two": 2})

# output:
Inside the outer_fun6
args => {'k1': 20, 'k2': (1, 2, 3, 4), 'k3': ['hello', 'reva'], 'k4': {'one': 1, 'two': 2}}, type => <class 'dict'>
```
* As you can see that when you print all the keyword argments, they got printed as dictionaries as key:value pairs along with keywords as keys.

Note: when you say, `f(name, age)` that means, you are restricting the names and way the parameter can be used, but when you use `*positional_args` and `**keyword_args` they don’t restrict on any name or type of argument can be passed.

* If you need to send a default parametres, you can pass it using `outer_fun7(20, 29, value3=23)` where `value3 = 23` is the optional or default parameter of your function.

what is string collection? String is collection of characters, can be declared using single, double, triple quotes in strings. 

* A doc string could be accessed using the delder `__doc__`method, that retrives doc strings within the function.
```
def function_body():
    """
    This is doc string
    """
    pass

print(f"Print doc string => {function_body.__doc__}")

# Output: 
Print doc string => 
    This is doc string
    
```
* You can use `lower()` method to make string lowercase, and use `upper()` for the uppercase.
* You can use `strip()` to remove the leading and trailing white spaces in the string. This can be used as shown in the below example:
```
>>> s1 = "............This Is A String. This is a string........."
>>> s1.strip('.')
'This Is A String. This is a string'
>>> # Removing the whitespaces by default
>>> s1 = "  This Is A String. This is a string.  "
>>> s1.strip()
```
* Replace a sbstring with another string, using `replace()` method, accepts two arguemts, _old and _new, becaue it is case sensitive. So that means, `replace()` method is a case sensitve function. .Remember that it doesn’t make changes in the same string
```
>>> str_in = "I am going to buy an iPhone"
>>> str_in.replace("iPhone", "Samsung")
'I am going to buy an Samsung'
>>> str_in
'I am going to buy an iPhone'
```
* `split()` methods is used that returns a two part of the string based on the split condition. `split()` by default returns a list of the string only
```
>>> store = str2.split('?')
>>> store
['https:googel.com/index.html', 'key=iPhone']
```
* Strings supports indexing, slicing, and other operations like the list.
* Now, importantly, know that if converted a string, which is collecction of characters, you will get the a list of all the characters in the string. 
```
>>> store
['https:googel.com/index.html', 'key=iPhone']
>>> list(store[1])
['k', 'e', 'y', '=', 'i', 'P', 'h', 'o', 'n', 'e']
```
* Say if you created a list of number, now you want to amalgamate all the elements in the list. You can use `join(list_name)` method.
```
>>> "*".join(store)
'https:googel.com/index.html*key=iPhone'
```
* You can use `join(list_name)` in different styles, thus joining using any string, like `’-*-’.join(list_name)`.
* You add character that is also called as left aligned and right aligned operation.
```
>>> print(f"|{str1:>11}|")
|      Apple|
```
* You can also print floating point numbers, show positive symbols in the numbers using string formatting.
```
>>> num = 900
>>> print(f"|{num:+}|")
|+900|
>>> print(f"|{num:e}|")
|9.000000e+02|
>>> print(f"|{num:E}|")
|9.000000E+02|
>>> print(f"|{num:.3f}|")
|900.000|
```
* You can also check or convert the numbers in different paradigm as converting into the hexadecimal, octal. This is exemplified below:
```
>>> print(f"|{num:n}|")
|900|
>>> print(f"|{num:o}|")
|1604|
>>> print(f"|{num:x}|")
|384|
```
`f"|{num:x}|"` can be used without print statement, inside the python interpreter, this doesn’t need you to use print statement only.

So how do you take a input in python? Python through interpreter or even in console will always accepts input as strings, until and unless you modify them to list, int or any other.

* Python input can be taken as int

Membership operation works in lists, tuple, and sets. 

* There can be `for …. else` loop, where the `else` statement can be associated to the `for` loop, if you add a `break` statement then the `else` blocal will not execute as it will break out of the block and `else ` blocak will not execute.

#### For Next day.
- Can you change a list of number in to the str element.
- Creating a table using lift align and centered aligned operation using strings? 
- String formatting, converting data into beautiful looking table.
- Taking inputs as a dictionary.
- File io
- Modules and packages
- import os
- what is socket? Socket application in python
- Regular expression import re
- Flask => fool everyone
