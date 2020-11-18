#### C++ Classes The Big Three

---

# The Big Three

> The **rule of three** describes a practice that if a programmer explicitly defines any one of those three special member functions (destructor, copy constructor, copy assignment operator), then the programmer should explicitly define all three. For this reason, those three special member functions are sometimes called the **big three**.
> .
> A <u>good practice</u> is to always follow the rule of three and define the big three (*destructor, copy constructor, copy assignment operator*) if any one of these functions are defined.

## Class Copy Constructors

If a class has a constructor that allocates memory for a variable with a pointer:

```cpp
class MyClass {
public:
   MyClass();
   ~MyClass();
   
   // Set member value dataObj
   void SetDataObj(const int setVal) {
      *dataObj = setVal;
   }
   
   // Return member value dataObj
   int GetDataObj() const {
      return *dataObj;
   }
private:
   int* dataObj;// Data member
};
```

And a new class is instantiated, and then passed by **value** to a function:

```cpp
void SomeFunction(MyClass localObj) {
   // Do something with localObj
}

int main() {
   MyClass tempClassObj; // Create object of type MyClass
   
   // Set and print data member value
   tempClassObj.SetDataObj(9);
   cout << "Before: " << tempClassObj.GetDataObj() << endl;
   
   // Calls SomeFunction(), tempClassObj is passed by value
   SomeFunction(tempClassObj);
   
   // Print data member value
   cout << "After: " << tempClassObj.GetDataObj() << endl; // ERROR
   
   return 0;
}

```

You get an error because the pass by value acts as a member wise copy.:

- newA = oldA
- newB = oldB

If your class doesn't have pointers then you wont have this issue. But with pointers we need to take a special approach. We need a copy constructor so that when passed by value to a function, when the class is copied locally we don't mess with the pointers. This copy constructor creates a new copy of the original class called a **deep copy**. 

> The **copy constructor** can be called with a single pass by reference argument of the class type, representing an original object to be copied to the newly-created object:

```cpp
class MyClass {
   public:
      ...
      MyClass(const MyClass& origClass);
      ...
};
```

```cpp
/*
	A class's copy constructor will be called automatically when an object of the class type 
	is passed by value to a function, and also when an object is initialized by copying another 
	object during declaration, as in: 
*/
MyClass classObj2 = classObj1; 
// or 
obj2Ptr = new MyClass(classObj1);.
```

##### Implementation

```cpp
#include <iostream>
using namespace std;

class MyClass {
public:
   MyClass();
   MyClass(const MyClass& origClass); // Copy constructor
   ~MyClass();
   
   // Set member value dataObj
   void SetDataObj(const int setVal) {
      *dataObj = setVal;
   }
   
   // Return member value dataObj
   int GetDataObj() const {
      return *dataObj;
   }
private:
   int* dataObj;// Data member
};

// Default constructor
MyClass::MyClass() {
   cout << "Constructor called." << endl;
   dataObj = new int; // Allocate mem for data
   *dataObj = 0;
   
   return;
}

// Copy constructor
MyClass::MyClass(const MyClass& origClass) {
   cout << "Copy constructor called." << endl;
   dataObj = new int; // Allocate sub-object
   *dataObj = *(origClass.dataObj);
   
   return;
}

// Destructor
MyClass::~MyClass() {
   cout << "Destructor called." << endl;
   delete dataObj;

   return;
}

void SomeFunction(MyClass localObj) {
   // Do something with localObj
   return;
}

int main() {
   MyClass tempClassObj; // Create object of type MyClass
   
   // Set and print data member value
   tempClassObj.SetDataObj(9);
   cout << "Before: " << tempClassObj.GetDataObj() << endl;
   
   // Calls SomeFunction(), tempClassObj is passed by value
   SomeFunction(tempClassObj);
   
   // Print data member value
   cout << "After: " << tempClassObj.GetDataObj() << endl;
   
   return 0;
}
```

## Copy Assignment Operator

