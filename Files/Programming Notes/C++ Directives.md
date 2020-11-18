#### C++ Directives

---

# Preprocessor Directives

> The **preprocessor** is a tool that scans the file from top to bottom looking for any lines that begin with #, known as a **hash symbol**. Each such line is not a program statement, but rather directs the **preprocessor** to modify the file in some way before compilation continues, each such line being known as a **preprocessor directive**. The directive ends at the end of the line, no semicolon is used at the end of the line.

## Include

> Perhaps the most commonly-used preprocessor directive is **\#include**, known as an include directive. **\#include** directs the compiler to replace that line by the contents of the given filename.

```cpp
#include "filename"
#include <filename>
```

## Header Files

Header files are included through Pre-Processor Directives.

Header files contain code such as groups of related functions & their [[C++ Functions#Declaration]]'s and [[C++ Functions#Definition]]'s', as well as [[C++ Classes]]. 

When you input a header file with an `#include` statement its basically like copy/pasting all the code where the file is included. sometimes this can lead to duplication and errors if included multiple times so to prevent this we use [[#Header File Guards]].

### Header File Guards

These guards look like this:

```cpp
#ifndef FILENAME_H
#define FILENAME_H

// Header file contents

#endif
```

> `#define FILENAME_H` defines the symbol `FILENAME_H` to the preprocessor. The `#ifndef FILENAME_H` and `#endif` form a pair that instructs the preprocessor to process the code between the pair only if FILENAME_H is not defined ("ifndef" is short for "if not defined"). Thus, if the preprocessor includes encounter the header more than once, the code in the file during the second and any subsequent encounters will be skipped because `FILENAME_H` was already defined.
> .
> <u>Good practice</u> is to guard every header file. The following shows the `threeintsfcts.h` file with the guarding code added:

```cpp
#ifndef THREEINTSFCT_H
#define THREEINTSFCT_H

int ThreeIntsSum(int num1, int num2, int num3);
int ThreeIntsAvg(int num1, int num2, int num3);

#endif
```

Another example from [This video by The Cherno](https://youtu.be/9RJTQmK0YPI?list=PLlrATfBNZ98dudnM48yfGUldqGD0S4FFb) is instead of `ifndef` and all that, using instead `#pragma once` which says to include the file only once per translation unit. 

To be safe and make sure all compilers will support portability and the use the fastest option you can use both:

```cpp
#pragma once
#ifndef _HEADER_H_
#define _HEADER_H_

...

#endif
```
