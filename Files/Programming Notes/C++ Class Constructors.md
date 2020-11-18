#### C++ Class Constructors

---

# Constructors

Constructors initialize instances of a class. A best practice is to initialize all variables when declared (likely to keep them in the same memory location on the stack). 

Constructors share the same name as the class name:

```cpp
#include <iostream>
#include <string>
using namespace std;

/*** ShopItem class definition ***/
class ShopItem {
public:
   void SetNameAndPrice(string itemName, int itemPrice);
   void Print() const;
   ShopItem();  // Default constructor
   
private:
   string name;  // Ex: "Bag of salad"
   int    price; // Price in cents. Ex: 199
};

ShopItem::ShopItem() {  // Default constructor
   name  = "NoName";    // Default name
   price = -1;          // Default price
   
   return;
}

void ShopItem::SetNameAndPrice(string itemName, int itemPrice) {
   name  = itemName;
   price = itemPrice;
   
   return;
}

void ShopItem::Print() const {
   cout << "Name: "  << name  << ", ";
   cout << "Price: " << price << endl;
   
   return;
}

/*** End definitions for ShopItem class ***/

int main() {
   ShopItem item1;  // Auto-calls default constructor
   
   item1.Print();
   
   item1.SetNameAndPrice("Soap", 385);
   item1.Print();
   
   return 0;
}
```

## Constructor Overloading

Just like with  [[C++ Polymorphism#Function Name Overloading]] you can overload a constructor to instantiate the same object (class) with different initialization values based on the parameters passed to the constructor:

```cpp
class Seat {
   public:
      ...
   Seat(); // Default constructor
   Seat(string resfirstName, string resLastName, int resAmountPaid); // Second constructor
      ...
};

Seat::Seat() { // Default constructor
   firstName  = "none";
   lastName   = "none";
   amountPaid = -1;
}

Seat::Seat(string resfirstName, string resLastName, int resAmountPaid) { // Second constructor
   firstName  = resfirstName;
   lastName   = resLastName;
   amountPaid = resAmountPaid;
}
```

## Constructor Member Initialization

```cpp
// Given

class SampleClass {
   public:
      SampleClass();
      void Print() const;

   private:
      int field1;
      int field2;
};

// Instead of this:

SampleClass::SampleClass() {
   field1 = 100;
   field2 = 200;

   return;
}

// You can do this:

SampleClass::SampleClass() : field1(100), field2(200) {
   return;
}
```

This is not particularly useful for members of basic types, but for data members like [[C++ Arrays and Vectors|vectors]] that need to be explicitly constructed with a size, this can be very useful:

```cpp
class SampleClass {
   public:
      SampleClass();
      void Print() const;

   private:
      vector<int> itemList; 
      // vector<int> itemList(2);  not allowed
};

SampleClass::SampleClass() : itemList(2) {
   // itemList gets constructed with size 2
   return;
}
```

---

Related: 
- [[C++ Classes]]
	- [[C++ Class Member Functions]]
	- [[C++ Classes The Big Three]]
	- [[C++ Class Unit Testing]]