![[C++ Class pointer issues.png]]

> The problem is that the assignment of `classObj2 = classObj1;` merely copied the pointer for `dataObj`, resulting in `classObj1's dataObj` and `classObj2's dataObj` members both pointing to the same memory location. Printing `classObj2` prints 9 but for the wrong reason, and if `classObj1's dataObj` value was later changed, `classObj2's dataObj` value would seemingly magically change too. Additionally, destroying `classObj1` frees that `dataObj's` memory; destroying `classObj2` then tries to free that same memory, causing a program crash. Furthermore, a memory leak has occurred because neither `dataObj` is pointing at location 81.
> .
> The solution is to overload the "`=`" operator by defining a new function, known as the `copy assignment operator` or sometimes just the `assignment operator`, that copies one class object to another. Such a function is typically defined as:

```cpp
class MyClass {
   public:
      ...
      MyClass& operator=(const MyClass& objToCopy);
      ...
};
```

##### Implementation

```cpp
#include <iostream>
using namespace std;

class MyClass {
public:
   MyClass();
   ~MyClass();
   MyClass& operator=(const MyClass& objToCopy);
   
   // Set member value dataObj
   void SetDataObj(const int setVal) {
      *dataObj = setVal;
   }
   
   // Return member value dataObj
   int GetDataObj() const {
      return *dataObj;
   }
private:
   int* dataObj;// Data member
};

// Default constructor
MyClass::MyClass() {
   cout << "Constructor called." << endl;
   dataObj = new int; // Allocate mem for data
   *dataObj = 0;

   return;
}

// Destructor
MyClass::~MyClass() {
   cout << "Destructor called." << endl;
   delete dataObj;

   return;
}

MyClass& MyClass::operator=(const MyClass& objToCopy) {
   cout << "Assignment op called." << endl;
   
   if (this != &objToCopy) {           // 1. Don't self-assign
      delete dataObj;                  // 2. Delete old dataObj
      dataObj = new int;               // 3. Allocate new dataObj
      *dataObj = *(objToCopy.dataObj); // 4. Copy dataObj
   }
   
   return *this;
}

int main() {
   MyClass tempClassObj1; // Create object of type MyClass
   MyClass tempClassObj2; // Create object of type MyClass
   
   // Set and print object 1 data member value
   tempClassObj1.SetDataObj(9);
   
   // Copy class object using copy assignment operator
   tempClassObj2 = tempClassObj1;
   
   // Set object 1 data member value
   tempClassObj1.SetDataObj(1);
   
   // Print data values for each object
   cout << "obj1:" << tempClassObj1.GetDataObj() << endl;
   cout << "obj2:" << tempClassObj2.GetDataObj() << endl;
   
   return 0;
}
```

## Deconstructors

> A destructor has no parameters and no return value (*not even void*)

Just like [[#Constructors]] Deconstructors share the same name as the class  albeit prepended with a tilde `~` so this is a class with its constructor and destructor:

```cpp
class SampleClass {
   public:
      SampleClass(); // Constructor
      ~SampleClass(); // Destructor
   private:
};
```

## Implementation

```cpp
#include <iostream>
using namespace std;

class MyClass {
   public:
      MyClass();
      ~MyClass();
   private:
      int* subObj;
};

MyClass::MyClass() {
   cout << "Constructor called." << endl;
   subObj = new int; // Allocate mem for data
   *subObj = 0;
   return;
}

MyClass::~MyClass() {
   cout << "Destructor called." << endl;
   delete subObj;
   return;
}

int main() {
   MyClass* tempClassObj;      // Create object of type MyClass

   tempClassObj = new MyClass; // Allocate mem for object
   delete tempClassObj;        // No more memory leak
                               // Freed obj's mem, including subObj
   // Rest of program ...
   return 0;
}
```


---

Related: 
- [[C++ Classes]]
	- [[C++ Class Constructors]]
	- [[C++ Class Member Functions]]
	- [[C++ Class Unit Testing]]
