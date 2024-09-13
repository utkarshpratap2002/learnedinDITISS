# Day 3

Day goes with the revision of the function as what happens when function is created and needs a semicolen to differentiate the block of code and to become a part of function. To know what happens behind the function, we need to know that python has four paradigms. Procedural programming, object oriented programming, functinal programming, and importantly metapprogramming (Aspect oriented programming).

* For a pragramming language to become a functinal programming:
    * the functions are econsidered to be first class citiens
        * functions are treated as variables
        * a variable can be considered as of type function
    * a function can be passed as argument to another function
    * a function can be treated as the parameter to return a value
* Remember that python is considerd to be a functinal programming language. 

What is the nature of variable in python? Let’s consider a example:

* If created a variable `num = 200`, then assigned `num` to new variable `my_num`, `my_num` points to the same object as that of `num` but if changed or modified the value of `my_num` then a new copy of the object `my_num` is created.  

However, if dealing with immutable objects, like int, strings, tuples the same paradigm works, where the objects initially points to the same object, but on modification, they create a new copy of it.

* Functions behave in the same way, where if you created a function, say `function1()`, and assigned it to another function `my_function1`, `my_function1` is not a new one but pointing to the same function `function1`. This is called Function alias, using it as another name for the reference function.
```
def function1():
    """this is a sample function"""
    print("inside function1")

# created another function using the existing one
my_function1 = function1
my_function1()
```
This proves that functions assignment happens the same as that of variables, unless you change or modify them. Remember that variables like int, str, tuple, lists are different objects in python, thus, functions behaviour changes when there is change in function.

* When you create a variable, say `num = 200`, it get stored in the memory,  say gets a memory location `0x10000` and gets the name as `num`. And when you define a function, `function1()`, it allocated the memory for the function too, exactly the way the variable got stored into the memory. But remember that when you declare a function, two memory locations are created, one for the function defination, another for reference to the function code block. The block that contains the function defination contains the reference memory to the body of the function, meaning code block. 

You can also print the function value of the function as you do with the variables, you can do this, `print(function1 = {function1}’)` giving you the result as `function <function function at 0x104dbfec0>`.  But this doesn’t mean that you can access the memory address of the function, the return statement only explains the fact that this item or object is stored in the memory, meaning the content of the memory.

* The memory in python in accessed through Operating system, but PVM is the only medium to access the memory, which python communicates with the PVM and get the desired address. Though the address is communicated with the OS, it doesn’t mean the memory can be communicated through python. Python doesn’t allow the access of memory.

What happens when you do a function assignment? The behaviour of function changes when you do a function assignment.

* On function assignment, the function will point to same function, meaning if created a function `function1()` and made another assignment, like `my_function1() = function1`, here you’ve simply referenced `my_function1` to `function1`. 
* This also mean that when you make a changes to `my_function1` the change wiil be reflected in the `function1` because both functions are pointing to only one memory location that has a hold of the code block.
* Now, what is function alias? Function alias is defining more than one function with the same name, if you created two different code of blocks for the two functions with the same name, it will update the function with the last defined function, meaning the last modified function (code within the function).

If you created two function with the same name, then you need to understant that the one in last will be updated over the above one. 

* Functions in local and global scope work differently as they both have and are defined in different scope and will accesesed accordingly and therefore local function cannot be accessed beyond the function, meaning outside of the function.
* Functions do have certain properties:
    * Inner function can access all the parameter and members of the outer function, the one defined inside the outer function.
    * Any member or variable defined in inner function, the outer function can’t access it, therefore, if you tried changing any variable defined in the outer function, you can’t change the variable (defined in outer function) in the inner function, this also means that outer function can’t access the members and variables of the inner function.
    * In order to change the variable defined in outer function, use `nonlocal` keyword, but in order to change the variable defined in the global scope, you need to use the keyword `global` , using `global` variable will help you access the global variable defined in the global scope. But in order to use the variable defind within the scope of outer function, you will only use `nonlocal` keyword.
    * All the function defined in the local scope, the function create a different function within the local scope of the outer function.

The `nonlocal` keyword is used in order to change the variables of nerest non-global function. Here, the nearest, non-global function means that outer function within which the function (inner-function) is defined in, if we take an example as below, where a function was defined as `outer_function` and a variable inside `outer_function` as `x`.

What is *lambda function*? There are named function, for example created a function `get_square()`, which is named function, as well as anonymeous functions, called lambda function, can be created using lambda keyword. A function defined without a name.  
```
lambda, arguments : expression
```
* lambda functions can be immediatly invoked, meaning if return a lambda has `number ** 2` expression, returning a square of a number, only one statement of the body.
```
def get_square(number):
    return lambda number ** 2
```
* lambda always gives you a better performance, because if you decalared a variable, `get_square = lambda number: number ** 2` will return a square, you don’t need to create a dedicated function for the same.
* Basically, lambda function always change variable to a function, meaning when you assign lambda function to a variable and passes arguments, these arguments can be sent to the variable `get_square` and get a square value, of the argument, in return.
* You can’t write statements in the lambda funtion, meaning a expression is just an operation with variables passed as arguments written as a single statement.

## `collections`: Container Datatypes

What is collection? Collection of similar or dissimilar values. List, tuple, dictionary, and set supports `collections`. First we’ll understant list collection:

* `list` is collection of similar or dissimilar values, they are dynamic in nature, can be dynamically change and update the values. In python lists are created by placing element inside the `[]`, and lists are mutable, meaning it can be changed, modified, updated. All operations like add, remove, edit any element of the list.
```
~/Python$ python collections_list..py 
l1 = [] type of list = <class 'list'>
```
* List can be created empty list using syntax `l1 = []`, empty list can be created using type casting, `l1 = list([])`.

