#### C++ Class Unit Testing

---

# Unit Testing Classes

Related: [[C++ Unit Testing Functions]]

> A goal of testing is to achieve complete **code coverage**, meaning all code is executed at least once. Minimally for a class, that means every public function is called at least once. Of course, the programmer of a class knows about a class' implementation and thus will want to also ensure that every private helper function is called, and that every line of code within every function is executed at least once, which may require multiple calls with different input values for a function with branches.

## Class to Test

```cpp
#include <iostream>
using namespace std;

// Note: This class intentionally has errors

class StatsInfo {
public:
   void SetNum1(int numVal);
   void SetNum2(int numVal);
   int  GetNum1() const;
   int  GetNum2() const;
   int  GetAverage() const;
   void PrintNums()  const;
   
private:
   int num1;
   int num2;
};

void StatsInfo::SetNum1(int numVal) {
   num1 = numVal;
}

void StatsInfo::SetNum2(int numVal) {
   num2 = numVal;
}

int StatsInfo::GetNum1() const {
   return num1;
}

int StatsInfo::GetNum2() const {
   return num1;
}

int StatsInfo::GetAverage() const {
   return num1 + num2 / 2;
}
```

## Test Bench

```cpp
int main() {
   StatsInfo testData;

   // Typical testbench tests more thoroughly 

   cout << "Beginning tests." << endl;

   // Check set/get num1
   testData.SetNum1(100);
   if (testData.GetNum1() != 100) {
      cout << "   FAILED set/get num1" << endl;
   }

   // Check set/get num2
   testData.SetNum2(50);
   if (testData.GetNum2() != 50) {
      cout << "   FAILED set/get num2" << endl;
   }

   // Check GetAverage()
   testData.SetNum1(10);
   testData.SetNum2(20);
   if (testData.GetAverage() != 15) {
      cout << "   FAILED GetAverage for 10, 20" << endl;
   }

   testData.SetNum1(-10);
   testData.SetNum2(0);
   if (testData.GetAverage() != -5) {
      cout << "   FAILED GetAverage for -10, 0" << endl;
   }

   cout << "Tests complete." << endl;

   return 0;
}
```

---

Related: 
- [[C++ Classes]]
	- [[C++ Class Constructors]]
	- [[C++ Class Member Functions]]
	- [[C++ Classes The Big Three]]
