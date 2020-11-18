#### C++ Include cstring

---

# C Strings

```cpp

```

## Copying

### strcpy()

`strcpy(destStr, sourceStr)`

> Copies sourceStr (up to and including null character) to destStr.	

```cpp
strcpy(targetText, userText); // Copies "UNICEF" + null char 
                              // to targetText 
strcpy(targetText, orgName);  // Error: "United Nations" 
                              // has > 10 chars
targetText = orgName;         // Error: Strings can't be 
                              // copied this way
```

### strncpy()

`strncpy(destStr, sourceStr, numChars)`

> Copies up to numChars characters.	

```cpp
strncpy(orgName, userText, 6); // orgName is "UNICEF Nations"
```

## Concatenation

### strcat()

`strcat(destStr, sourceStr)`

> Copies sourceStr (up to and including null character) to end of destStr (starting at destStr's null character).	

```cpp
strcat(orgName, userText); // orgName is "United NationsUNICEF"
```

### strncat()

`strncat(destStr, sourceStr, numChars)`

> Copies up to numChars characters to destStr's end, then appends null character.	

```cpp
strcpy(targetText, "abc"); 			 // targetText is "abc"
strncat(targetText, "123456789", 3); // targetText is "abc123"
```

## Comparison

### strcmp()

`strchr(sourceStr, searchChar)`

Returns `NULL` if `searchChar` does not exist in `sourceStr`. (Else, returns address of first occurrence, discussed elsewhere).
`NULL` is defined in the cstring library.

```cpp
// Given:
char orgName[100] = "United Nations"; 
char userText[20] = "UNICEF"; 
char targetText[10];

if (strchr(orgName, 'U') != NULL) { // 'U' exists in orgName?
   ...  // 'U' exists in "United Nations", branch taken
}  
if (strchr(orgName, 'u') != NULL) { // 'u' exists in orgName?
   ...  // 'u' doesn't exist (case matters), branch not taken
}
```

## Searching

### strchr()

`size_t strlen(sourceStr)`

Returns number of characters in `sourceStr` up to, but not including, first null character. `size_t` is integer type.

```cpp
// Given:
char orgName[100] = "United Nations"; 
char userText[20] = "UNICEF"; 
char targetText[10];

x = strlen(orgName);    // Assigns 14 to x 
x = strlen(userText);   // Assigns 6 to x
x = strlen(targetText); // Error: targetText may lack null char
```

## Other

### strlen()

`int strcmp(str1, str2)`

Returns 0 if `str1` and `str2` are equal, non-zero if they differ.

```cpp
// Given:
char orgName[100] = "United Nations"; 
char userText[20] = "UNICEF"; 
char targetText[10];

if (strcmp(orgName, "United Nations") == 0) {
   ... // Equal, branch taken
}
if (strcmp(orgName, userText) == 0) {
   ... // Not equal, branch not taken
}
```
