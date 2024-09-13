Day 4

Day goes with the revison of list collection, that is a collection of sequence, apart form tuples and strings, lists is mutable, that means dynamically changed. Different types of functions that are available with the list sequence, such as `count()`, `copy()`, `sort()`, `reverse()`.

String are not mutable, it can’t be changed. 

So how does indexing mechanism works in python? Indexing means getting the value from the list, when iterating over it. There are two types, positive and negative indexing. No language supports negative indexing. Idexing can be done using subscripting operator, meaning `[]` specifying a index. But there are few things:

* `IndexError` is the error that will occur if tried accesing index that is out of the list, mening if four elements exist in list, then can’t access `list[5]`.
* You’ll see an `TypeError: list indices must be integers or slices, not float` if you tried using `1.3` something like that in the subscript operator to access the list element.
* In python you can control iteration using `for … in … ` loop, in order to :
```
>>> number = [0,1,2,3]
>>> for i in number:
...   print(i)       
...
0
1
2
3
```
* Remember that `i` is not iterating over the indices of the list, that means that when iterating using `for…. in ..` loop, you are directly accessing the index, you might create a sepreate list for the `number_index` list to access index. It doesn’t work like C/C++.
```
>>> for i in l1:
...   print(i)
... 
String
Stirng1
String3
```
* Because in `for … in ` loop, it directly access the individual object of the list, if is it string, integer, tuple, or list itself.
```
>>> for i in l1:
...   print(i)
... 
String
Stirng1
String3
```
* `range()` function accepts three arguments, start, stop (upperbound, meaning it will leave the last one), and step, where step is the value to generate the number, by default it is 1.

 Remember that range() function is just an iterator, or generator that only generates that values, in sequence as desired. 

* You should always use `range()` only as generator. Remember to use `range()` with the list function if you want to generate a list of numbers. This is exemplified below:
```
>>> list(range(1,10))
[1, 2, 3, 4, 5, 6, 7, 8, 9]
>>> print(range(0,12))       
range(0, 12)
>>> numbers = list(range(10,101, 10))
>>> numbers
[10, 20, 30, 40, 50, 60, 70, 80, 90, 100]     
```
* Instead of creating a whole list you can just iterate over the range function and get the values.
* Python `range()` function iterates in uni-directional, bi-directional praadigm, meaning it iterate in forward and uni-directional way, however you might choose to iterate in opposite direction, in bi-directional way, as exemplified below:
```
>>> list(range(-100, 10, 20))
[-100, -80, -60, -40, -20, 0]
>>> list(range(100, -100, 50))
[]
>>> list(range(100, -100, -50))
[100, 50, 0, -50]
>>> numbers.extend(list(range(100, 1000, 30)))
>>> numbers
[10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 100, 130, 160, 190, 220, 250, 280, 310, 340, 370, 400, 430, 460, 490, 520, 550, 580, 610, 640, 670, 700, 730, 760, 790, 820, 850, 880, 910, 940, 970]
```
* You can use negative index postion in python in lists.
* Last value of list can be accessed using `list_name[-i]`, where `i` starts from `1`. For any index, say `-i` the corresponding mathematical index is  `len(list) - i`.
```
>>> l1
[1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
>>> l1[len(l1)-2]
17
>>> l1[-2]
17
```
* Python also supports slicing of list, meaning you can get the sequential slices of the collection or sequence. The syntax is simple, specifying start and stop (the upperbound) sperated by semicolan.
```
>>> numbers
[10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
>>> numbers[2:6]
[30, 40, 50, 60]
```
* You also think of it as using the range functionality as slicing. Slicing has few properties:
    * The default value of start is 0
    * The default value of last is last position
    * The default value of the next count is 1
```
>>> numbers[:]               # list all the elements in the list
>>> numbers[1:len(numbers)]  # retuns the same list
>>> numbers[::-1]            # list all values in reverse order
```
* Now what is a tuple? Python’s default collection, which supports immutable sequence creation that can’t be edited, modified, or changed.
```
>>> t1 = "Hello", "Reva", "$0$"
>>> t1
('Hello', 'Reva', '$0$')
```
* A tuple can be created by specifying your elements seperated by comma. But remember in order to create a tuple with single element of tuple, you need to specify it along with a comma, something like this:
```
>>> t2 = 3
>>> type(t2)
<class 'int'>
>>> t3 = 4,
>>> type(t3)
<class 'tuple'>
```
* If you wanted to create a tuple with a single value, you need to understand that it will store that value as the type of object, meaning it will store the element as the variable.
```
>>> t1 = list(range(1,6,3)), list(range(5,10,3))
>>> t1
([1, 4], [5, 8])
```
* Even if you are converting a list into a tuple with single value, it will store it as `(“Tuple”,)`
* You can create a tuple using a tuple function, using `tuple()`, and can convert a sequence into a tuple. 

Note that you can’t do anything to a tuple, you can’t even call all the functions like lists. Tuples are immutable can’t be edited. Tuple do include few operation that can be performed on tuple. `count()` and `index()` are two such operation that can be performed in tuples.

