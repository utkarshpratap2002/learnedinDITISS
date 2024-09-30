# Methods

It is encountered that if your write you have bad memeory, you might need writing few mistakes down, that's how a brain learns to not do mistakes.

### Trying to use list inside the string formatting

The function `mergerAlternatelt(str1, str2)` is returning a list that is passed as the list, but while string formatting a string is needed. 

```
print(f"|{mergeAlternately('abc', 'xyz'):^10}|")
```

This is will raise a **`TypeError`**, as python does not allow directly format a collection of characters using **f-string**.

You can use this instead:

```python
print(f"|{str(mergeAlternately('abc', 'xyz')):^10}|")
# Output:
 |['a', 'x', 'b', 'y', 'c', 'z']|
```

or you could use `join(list_name)` instead:

```python
print(f"|{''.join(mergeAlternately('abcd', 'xy')):^10}|")
```


### Use `collections.Counter` method

You can use `Counter(str_name)` method, which returns the string characters in a dictionary format, containing the character as *keys* and their occurance in the string as their *value*. 

```python
>>> from collections import Counter
>>> s
'abcd'
>>> s
'abcd'
>>> Counter(s)
Counter({'a': 1, 'b': 1, 'c': 1, 'd': 1})
>>> Counter(t)
Counter({'d': 2, 'a': 1, 'b': 1, 'c': 1, 's': 1})
```

You can import `Counter()` from `collections` module, if you pass any object to it, it returns a dictionary.

You can also use `get()` method of dictionary to retrieve the value using the specific key. *Now, why is using `get()` is so differnt from just using dict["key_name"]?* Because when you use `get()` method, if it didn't find the specific key, it won't raise an error, as the `get()` function returns **None**, though, there is a bit extension to the `get()` function that allows you to pass the value that will return if it didn't find the **key**.


### Recognising pattern within a string

You can use pattern recognition in strings using the slicing mechanism in  strings, say a string `haystack = 'sadbutsad'` and need to recognise a pattern say, `sad`, you can do that using `haystack[0:len('sad')]`, which will give you the result as `'sad'` and probably can iterate over the string. 

If you've got a string say, `'mississipi'`, where you need to recognise the pattern, say, `'issi'`, you can do that by iterating over the complete string in the length of `'issi'`, in `range(0, len('mississipi'))`. This is called pattern recognition. 

<br>
<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note</strong> Though, there is another module to do the same using the `re` package. This package allows you to create template of pattern that you want to search and returns you 
</div>
<br>

*There are ways how patterns in string behaves.* If you consider a string say, `ababab`, if doubled the string, it is expected to see the repeated pattern at least twice in the doubled string. 

1. If **`s = 'ababab'`** then the expected output is **`s+s = 'abababababab'`**.
2. If **`s = 'ababba'`** then the expected output is **`s+s = 'ababbaababba'`**.

Take a hold of both the example, because if I try to search for my string `s = 'ababab'` within the doubled string, searching by exclusing the **first** index of the doubled string, I will find the string at least one and it will only happen if the string is repitition of any possible substring. Therefore, we can recognise the fact that a repeating pattern can be formed using smaller substring.

*How to implement this method?* Implementing this method is **one liner**, first, double the string using `+` operator and use `find()` method.

```python
return (s + s).find(s, 1) != len(s)
```

*What does `(s + s).find(s, 1) != len(s)` is doing?* The `str.find(str, start=0, end)` function returns the index of the doubled string where the searched string is found. It returns `-1` if the string is not found. We have specified that is searched index shouldn't be equal to the `len(s)` because if string has non-repetitive pattern, then it will appear on the `len(s)`, this can be checked:

```python
>>> s+s
'ababbaababba'
>>> (s+s).find(s, 1)
6
>>> 
>>> len(s)
>>> 6
>>> # This won't be the case in string with repetitive pattern
>>> s = 'abab'
>>> (s+s).find(s,1)
2
```

***Why this works?*** This works because in a specified `range(1, len(s)-1)` any non-repeating string, string would not occur for the second time, therefore, `find(s, 1)` finds the string starting from first index, not *zeroth* index. 

### Removing zeroes and adding them at the end

Though you can use list functions like `pop()` by index and then pop the `0` from the index once you find them, then appending them to the list, which will automatically add the list at the end of the list, but there could be an easy approach to this.

*You can iterate over the list though keep track of the number of zeroes in the list, once the list is formed with all non-zeroes on the front, assign the remaining number in the list as zero.*


### Using `map()` and `lambda` function

If you want, you can use both in a versatile way. If you could see the code below, explains the best way the code can written in the most simplest way possible.

```python
def Double_(num_list = [[1,2,3,4,4,5]]):
    
    double_ = lambda x: x*2                 # After lambda function, variable becomes function

    num_list = list(map(double_, num_list)) # Here `double_` is a function through which the list iterates, each element getting doubled

    print(f"The updated list => {num_list}") 
    # Output: The updated number list => [2, 4, 6, 8, 8, 10]
```

For example, you have an interable object that you want, if you could perform some kind of operation on the iterable object, you could easily use lambda function.

```python
>>> operate_ = lambda x: (x//20) + 3
>>> num = map(operate_, range(40, 120, 20))
>>> num
<map object at 0x1014a5c00>    # this shows how num points to meory location until casted to type() == list
>>> list(num) 
[5, 6, 7, 8]
```

### Difference between Inheritence and Association

**Inheritence** is inheriting the methods or attributes of the parent class, where all the attributes will be created within the child class and child class will be able to access them and manipulate them as well, on the other hand, **Association** is something different than this, where the classes' reference is created within another class saving the reference of a associated class in a attribute. 

Let's get to a simple example of Vehicle and Cars, hear this out, *Every car **is a** vehicle*, meaning that if it is a Car, it would have a attributes of Vehicle as well, that is called Inheritence. 

Let's take another example of person and address, again, hear this out, *Every person **has a** address*, meaning if there is a person, he would be having a address section too, that is one of example of Association.


### `abs()` function removes the sign

If you want to remove the sign of the number and only needs the mangnitude of the number then you need to use the `abs()` function.

```
print(abs(-10))  # Output: 10
print(abs(10))   # Output: 10
print(abs(0))    # Output: 0
```

### Ternery Conditional Expression

You can use the return method to impove your return statement efficiency using the syntax :

```python
return <value_if_true> if <condition> else <value_if_false>
```



