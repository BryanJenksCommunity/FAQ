#### C++ Memory Regions

---

# Memory Regions

## Static Memory

> The region where global variables (*variables declared outside any function*) as well as static local variables (*variables declared inside functions starting with the keyword "static"*) are allocated. The name "static" comes from these variables not changing (*static means not changing*); they are allocated once and last for the duration of a program's execution, their addresses staying the same.

## The Stack

> The region where a function's local variables are allocated <u>during a function call</u>. A function call adds local variables to the stack, and a return removes them, like adding and removing dishes from a pile; hence the term "*stack*." Because this memory is automatically allocated and deallocated, it is also called **automatic memory**.

## The Heap

> The region where the "*new*" operator allocates memory, and where the "*delete*" operator deallocates memory. The region is also called **free store**.

