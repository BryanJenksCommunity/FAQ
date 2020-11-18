# Python Data Structures

## Set

```python
# a set is like a hashtable, the order is not important and they are not ordered like an array
# sets cannot contain duplicate values
a = set([1,2,3,4])
a = (1, 2, 3, 4)

# methods
a.add() # adds an item to the set
a.remove() # removes an existing item from the set
a.discard() # acts like remove but if item is not a part of the set, do nothing and throw no errors (remove quietly)
a.clear() # removes all items from the set and it becomes empty
len(a) # lets you see how many items are in the set
# faster way of making a set is to pass an `[]` array to the set() function

a = set([1,3,5,7,9])
b = set([2,4,6,8,10])
c = set([2, 3, 5 ,7])
a.union(b) # = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
a.intersection(c) # = 3, 5, 7

2 in b # result is True
9 not in a # Result is False 9 IS in the set of odd numbers
```

## Frozen set
```python
# less methods than sets
# immutable
```

## tuples

```python
# can be created just by assining values encapsulated in parens
# or for a single value leaving a trailing comma

a = (1, 2, 3, 4)
# or
b = ('a',)
# or
c = 1, 2, 3, 4,

# tuples are immutable, they are smaller in memory than lists, have less methods available to them, and are faster that lists.

survey = (27, "vietnam", True)
age, country, knows_python = survey # this works
print(age)
print(country)
print(knows_python)
```

## Dictionary

```python
# key value pairs, basically an object in javascript
my_dictionary = {"key":"my_key", "value":666}
my_dictionary.keys()
my_dictionary.values()

# to add more key value pairs after initialization to the dictionary use object name and brackets around the key and set equal to the value:
my_dictionary["name"] = "Bryan Jenks"
# with bracket method the key needs quotes around it but in the constructor function you DONT need quotes on the key names:
dict(message="test", language="english")

for key, value in my_dictionary.items():
	print(key, "=", value)
```

## List

```python
# basically an array as you understand them

a = [1, 2, 3, 4, 5]
a.append(17) # adds a new item to the end of the list
a.append(19) # adds a new item to the end of the list
a = [1, 2, 3, 4, 5, 17, 19]

a[-1] # shows the item at the end of the list by wrapping around
# you can only wrap around completely, once, otherwise you will get an error.

a[2:5] # this slices out a smaller list. the starting index number element is included and the ending index number is not included so indexes returned will be 2, 3, 4 but not 5

b = ['a', 'b', 'c']
a + b # = [1, 2, 3, 4, 5, 17, 19, 'a', 'b', 'c']
# adding lists together causes concatenation
```
