#### C++ Include string

---

# The String Library

[\<string\>](http://cplusplus.com/reference/string/string/)

> Strings are objects that represent sequences of characters.

This library include the `string` class and this class has various methods that allow us to perform string manipulation.

## Element Access

### at( index )

> C++ also supports C-style access of a string using brackets [] rather than .at(), as in: someString[0]. However, such C-style access does not provide such error checking. Good practice is to use .at() rather than brackets for accessing a string's characters, due to .at()'s error checking.
>
> -- zybooks

```cpp
string name = "bryan";
cout << name.at(1) << endl;
//#> r
```

## Capacity

### length() & size()

Same idea as `len()`

```cpp
// userText is "Help me!"
userText.length()  // Returns 8 
userText.size()    // Returns 8 
// userText is ""
userText.length()  // Returns 0
```

### empty()

True is length is 0

```cpp
// userText is "Help me!"
userText.empty()   // Returns false
// userText is ""
userText.empty()   // Returns true
```

### resize( num )

Resize string to have num characters. 
If decrease, drops extra chars. 
If increase, sets new chars to null ('\0', ASCII value 0).

```cpp
// userText is "Help me!"
userText.resize(4); // Now "Help" 
userText.size();    // Returns 4
```

### clear()

Deletes characters, sets size to 0.

```cpp
// userText is "Help me!"
userText.clear(); // Clears string 
userText.size();  // Returns 0 
userText.at(0);   // Generates exception
```

## Modifiers

### push_back( newChar )

Appends `newChar` to the end.

*NOTE* that the char has to be wrapped in single quotes as mentioned in [[C++ Variables and Datatypes#Character|Char Data Type]]

```cpp
// userText is "Hello"
userText.push_back('?'); // Now "Hello?" 
userText.length();       // Returns 6
```

### append( moreString )

Appends a copy of string `moreString`.

```cpp
// userText is "Hi"
userText.append(" friend"); // Now "Hi friend" 
userText.length();          // Returns 9
```

### insert( index, subStr )

Inserts string `subStr` starting at `index`.

```cpp
// userText is "Goodbye"
userText.insert(0, "Well "); // Now "Well Goodbye" 
// userText is "Goodbye"
userText.insert(4, "---");   // Now "Good---bye"
```

### replace( index, num, subStr )

Replaces characters at indices `index` to `index + num - 1` with a copy of `subStr`.

```cpp
// userText is "You have many gifts"
userText.replace(9, 4, "a plethora of"); 
// Now "You have a plethora of gifts"
```

## String Operations

### find( item, index )

Starts at a 0 index and returns index position of your input. Optional 2nd argument can tell you which index to start at so as to skip the first occurrence of something.

```cpp
// userText is "Help me!"
userText.find('p')    // Returns 3 
userText.find('e')    // Returns 1 (first occurrence of e only) 
userText.find('z')    // Returns string::npos 
userText.find("me")   // Returns 5
userText.find('e', 2) // Returns 6 (starts at index 2)
```

### substr( index, len )

Returns substring starting at index and having len characters.

```cpp
// userText is "http://google.com"
userText.substr(0, 7)                     // Returns "http://"
userText.substr(13, 4)                    // Returns ".com"
userText.substr(userText.length() - 4, 4) // Last 4: ".com"
```
