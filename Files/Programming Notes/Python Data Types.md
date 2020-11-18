# Python Data Types

## Strings

```python
# This is an ordinary string
print("This is a string")

# This is a function Doc string
def function(x):
    """This is a doc string explaining
    the inner workings of this function
    """
    y = x * 7
    reutrn(y)

x = 17
printer = "hewlet packard"

# This is a template literal "F string"
print(f"I just printed {x} pages to the printer {printer}")
# or for less elegence
print("I just printed" + x + "pages to the printer" + printer)
```

## Numbers

```python
# Integer whole numbers
a = 496
print(type(a)) # int for integer

# Float for floating point number
a = 496
print(type(a)) # float

# Complex Numbers (in math i is used for imaginary numbers, in programming and python it is 'j')
a = 496 - 6.1j #the j is the complex part
print(type(a)) # complex
print(a.real) # view the real part of the number
print(a.imag) # view the imaginary part of the number
```

## Booleans

```python
True & False # these are the operators

true & false # These are not correct
TRUE & FALSE # These are not correct

bool(" ") # True
bool("") # False
bool(1) # True
bool(0) # False
```
