#### C++ Ternary Operator

---

> Good practice is to restrict usage of conditional expressions to an assignment statement, as in: `y = (x == 2) ? 5 : 9 * x;`. Common practice is to put parentheses around the first expression of the conditional expression, to enhance readability.

```cpp
if (condition) {
  myVar = expr1;
} else {
  myVar = expr2;
}

// Is the same as:

myVar = (condition) ? expr1 : expr2
```

