#### C++ File Streams

---

# File Input and Output

## Input

> Sometimes a program should get input from a file rather than from a user typing on a keyboard. To achieve this, a programmer can create a new input stream that comes from a file, rather than the predefined input stream `cin` that comes from the standard input (keyboard). That new input stream can then be used just like `cin`, as the following program illustrates. Assume a text file exists named *myfile.txt* with the contents shown (created for example using Notepad on a Windows computer or using TextEdit on a Mac computer).

	myfile.txt with two integers:
	5
	10

```cpp
#include <iostream>
#include <fstream>
using namespace std;

int main() {
   ifstream inFS;     // Input file stream
   int fileNum1 = 0;  // Data value from file
   int fileNum2 = 0;  // Data value from file
   
   // Try to open file
   cout << "Opening file myfile.txt." << endl;
   
   inFS.open("myfile.txt");
   if (!inFS.is_open()) {
      cout << "Could not open file myfile.txt." << endl;
      return 1; // 1 indicates error
   }
   
   // Can now use inFS stream like cin stream
   // myfile.txt should contain two integers, else problems
   cout << "Reading two integers." << endl;
   inFS >> fileNum1;
   inFS >> fileNum2;
   cout << "Closing file myfile.txt." << endl;
   inFS.close(); // Done with file, so close it
   
   // Ouput values read from file
   cout << "num1: " << fileNum1 << endl;
   cout << "num2: " << fileNum2 << endl;
   cout << "num1 + num2: " << (fileNum1 + fileNum2) << endl;
   
   return 0;
}
```

> **Five** lines are needed for the new input stream, highlighted above.
.
> - The `#include <fstream>` (for "*file stream*") enables use of the file stream class.
> - A new stream variable has been declared: `ifstream inFS;`. `ifstream` is short for *input file stream*, and is derived from `istream`.
> - The line `inFS.open("myfile.txt");` opens the file for reading and associates the file with the `inFS` stream. Because of the high likelihood that the open fails, usually because the file does not exist or is in use by another program, the program checks whether the open was successful using `if (!inFS.is_open())`.
> - The successfully opened input stream can then be used just like the `cin` stream, e.g., using `inFS >> num1;` to read an integer into `num1`.
> - Finally, when done using the stream, the program closes the file using `inFS.close()`.
> - A common error is to type `cin >> num1;` when actually intending to get data from a file as in `inFS >> num1`. Another common error is a mismatch between the variable data type and the file data, e.g., if the data type is int but the file data is "Hello".

> The `inFS.open(str)` function has a string parameter str, which can be a C++ string or a null-terminated C string. A program often uses a user-entered string as the filename, such as using `cin >> filename;`.

```cpp
/* Given

datafile.txt with two integers:
72
68

*/

#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main() {
   ifstream inFS;        // Input file stream
   int fileNum1 = 0;     // File data
   int fileNum2 = 0;     // File data
   string filename = ""; // Input filename
   
   // Prompt user for filename
   cout << "Enter filename: " << endl;
   cin >> filename;
   
   // Try to open file
   inFS.open(filename);
   
   if (!inFS.is_open()) {
      cout << "Could not open file " << filename << endl;
      return 1;
   }
   
   // Get numbers. If too few, may encounter problems
   inFS >> fileNum1;
   inFS >> fileNum2;
   
   // Done with file, close it
   inFS.close();
   
   // Ouput values read from file
   cout << "num1: " << fileNum1 << endl;
   cout << "num2: " << fileNum2 << endl;
   cout << "num1 + num2: " << (fileNum1 + fileNum2) << endl;
   
   return 0;
}

/*
	Enter filename: 
	datafile.txt
	num1: 72
	num2: 68
	num1 + num2: 140
*/
```

> A program can read varying amounts of data in a file by using a loop that reads until the end of the file has been reached, as follows.
.
The `eof()` function returns true if the previous stream operation reached the end of the file. Errors may be encountered while attempting to read from a file, including end-of-file, corrupt data, etc. So, a program should check that each read was successful before using the variable to which the data read was assigned. The `good()` function returns true if the previous stream operation had no problems. Ex:  `if( inFS.good() ) {...} `checks that the previous read operation was successful.

```cpp
/* Given:
	myfile.txt with variable number of integers:
	111
	222
	333
	444
	555
*/

#include <iostream>
#include <fstream>
using namespace std;

int main() {
   ifstream inFS;   // Input file stream
   int fileNum = 0; // File data
   
   // Open file
   cout << "Opening file myfile.txt." << endl;
   inFS.open("myfile.txt");
   
   if (!inFS.is_open()) {
      cout << "Could not open file myfile.txt." << endl;      
      return 1;
   }
   
   // Print read numbers to output
   cout << "Reading and printing numbers." << endl;
   
   while (!inFS.eof()) {
      inFS >> fileNum;
      if( inFS.good() ) {
         cout << "num: " << fileNum << endl;
      }
   }
   
   cout << "Closing file myfile.txt." << endl;
   
   // Done with file, so close it
   inFS.close();
   
   return 0;
}

/*
	Opening file myfile.txt.
	Reading and printing numbers.
	num: 111
	num: 222
	num: 333
	num: 444
	num: 555
	Closing file myfile.txt.
*/
```

## Output

`ofstream` = Output File Stream

