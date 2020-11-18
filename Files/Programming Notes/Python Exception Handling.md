# Python Exception Handling

```python
try:
    number = int(input("enter a number: "))
    print(number)
except ZeroDivisionError as err:
    print(err)
    print("Divided By Zero")
except ValueError:
    print("invalid input")
```
