#### C++ Class This Implicit Parameter

---

# The 'this' Implicit Parameter

> Within a member function, the implicitly-passed object pointer is accessible via the name this. In particular, a member can be accessed as `this->member`. The `->` is the member access operator for a pointer, similar to the `.` operator for non-pointers.

```cpp
#include <iostream>
using namespace std;

class ShapeSquare {
   public:
      void   SetSideLength(double sideLength);
      double GetArea() const;
   private:
      double sideLength;
};

void ShapeSquare::SetSideLength(double sideLength) {
   this->sideLength = sideLength; // Refer to data member with same
   // Data member      Parameter  // name as the passed in parameter
   return;
}

double ShapeSquare::GetArea() const{
   return sideLength * sideLength; // Both refer to data member
}

int main() {
   ShapeSquare square1;

   square1.SetSideLength(1.2);
   cout << "Square's area: " << square1.GetArea() << endl;

   return 0;
}
```

---

Related: 
- [[C++ Classes]]
	- [[C++ Class Member Functions]]
	- [[C++ Class Constructors]]
	- [[C++ Classes The Big Three]]
	- [[C++ Class Unit Testing]]