```cpp
#include <iostream>
#include <fstream>
using namespace std;

int main() {
   ofstream outFS; // Output file stream
   
   // Open file
   outFS.open("myoutfile.txt");
   
   if (!outFS.is_open()) {
      cout << "Could not open file myoutfile.txt." << endl;
      return 1;
   }
   
   // Write to file
   outFS << "Hello" << endl;
   outFS << "1 2 3" << endl;
   
   // Done with file, so close it
   outFS.close();
   
   return 0;
}
```

## Stream Errors

> A **stream error** occurs when insertion or extraction fails, causing the stream to enter an error state.

```cpp
#include <iostream>
using namespace std;

int main() {
   int num1 = -1; // Initial value -1 for demo purposes.
   int num2 = -1;
   
   cout << "Enter a number: " << endl;
   cin  >> num1; // Stream error state entered here.
   
   cout << "Enter a second number:" << endl;
   cin  >> num2; // Stream already in error state, so extraction skipped.
   
   cout << "num1: " << num1 << endl;
   cout << "num2: " << num2 << endl;
   
   return 0;
}

/*
	Enter a number:
	six
	Enter a second number:
	num1: 0
	num2: -1
*/

```

> A stream's error state can be checked with a function. Ex: `cin.good() `returns true if `cin` is not in an error state. Otherwise, false is returned. A stream internally uses several 1-bit error flags to track the state of the stream.

|Flag|Meaning|Function|
|:--|:--|:--|
|`goodbit`|Indicates no error flags are set and the stream is good.|`good()` returns true if no stream errors have occurred.|
|`eofbit`|Indicates if end-of-file reached on extraction.|`eof()` returns value of eofbit, if end-of-file reached on extraction.|
|`failbit`|Indicates a logical error for the previous extraction or insertion operation.|`fail()` returns true if either failbit or badbit is set, indicating an error for the previous stream operation.|
|`badbit`|Indicates an error occurred reading or writing the stream, and the stream is bad. Further operations on the stream will fail.|`bad()` returns true if badbit is set, indicating the stream is bad.|

> A stream's error state is cleared using `clear()`. Ex: `cin.clear()` clears the error state from `cin`.
.
The function `ignore(maxToIgnore, stopChar)` ignores characters in the stream buffer. Ex: `cin.ignore(10, '\n') `ignores up to 10 characters in the stream buffer, or until a '`\n`' character is encountered.
.
Commonly, a program needs to wait until a '`\n`' character is found, in which case set `maxToIgnore` to the maximum size of a stream: `numeric_limits<streamsize>::max()`.

```cpp
// Read user input until a number is entered
#include <iostream>
#include <limits>
using namespace std;

int main() {
   int number = 0;
   
   cout << "Enter a number: " << endl;
   cin >> number;
   
   while (cin.fail()) {
      // Clear error state
      cin.clear();

      // Ignore characters in stream until newline
      cin.ignore(numeric_limits<streamsize>::max(), '\n');
      
      cout << "Try again: " << endl;
      cin  >> number;
   }
   
   cout << "You entered: " << number << endl;
   
   return 0;
}
```

> A program may need to check for errors during file reading. 
> One approach is to check whether end-of-file was reached after the file reading ends. If end-of-file was not reached, then an error in file reading occurred.

```cpp
/* Given:
	myfile.txt:
	5
	8
	six
	4
	6
*/

#include <iostream>
#include <fstream>
using namespace std;

int main() {
   ifstream inFS;
   int fileNumber = 0; // Number in file
   
   inFS.open("myfile.txt");
   
   if (!inFS.is_open()) {
      cout << "Could not open file myfile.txt." << endl;
      
      return 1;
   }
   
   // Read file until end-of-file or an error
   while (inFS.good()) {
       inFS >> fileNumber;
       cout << "File number: " << fileNumber << endl;
   }
   
   // If end-of-file not reached, then an error occurred
   if (!inFS.eof()) {
      cout << "Error reading myfile.txt" << endl;
      
      return 1;
   }
   
   inFS.close();
   
   return 0;
}

/*
	File number: 5
	File number: 8
	File number: 0
	Error reading myfile.txt
*/
```

## Extraction Before Getline

> The `getline()` function and the extraction operator `>>` handle a trailing newline differently, which can lead to a problem.
> - The `getline()` function reads a line of text from a buffer, **discarding the ending newline character**.
> - The extraction operator `>>` skips <u>whitespace</u>, then reads the next item such as an integer or string which is said to end at the next <u>whitespace</u>, leaving that ending whitespace character in the buffer (an exception being for reading a single character).

> The problem is that code like `cin >> myInt;` and `getline(cin, nextLine);` may not behave as expected if the integer is ended with a newline. The `getline()` function will read that single remaining newline character, returning an empty string, rather than proceeding to the next line.
.
A simple solution is to not mix the two approaches to reading an input buffer, either only using extraction, or only using `getline()`.
.
If one must mix the two approaches, then after an extraction operation, the trailing newline should be discarded from the buffer before calling the `getline()`, by inserting some statement in between. One possible solution inserts `cin.ignore()`, which discards the next character in the input buffer. Another possible approach inserts another `getline()` call, ignoring its blank string.



---

Related:
- [[C++ Streams]]
- [[C++ Include iostream]]