l2 can only be declared using the sequence that already exists, if you tired assiging a `l1 = list([])` this will throw an error.

* So how lists are interpreted in memory? There is a block of memory that stores the reference to the block of data containing elements of lists, that contains the sequential (not contigeuosly), meaning memory can be scattered, but while using lists you need to access them, you can access them sequentially.
* Lists of string values can be created by adding element inside the list, say, `countries = [“India”, “USA”,  “UK”, “Japan”]`  
* List of dissimilar values can be created by added different types of element inside the list.

How many functions are available in lists? Lists supports various functions:

* `len()` - get the length of the list, using `len(numbers)`, will return a lenght of number.
* `append()` - add a new value at the end of the list, like `numbers.append()`. This method can be used to append strings and tuples, lists.
```
>>> l2.append((1,2,3))
>>> l2
[12, 12.0, 'japan', (1, 2, 3), (1, 2, 3)]

* `insert(index_, object_)` can be used to insert the value, this method accepts two arguments, the index you want to insert the value at along with the element.

>>> l2.insert(0, 9)
>>> l2
[9, 12, 12.0, 'japan', (1, 2, 3), (1, 2, 3)]
```
* Python supports `extend()` method, where you can pass a collection and see you values added as the elements of the lists. You can add a list, tuple or any sequence of numbers to add the items to the lists as items, not as sequence.
* You can use `pop()` method for extracting the last element in the list, meaning using it as the stack. You can also specify a index to remove the value at particular index. Remember that `pop()` method also returns the value that was extracted from the list.
* Apart from `pop()` you can use `remove(object_)` method, passing the item to be removed as argument , you might get an error if you tried removing something that doesn’t exist in the list.

Remember that, when you use `remove()` method it doesn’t return anything, but in `pop()` function, it returns the element that it removed from the list, meaning `pop()` method removes the whole index, doesn’t care about the content stored in the index. Remember that `pop()` methods removes the item with index 

* `count()` will return a number of times the item occured in the sequence.
```
>>> l2
[9, 12, 12.0, (1, 2, 3), (1, 2, 3), 2, 3, 'string', 'String']
>>> l2.count((1,2,3))
2
```
* `index(_value, _start)` method allows you to change from where it should start checking, goes from left to right, and check for desired value. Remember that it will only check for the item’s occurence after the `start_` index number.

The `index()` method also supports slicing machanism, like `index(x_, start_, end_)`.
```
>>> l1
[1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
>>> l1.index(15)
7
>>> l1.index(15, 5, len(l1)-2)
7
```
* `clear()` will remove all the values or items from the list.
* `sort()` will the sort the sequence in the ascending order and can pass the `reverse` argument as `True` to reverse the order of sort, meaning it will start the sorting in reverse, that means it will start sorting from last index.

List assignment happens slightly in a differernt paradigm, that when you assign a list, say, `nunber1 = number2`, number1 and number2 both will be pointing to single address in memory as they both are pointing to the same sequence of list. If you changed any one of the list, you need to consider the change in both of the lists. Therefore, you can use `copy()` for the shallow copy of the list.

List collection uses `for` loop as well as `while` loop, that is for the iteration over the sequences. Apart from `for` loop there is `for … else` loop and `while …. else` loop. You can also use `for in ..` loop.

Joseph despenza. 

# Learn `git`

What is git? A distributed version control system. 

Installation of git can be done using getting onto their website https://git-scm.com/downloads and to check if you’ve already downloaded the git, you can open the terminal (on macOS) and check for version using `git —version`

1. The very first procedure in git is to tell git who you are to manage your local repository.  In order to understand, think of Git which is composed of two repositories, local and remote.

* A git is called version control system. Centralised server. 
* Linux was developed on Bit Keeper, which was very costly. In June 2005, he created git and August 2005 became the most used system, Bit Keeper lost alot of money, because of Git.
* What is remote repository, when a copy of that repository is on my machine, that is called local repository. 
* Git Architecture? A local repository exists on a computer, logically devided into three parts. First is working directory, Staging area, and actual repository.  
* Architectureally, you need to first create a working directory, and then you need to give it a cmd, `git init`, creating a hidden directory by name `.git` inside the working directory. The cmd to bring the working directory to staging directory, `git add /add/file/path`.
* After to commit you can use cmd, `git commit -m “Why”`, which means why you are commiting this repository.
* In order to define “who” did this set-up, so use cmd, `git config —global user.name “name_of_the _guy”`
* “Who”, “When”, “Why”, you need to handle local repository. But you need to manage your remote repository on github.com.
* Then in order to push to your git, you need cmd, `git push`, to do a full copy of the repo, `git clone url`, and for latest changes use, `git pull`.
* You can use `git status` to understand where are you on the git.
* `git log` is to check logs.
* Now if you need to make a commit while ignoring few files, you can do that by mentioning all kinds of file extensions or kind of folders inside the `.gitignore` .

Now, you need to create a remote directory on github.com.

* Before you push your local directory, you need to create token. Go to git settings, select developer settings, then select personel access token, select classic. Then click on Create Token. Then select every checkbox, creting token with full permission. Copy your token, becuse you will see it only one.
* Now you need to tell github where your git local repo is located, and you need to connect them. First, connect to the repository using cmd, `git remote add origin url`, then you need to be in your main branch, then push the local repository, `git push origin main`
* Github organisation, you can create a new organisation, meaning you create aorganisation by name , `d1-12345-nileshghule` and then mark it personal account, then 
