#### C++ For Loops

---

# For Loops Are Cleaner Than [[C++ While Loops|While Loops]]

A real benefit of For loops is that they can clean up a lot of the syntax of while loops when while loops are used for iterations that can be calculated before the initiation of the loop, rather than *"Run this while loop until a condition is met sometime at some point"*.

## For Loop and While Loop Comparison

|While Loop|For Loop|
|:--:|:--:|
|![[C++ While Loop.png]]|![[C++ For Loop.png]]|

## For Loop Syntax

```cpp
for (initialExpression; conditionExpression; updateExpression) {
  // Loop body: Sub-statements to execute if the
  // conditionExpression evaluates to true
}
// Statements to execute after the expression evaluates to false
```

## When to use For loops v.s. While Loops

|Loop|Usage|
|:--:|:--|
|**For**|*Use when the number of iterations is computable before entering the loop, as when counting down from X to 0, printing a character N times, etc.*|
|**While**|*Use when the number of iterations is not computable before entering the loop, as when iterating until a user enters a particular character.*|

## The break statement

Just like [[C++ Case Statements|Case Statements]] the `break;` keyword will cause the loop to end, just like the case statement will run, executing all code on the flow down until it hits a `break;` statement:

![[C++ Case Statements#723541]]

## The continue Statement

```cpp
for ( int i = 0; i <= 19; i++ ) {
	if ( ( i % 10 ) == 0 ) {
		continue;
	}
	cout << i << endl;
}
```

The `continue;` statement will skip everything else in the loop and go to the next iteration of the loop.

In this case it will not send 10 to cout because it was told to continue on.
when the if condition found that the 10 was divisible by 10 with modulus division: `%`, it then ran `continue;` and said *"skip the printing of this value"*.

---

Related:
- [[Python Loops]]
- [[Bash Loops]]
