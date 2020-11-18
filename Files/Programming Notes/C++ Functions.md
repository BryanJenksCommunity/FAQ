#### C++ Functions

---

# User Defined Functions

## Return type

Before each function [[#Declaration]] you must have a return type for that function. The return type is the data type for what is returned by the function. Most of the data types you will use are in [[C++ Variables and Datatypes]] but one you will also use is `void` this is when the function will return nothing to you, but it may perform actions such as mutate data, or log things to the console, but no value is returned.

```cpp
void SayHello() {
	std::cout << "hello world!" << std::endl;
}

int main() {
	SayHello();
}

//#> "hello world!"
```

## Parameters

Parameters passed to a function need to have their data types explicitly declared as well so the function knows what type of data it is receiving:

```cpp
#include <string>

void SayHello ( string name, int age ) {
	std::cout << "Hello " << name 
	<< " you are: " << age << " years old!" << std::endl;	
}

int main () {
	string myName = "Bryan";
	int myAge = 28;
	
	SayHello( myName, myAge );
}

//#> "Hello Bryan you are: 28 years old!"
```

### Default Parameters

> Sometimes a function's last parameter (or last few) should be optional. A function call could then omit the last argument, and instead the program would use a default value for that parameter. A function can have a **default parameter value** for the last parameter(s), meaning a call can optionally omit a corresponding argument.

```cpp
#include <iostream>
using namespace std;

// Function prints date in two styles (0: American (default), 1: European)
void DatePrint(int currDay, int currMonth, int currYear, int printStyle = 0) {

   if (printStyle == 0) {      // American
      cout << currMonth << "/" << currDay << "/" << currYear;
   }
   else if (printStyle == 1) { // European
      cout << currDay << "/" << currMonth << "/" << currYear;
   }
   else {
      cout << "(invalid style)";
   }
   
   return;
}

int main() {
   
   // Print dates given various style settings
   DatePrint(30, 7, 2012, 0);
   cout << endl;
   
   DatePrint(30, 7, 2012, 1);
   cout << endl;
   
   DatePrint(30, 7, 2012); // Uses default value for printStyle
   cout << endl;
   
   return 0;
}
```

## Return Statement

A function can only return one item, no more. The return statement is what value you want the function to return to you.

If your function [[#Return type]] is `void` then you are returning nothing and you will just use the keyword by itself: `return;`

```cpp
int Square ( int num1, int num2 ) {
	return num1 * num2;
}

int main() {
	int myNum = 7;
	
	std::cout << Square(myNum) << std::endl;
}

//#> 49
```

## Pass by Reference and Value

### Pass By Value

[[#Parameters]] are pass by value, meaning the argument's value is copied into a local variable for the parameter. This duplication is expensive with large items like [[C++ Arrays and Vectors#Vectors are Array|vectors]].

### Pass By References

> A **pass by reference** parameter does not create a local copy of the argument, but rather the parameter refers directly to the argument variable's memory location. Appending & to a parameter's data type makes the parameter pass by reference type.

```cpp
void MyFunction( vector<int>& inputVector ) {
	// References my vector but doesnt copy it into the function
	// body scope taking up an identical amount of memory.
	cout << inputVector.at(16345) << endl;
}

int main() {
	vector<int> myVector(785746353);
	
	MyFunction(myVector);
}
```

#### Pass By References with Const

In [[#Pass By References]] the `inputVector` was passed by reference which means any changes made to the vector inside the function body would result in mutation of the original vector as we referred to the original vector.

To prevent mutation of the original vector but take advantage of a pass by reference for efficiency we can prepend `const` to our input parameter so that we wont accidentally be able to mutate that pass by reference value.

```cpp
void MyFunction( const vector<int>& inputVector ) {
	// References my vector but doesnt copy it into the function
	// body scope taking up an identical amount of memory.
	cout << inputVector.at(16345) << endl;
}

int main() {
	vector<int> myVector(785746353);
	
	MyFunction(myVector);
}
```

## Declaration

> A **function declaration** specifies the function's return type, name, and parameters, ending with a semicolon where the opening brace would have gone

```cpp
void Hello( string firstName, string lastName );
```

## Definition

The meat of your function. This is where all the body code goes and where you actually perform your coded actions. These are the fleshed out versions of function [[#Declaration]]'s.

```cpp
void Hello( string firstName, string lastName ) {
	cout << "Hello " << firstName << " " << lastName << endl;
}
```

## Header files

See: [[C++ Directives#Header Files]]:

![[C++ Directives#Header Files]]

---

Related: 
- [[Bash Functions]]