* Using tuple you can return multiple values using tuples, because tuple is very popularly used for unpacking of values, meaning you can send or pass lots of values using tuple. The example below explains that the unpacking of elements happens even when you return multiple values, something like this, `mul, div, add, sub = function(77)`.
```
>>> t1
('Hello', 'Reva', '$0$')
>>> x, y, z = t1
>>> x
'Hello'
>>> y
'Reva'
>>> z
'$0$'
```
Remember that this behavious of unpacking of items can be done throughout python, not only in tuple. This can be done using lists, tuples, and other collections. You might get `ValueError` if you tried unpacking more or less variables than that are available in the sequence.

* Tuples do support indexing, as elements in the sequence can be taken by iindices.
* Tuple also support the same paradigm of slicing and indexing as that of the lists.

What is multi-dimensional collections? Meaning collection of collections or multipl dimension of collections. It is something like list of lists, tuple of tuples, list of tuples, tuple of lists.

* Until now we looked at lists, which were single dimensinal lists, but list of lists like like something like this:
```
>>> number
[[1,2,3], 
 [1,2,3], 
 [1,2,3]]
```
* When you create multiple lists in a list, individual list is seen as the single object, every position points to an object, say list, all of them can be accessed and the very object within the list carries the address of the object stored in the memory, can be accessed using index, say `number[1][0]` will return `1` of first element of second row.
* Remember that every single object, will be treated a seperate object (in our case, a single list).
```
>>> number
[[1, 2], [1, 2, 3]]
>>> for i in number:
...   print(i[0])
... 
1
1
>>> # Similar to lists tuples supports the same operation
>>> t1 = tuple(range(1,6,3)), tuple(range(5,10,3))
>>> t1
((1, 4), (5, 8))
```
* There is no restriction on lists, they can adopt any number of lists or any size. Because it is mutable, you can do any kind of operation on the lists, in fact on every object of the sequence. If you need to make changes within a list, you need to first reach to the object (in our case, the list within the list), as you will require to reach the list itself, `number[0].pop(2)` then you could perform list operation.

Remember you can add, edit, remove, and modify the list, even if it exist within a tuple, you can make changes in the list within a tuple but can’t make change in tuple, though removing all the element of the list will work, but the list can’t go off the tuple, because individual element of the sequence

* Remember that immutable objects are always faster than mutable objects, because the mutable objects needs to keep the track of changes. Few of the differences between list and tuple can be stated:
    * list uses linked list to store the values
    * tuple uses flat list to store values
    * list is slower as it has to traverse through the linked list to get the value
    * tuple  is faster as it can directly jump to location
    * the values in list aren’t stored contigeuosly, yes the values, not inside the memory, meaning when python stores the values of lists, say `my_list = [“hello”, “reva”, 404, [“hello”, “mrdhvi”, 402]]`, each value or say each object is stored in sequence, but inside the memory, there are pointers to these objects stored in contigeous memory.
    * and, tuples values are stored contigeously 
* The main thing is that tuple uses the metadata of the data, as when called it directly takes the data from the memory and return to you.

So what is a set? Set is a collection of unique elements stored in unordered items, meaning when you define a set, the items within it aren’t stored in sequence. Though set is a collection. 
```
>>> s1 = {"Hello", "World", 21, 2, 21, 2, 'Hello'} # collection of similar and dissimilar values
>>> s1
{'World', 2, 'Hello', 21}
```
* Set is mutable and slicing and indexing isn’t supported.
* Set uses Hash function to store the values. What is hash function? It is used to calculate the position or index of the value, meaning that If I were to decide where 10 items should be placed, hash function will decide the 10 indcies and decide where the item will be placed, so that when required I can directly go to the desired location and store the values at the index.
* Remember an empty set can be created by specifying a `set()` before the set variable, you need to specify the set function to declare the empty set.
* There are certain operation that sets can perform:
    * Union, intersection, subtraction, and symmetric difference can be performed on set.
    * Set also has a feature of membership check. This is shown below:
```
>>> s1 = {[1,2,3], [1,2,3]}
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unhashable type: 'list'>>> s1 = {[1,2,3], [1,2,3]}
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unhashable type: 'list'
```
* It will give you an unhasable type. Only mutable objects can’t be part of sets, like lists, because hashable type for different types is different, but it can’t do the different datatype hashing at the same time.  
* Sets can be also immutable, called frozen sets, using `frozenset()` function, then any other element can’t be edited or added any other.

Let’s get into Dictionary? Dictionary is one the way that dictionary can store a meaningful data. This is because, dictionary uses key:value pair, each dictionary is accessed using the key that it can be edited, modified. 

When creating a dictionary, you need to consider creating key as string only, it can be through of different data type but you can create dictionary with different values.

* You can access the keys using syntax `d.keys()` and get the values using `d.values()`.
* Remember that lists are solely dependent on the indices, but the dictionaries are only dependent on the keys.


Note * **vim is written by bill joy**
