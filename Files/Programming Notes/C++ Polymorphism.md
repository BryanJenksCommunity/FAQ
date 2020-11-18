#### C++ Polymorphism

---

# Function Name Overloading

> Sometimes a program has two functions with the same name but differing in the number or types of parameters, known as **function name overloading** or just **function overloading**.

```cpp
#include <iostream>
#include <string>
using namespace std;
			// int			int			   int
void DatePrint(int currDay, int currMonth, int currYear) {

   cout << currMonth << "/" << currDay << "/" << currYear;
   return;
}
			// int			string			  int
void DatePrint(int currDay, string currMonth, int currYear) {

   cout << currMonth << " " << currDay << ", " << currYear;
   return;
}

int main() {
   
   DatePrint(30, 7, 2012);
   cout << endl;
   
   DatePrint(30, "July", 2012);
   cout << endl;
   
   return 0;
}
```

---
Related:
- [[C++ Functions]]
