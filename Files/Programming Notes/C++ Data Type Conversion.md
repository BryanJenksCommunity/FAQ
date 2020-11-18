#### C++ Data Type Conversion

---

If you do not want to make a new variable^[[[C++ Variables and Datatypes]]] or refactor an existing variable due to the need for it to be a `double` and not an `int` any longer.

Like when finding the average of integers and the returned value is floating point

this will work like `cast()` in SQL

```cpp
#include <iostream>
using namespace std;

int main() {
   int kidsInFamily1 = 3; // Should be int, not double
   int kidsInFamily2 = 4; // (know anyone with 2.3 kids?)
   int numFamilies   = 2; // Should be int, not double

   double avgKidsPerFamily = 0.0; // Expect fraction, so double

   avgKidsPerFamily = static_cast<double>(kidsInFamily1 + kidsInFamily2) 
                      / static_cast<double>(numFamilies);

   cout << "Average kids per family: " << avgKidsPerFamily << endl;

   return 0;
}
```

---

Related:
- [[Python Data Types]]
