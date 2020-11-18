#### C++ Include cctype

---

# The C Character Type Library

> This header declares a set of functions to classify and transform individual characters.

### isalpha( c )

true if alphabetic: a-z or A-Z

```cpp
isalpha('x') // true
isalpha('6') // false
isalpha('!') // false
```

### isdigit( c )

true if digit: 0-9.

```cpp
isdigit('x') // false
isdigit('6') // true
```

### isalnum( c )

Returns true if c is alphabetic or a numeric digit. Thus, returns true if either [[#isalpha c]] or [[#isdigit c]] would return true.

### isspace( c )

true if whitespace.

```cpp
isspace(' ')  // true
isspace('\n') // true
isspace('x')  // false
```

### toupper( c )

Uppercase version

```cpp
toupper('a')  // A
toupper('A')  // A
toupper('3')  // 3
```

### tolower( c )

Lowercase version 

```cpp
tolower('A')  // a
tolower('a')  // a
tolower('3')  // 3
```

### isblank()

Returns true if character c is a blank character. Blank characters include spaces and tabs.

```cpp
isblank(myString[5]); // Returns true because that character is a space ' '.
isblank(myString[0]); // Returns false because 'H' is not blank.
```

### isxdigit()

Returns true if c is a hexadecimal digit: 0-9, a-f, A-F.

```cpp
isxdigit(myString[3]); // Returns true because '9' is a hexadecimal digit.
isxdigit(myString[1]); // Returns true because 'e' is a hexadecimal digit.
isxdigit(myString[6]); // Returns false because 'G' is not a hexadecimal digit.
```

### ispunct()

Returns true if c is a punctuation character. Punctuation characters include: `!"#$%&'()*+,-./:;<=>?@[\]^_{|}~`

```cpp
ispunct(myString[4]); // Returns true because '!' is a punctuation character.
ispunct(myString[6]); // Returns false because 'G' is not a punctuation character.
```

### isprint()

Returns true if c is a printable character. Printable characters include alphanumeric, punctuation, and space characters.

### iscntrl()

 Returns true if c is a control character. Control characters are all characters that are not printable.
