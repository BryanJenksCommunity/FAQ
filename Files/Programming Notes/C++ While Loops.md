#### C++ While Loop

---

# While Loops

## Eval First While Loop

The condition is **evaluated first** before running any body code of the loop.

```cpp
while (expression) { // <-- Loop expression

    // Loop body: Sub-statements that execute if the 
    // expression evaluats to true 
}

// Statements that execute after the expression evaluates to false
// Or loop concludes
```

## Execute Then Eval Do-While Loop

This condition will always **execute the body** code once before testing the expression for `true`. You can use this if you want the code executed at least once before the loop has a chance to break itself on its tested condition.

```cpp
do {
   // Loop body
} while (loopExpression);
```

---

Related:
- [[Python Loops]]
- [[Bash Loops]]
