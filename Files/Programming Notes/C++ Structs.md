#### C++ Structs

---

# Structs

> a **struct** is nearly identical to a [[C++ Classes|class]]. The difference is that if a [[C++ Classes#Class Member Function|member]] appears before a label of private or public, then by default, in a struct the member is public while in a class the member is private. Some programmers suggest a good practice is to use struct for simple data grouping with that data being public, while using class for objects (having data and functions, with data private). 
> .
> However, some C++ programmers argue that good practice is to only use class, abandoning struct entirely

<https://www.guru99.com/cpp-structures.html>

```cpp
// Declaration

struct Person  
{  
    char name[30];  
     int citizenship;  
     int age;  
}

// Instantiation
Person p;
```
