#### C++ Streams

---

# Streams in C++

## Input / Output

### Output Stream

or `ostream` for short is a class that supports output. It is included from [[C++ Include iostream]].

`<iostream>` provides the `<<` operator known as the **insertion operator**.

`cout` is a predefined `ostream` object (e.g., you can think of it as declared as `ostream cout;`

> The `<<` operator is overloaded with functions to support the various standard data types, such as int, bool, float, etc., each function converting that data type to a sequence of characters. The operator may be further overloaded by the string library from `#include <string>` or by the programmer for programmer-created classes.
> .
> The `<<` operator returns a reference to the `ostream` that called it, and is evaluated from left to right like most operators, so `<<` operators can appear in series.

```cpp
cout << "Num" << myInt;

// can be thought of as:

( cout.operator<<("Num") ).operator<<(myInt);
```

### Input Stream

Or `istream`, provides the `>>` operator known as the **extraction operator**. To extract data from a data buffer and write the data into different types of variables.

> `cin` is a predefined istream pre-associated with a system's standard input, usually a computer keyboard. The system automatically puts the standard input into a data buffer associated with `cin`. The `>>` operator <u>skips leading whitespace</u>, extracts as many characters as possible consistent with the target variable's type and <u>stopping at the next whitespace</u>, converts the extracted characters to the target variable's type, and stores the result into the variable.

## Output Formatting

### Number Formatting

> A programmer can adjust the way that output appears, a task known as output formatting. The main formatting approach uses manipulators. A manipulator is an item designed to be used with the insertion operator `<<` or extraction operator `>>` to adjust the way output appears, and is available via `#include <iomanip>; `or `#include <ios>;` in namespace std. For example, `cout << setprecision(3) << myFloat;` causes the floating-point variable `myFloat` to be output with only 3 digits; if `myFloat` was 12.34, the output would be 12.3.
> .
> <u>Most manipulators change the state of the stream such that the manipulation affects all subsequent output, not just the next output.</u>

|Manipulator|Description|Example|
|:----|:----|:----|
|fixed|Use fixed-point notation. `From <ios>`|12.34|
|scientific|Use scientific notation. `From <ios>`|12.3E+01|
|setprecision(p)|If stream has not been manipulated to fixed or scientific: Sets max number of digits in number|p=3 yields 12.3 p=5 yields 12.34|
||If stream has been manipulated to fixed or scientific: Sets max number of digits in fraction only (after the decimal point). From `<iomanip>`|fixed: p=1 yields 12.3 scientific: p=1 yields 1.2e+01|
|showpoint|Even if fraction is 0, show decimal point and trailing 0s. Opposite is noshowpoint. `From <ios>`|For 99.0 with precision=2 and fixed: 99 (default or noshowpoint) 99.00 (showpoint)|

```cpp
#include <iostream>
#include <ios>
#include <iomanip>
using namespace std;

int main() {
   
   double milesTrvld = 765.4321;
   
   cout << "setprecision(p) -- Sets # digits" << endl;
   cout << milesTrvld << " (default p is 6)" << endl;
   cout << setprecision(8) << milesTrvld << " (p = 8)" << endl;
   cout << setprecision(5) << milesTrvld << " (p = 5)" << endl;
   cout << setprecision(2) << milesTrvld << " (p = 2)"
        << " (note rounding)" << endl;
   cout << milesTrvld << " (manipulator persists)" << endl << endl;
   
   cout << setprecision(2);
   cout << "(For following, p = 2 applies to fraction only)" << endl;
   
   // fixed -- uses fixed point notation
   cout << fixed;
   cout << "fixed: " << milesTrvld << endl;
   
   // scientific -- uses scientific notation
   cout << scientific;
   cout << "scientific: " << milesTrvld << endl;
   
   return 0;
}
```

![[C++ Manipulating Stream Output.png]]

### Text Formatting

|Manipulator|Description|Example (for item "Amy")|
|:----|:----|:----|
|setw(n)|Sets the number of characters for the next output item only (does not persist, in contrast to other manipulators). By default, the item will be right-aligned, and filled with spaces. From `<iomanip>`|For n=7: "Amy"|
|setfill(c)|Sets the fill to character c. From `<iomanip>`|For c='\*': ""\*\*\*\*Amy""|"
|left|Changes to left alignment. From `<ios>`|"Amy "|
|right|Changes to right alignment. From `<ios>`|" Amy"|

```cpp
#include <iostream>
#include <ios>
#include <iomanip>
using namespace std;

int main() {
   cout << "Dog age in human years (dogyears.com)" << endl << endl;
   
   // set num char for each column, set alignment
   cout << setw(10) << left  << "Dog age" << "|";
   cout << setw(12) << right << "Human age" << endl;
   cout << "------------------------------" << endl;
   cout << setw(10) << left  << "2 months" << "|";
   cout << setw(12) << right << "14 months" << endl;
   cout << setw(10) << left  << "6 months" << "|";
   cout << setw(12) << right << "5 years" << endl;
   
   // set fill character, num char for each column, set alignment
   cout << setfill('-');
   cout << setw(10) << left  << "8 months" << "|";
   cout << setw(12) << right << "9 years" << endl;
   cout << setw(10) << left  << "1 year" << "|";
   
   // change fill character, num char for each column, set alignment
   cout << setfill('.');
   cout << setw(12) << right << "15 years" << endl;

   // change fill character, num char for each column
   cout << setfill('*') << setw(30) << "" << endl;
   
   return 0;
}
```

![[C++ Text Stream Manipulation.png]]

> Of particular interest is how the `setw()` and `setfill()` manipulators are used in the last few lines. Note how they are used to create a line of 30 asterisks, without having to type 30 asterisks.
> .
> Most manipulators are persistent, meaning they change the state of the stream for all subsequent output. The exception is `setw()`, which <u>only affects the next output item</u>, defined that way likely because programmers usually only want to set the width of the next item and not all subsequent items.

|Manipulator | Description|
|:--:|:--|
|`endl`| Inserts a newline character '\n' into the output buffer, and informs the system to flush the buffer. |From `<iostream>`
|`flush`| Informs the system to flush the buffer. From `<iostream>`|

## String Streams

### Input Stream

> Sometimes a programmer wishes to read input data from a string rather than from the keyboard (standard input). A new input string stream variable of type `istringstream` can be created that is associated with a string rather than with the keyboard (standard input). `istringstream` is derived from `istream`. Such a stream can be used just like the `cin` stream. The following program illustrates.

```cpp
#include <iostream>
#include <sstream>
#include <string>
using namespace std;

int main() {
   string  userInfo = "Amy Smith 19"; // Input string
   istringstream inSS(userInfo);      // Input string stream
   string firstName;                  // First name
   string lastName;                   // Last name
   int userAge = 0;                   // Age
   
   // Parse name and age values from input string
   inSS >> firstName;
   inSS >> lastName;
   inSS >> userAge;
   
   // Output parsed values
   cout << "First name: " << firstName << endl;
   cout << "Last  name: " << lastName << endl;
   cout << "Age: "        << userAge << endl;
   
   return 0;
}

//#> First name: Amy
//#> Last  name: Smith
//#> Age: 19
```

> The program uses `#include <sstream>` for access to the string stream class, which is in `namespace std`. The line `istringstream inSS(userInfo);` declares a new stream variable and initializes its buffer to a copy of `userInfo`. Then, the program can extract data from stream `inSS` using `>>` similar to extracting from `cin`.
> .
> A common use of string streams is to process user input line-by-line. The following program reads in the line as a string, and then extracts individual data items from that string.

```cpp
#include <iostream>
#include <string>
#include <sstream>
using namespace std;

int main() {
   istringstream inSS;       // Input string stream
   string lineString;        // Holds line of text
   string firstName;         // First name
   string lastName;          // Last name
   int    userAge = 0;       // Age
   bool   inputDone = false; // Flag to indicate next iteration
   
   // Prompt user for input
   cout << "Enter \"firstname lastname age\" on each line" << endl;
   cout << "(\"Exit\" as firstname exits)." << endl << endl;
   
   // Grab data as long as "Exit" is not entered
   while (!inputDone) {
      
      // Entire line into lineString
      getline(cin, lineString);
      
      // Copies to inSS's string buffer
      inSS.clear();
      inSS.str(lineString);
      
      // Now process the line
      inSS >> firstName;
      
      // Output parsed values
      if (firstName == "Exit") {
         cout << "   Exiting." << endl;
         
         inputDone = true;
      }
      else {
         inSS >> lastName;
         inSS >> userAge;
         
         cout << "   First name: " << firstName << endl;
         cout << "   Last  name: " << lastName << endl;
         cout << "   Age:        " << userAge   << endl;
         cout << endl;
      }
   }
   
   return 0;
}

//#> Enter "firstname lastname age" on each line
//#> ("Exit" as firstname exits).
//#> 
//#> Mary Jones 22
//#>    First name: Mary
//#>    Last  name: Jones
//#>    Age:        22
//#> 
//#> Sally Smith 14
//#>    First name: Sally
//#>    Last  name: Smith
//#>    Age:        14
//#> 
//#> Exit
//#>    Exiting.
```

### Output Stream

> The program uses `getline` to read an input line into a string. The line `inSS.str(lineString);` uses the `str(s)` function to initialize the stream's buffer to string `s`. Afterwards, the program extracts input from that stream using `>>.` The statement `inSS.clear();` is necessary to reset the state of the stream so that subsequent extractions start from the beginning; the clear resets the stream's state.
.
Similarly, a new output string stream variable of type **ostringstream** can be created that is associated with a string rather than with the screen (standard output). **ostringstream** is a special kind of (i.e., is derived from) `ostream`. Once created, a program can insert characters into that stream using `<<`, as follows.

```cpp
#include <iostream>
#include <string>
#include <sstream>
using namespace std;

int main() {
   ostringstream fullNameOSS; // Output string stream
   ostringstream ageOSS;      // Output string stream
   string firstName;          // First name
   string lastName;           // Last name
   string fullName;           // Full name (first and last)
   string ageStr;             // Age (string)
   int userAge = 0;           // Age
   
   // Prompt user for input
   cout << "Enter \"firstname lastname age\": " << endl;
   cin >> firstName;
   cin >> lastName;
   cin >> userAge;
   
   // Writes to buffer, then copies from buffer into string
   fullNameOSS << lastName << ", " << firstName;
   fullName = fullNameOSS.str();
   
   // Output parsed input
   cout << endl << "   Full name: " << fullName << endl;
   
   // Writes int age as chars to buffer
   ageOSS << userAge;
   
   // Appends (minor) to buffer if less than 21, then
   // copies buffer into string
   if (userAge < 21) {
      ageOSS << " (minor)";
   }
   
   ageStr = ageOSS.str();
   
   // Output string
   cout << "   Age: " << ageStr << endl;
   
   return 0;
}
```

![[C++ Output String Stream.png]]

---

Related: 
- [[C++ Include iostream]]
- [[C++ Include string]]
