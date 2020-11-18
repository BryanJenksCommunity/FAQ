#### C++ Pointers

---

# Pointers in C++

> A **pointer** is a variable that contains a memory address, rather than containing data like most variables

## Example

```cpp
#include <iostream>
using namespace std;

int main() {
   int usrInt = 0; // User defined int value
   int* myPtr = nullptr; // Pointer to the user defined int value
   
   // Prompt user for input
   cout << "Enter any number: ";
   cin >> usrInt;
   
   // Output int value and address
   cout << "We wrote your number into variable usrInt." << endl;
   cout << "The content of usrInt is: " << usrInt << "." << endl;
   cout << "usrInt's memory address is: " << &usrInt << "." << endl;
   cout << endl << "We can store that address into pointer variable myPtr."
        << endl;
   
   // Grab address storing user value
   myPtr = &usrInt;
   
   // Output pointer value and value at pointer address
   cout << "The content of myPtr is: " << myPtr << "." << endl;
   cout << "The content of what myPtr points to is: "
        << *myPtr << "." << endl;
   
   return 0;
}
```

## Symbol Usage

### Pointer Variables

> Appending `*` after a data type in a variable declaration declares a pointer variable, as in `int* myPtr`. One might imagine that the programming language would have a type like address in addition to types like int, char, etc., but instead the language requires each pointer variable to indicate the type of data to which the address points. So valid pointer variable declarations are `int* myPtr1`, `char* myPtr2`, `double* myPtr3`, and even `Seat* myPtr4;` (where Seat is a class type); all such variables will contain memory addresses.

```cpp
int* myInt;
```

### Get Memory Address

> Prepending `&` to any variable's name gets the variable's address. `&` is the reference operator that returns a pointer to a variable using the following form:

```cpp
&myInt;
```

### Dereferencing a Pointer

> Prepending `*` to a pointer variable's name in an expression gets the data to which the variable points, as in `*myPtr1`, an act known as **dereferencing** a pointer variable. `*` is the dereference operator that allows the program to access the value pointed to by the pointer using the form:

```cpp
*myInt;
```

### Null Pointer

> The pointer was initialized to **`nullptr`**. The `nullptr` keyword is a literal indicating a pointer points to nothing. A pointer assigned with `nullptr` is said to be null.

## Using Pointers Example

```cpp
#include <iostream>
using namespace std;

int main() {
   double vehicleMpg = 0.0;
   double* valPtr = nullptr;
   
   valPtr = &vehicleMpg;
   
   *valPtr = 29.6; // Assigns the number to the variable
                   // POINTED TO by valPtr.
   
   // vehicleMpg = 40;   // Uncomment this later
   
   cout << "Vehicle MPG = " << vehicleMpg << endl;
   cout << "Vehicle MPG = " << *valPtr << endl;
   
   return 0;
}
```

## Operators

### The 'New' Operator

> Sometimes memory should be allocated while a program is running and should persist independently of any particular function. The **new** operator allocates memory for the given type and returns a pointer (i.e., the address) to that allocated memory.

```cpp

#include <iostream>
using namespace std;

int main() {
   int* myPtr = nullptr;
   cout << "myPtr: "  << myPtr << endl;
   
   // Next line would cause error because myPtr is null
   // cout << "*myPtr: " << *myPtr << endl; // ERROR
   
   // new allocates int, returns pointer
   myPtr = new int; 
   cout << "myPtr: "  << myPtr << endl;
   cout << "*myPtr: " << *myPtr << endl;
   
   *myPtr = 555;
   cout << "*myPtr: " << *myPtr << endl;
   
   return 0;
}
```

![[C++ Pointers Example.png]]

> The new operator is commonly used with class types, as in `new SimpleItem;` where `SimpleItem` is a class name. After new allocates memory for a class object, the object's constructor is called. Arguments may be provided after the class name to call a non-default constructor.

```cpp
#include <iostream>
using namespace std;

class SimpleItem {
public:
   void PrintNums();
   SimpleItem(int initVa1 = -1, int initVal2 = -1);
private:
   int num1;
   int num2;
};

SimpleItem::SimpleItem(int initVal1, int initVal2) {
   num1 = initVal1;
   num2 = initVal2;

   return;
}

void SimpleItem::PrintNums() {
   cout << "num1: " << num1 << endl;
   cout << "num2: " << num2 << endl;

   return;
}

int main() {
   SimpleItem* myItemPtr1 = nullptr;
   SimpleItem* myItemPtr2 = nullptr;
   
   myItemPtr1 = new SimpleItem;
   (*myItemPtr1).PrintNums();
   cout << endl;
   
   myItemPtr2 = new SimpleItem(8, 9);
   (*myItemPtr2).PrintNums();
   
   return 0;
}
```

### The 'delete' Operator

> The **delete** operator does the opposite of the new operator. The statement `delete pointerVariable`; deallocates a memory block pointed to by pointerVariable, which must have been previously allocated by new. If pointerVariable is null, delete has no effect.

```cpp
new pointerVariable;
delete pointerVariable;
```
