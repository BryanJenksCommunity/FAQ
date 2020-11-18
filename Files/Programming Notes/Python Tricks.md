# Python Tricks

## Multi-Variable Assignment

```python
x = 0
y = 0

# can be:
x, y = 0, 0
```

## Kwargs

```python
# Python 3.5+ allows passing multiple sets
# of keyword arguments ("kwargs") to a
# function within a single call, using
# the "**" syntax:

def process_data(a, b, c, d):
   print(a, b, c, d)

x = {'a': 1, 'b': 2}
y = {'c': 3, 'd': 4}

process_data(**x, **y)
# >>> 1 2 3 4

process_data(**x, c=23, d=42)
# >>> 1 2 23 42
```

### Forced Keyword Parameters

```python

# In Python 3 you can use a bare "*" asterisk
# in function parameter lists to force the
# caller to use keyword arguments for certain
# parameters:

>>> def f(a, b, *, c='x', d='y', e='z'):
...     return 'Hello'

# To pass the value for c, d, and e you
# will need to explicitly pass it as
# "key=value" named arguments:
>>> f(1, 2, 'p', 'q', 'v')
TypeError:
"f() takes 2 positional arguments but 5 were given"

>>> f(1, 2, c='p', d='q',e='v')
'Hello'

```
