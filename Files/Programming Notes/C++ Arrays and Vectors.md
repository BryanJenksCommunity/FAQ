#### C++ Arrays and Vectors

---

# Vectors are Array++

A **[[C++ Include vector|vector]]** is an ordered list of items of a given data type. 

Each item in a vector is called an **element**.

```cpp
#include <vector>
// vector<dataType> identifier(numElements);
vector<int> myVector(5); // an integer vector with 5 elements
/*
	Though if you assign a vector a size of 5 the true size is still using the 0..n array indexing. so if you say:
*/
vector<int> myVector(5);
/*
	and then try to access element 5:
*/
myVector.at(5); // <-- ERROR! 5 elements at index 0..4
```

## Iterating Through a Vector

Using [[C++ For Loops]] on a vector can be a little irritating at first with the  size declaration but usage of array indexing:

```cpp
// These give a variable to reference the size of the vector
const int NUM_ELEMENTS = 3;
vector<int> userVals(NUM_ELEMENTS);

// test case
userVals.at(0) = 2;
userVals.at(1) = 7;
userVals.at(2) = 4;

/*
	where i < NUM_ELEMENTS is to say it quits if it is larger than 2
	i.e. 3. NUM_ELEMENTS goes up to 3, but because of the array indexing
	the true values are 0, 1, & 2 as shown above in the test case
*/
for (int i = 0; i < NUM_ELEMENTS; ++i) {
  cout << userVals.at(i) << endl;
}

//#> 2, 7, 4
```

An even easier way of doing the same thing without an unnecessary `const` variable is to use `.size()`

```cpp
vector<int> userVals(3);

// test case
userVals.at(0) = 2;
userVals.at(1) = 7;
userVals.at(2) = 4;

/*
	the size is 3 so if i < 3 which is what the prior example also showed
*/
for (int i = 0; i < userVals.size(); ++i) {
  cout << userVals.at(i) << endl;
}

//#> 2, 7, 4
```

## Reversing a vector

```cpp
const int NUM_ELEMENTS = 8;        // Number of elements
vector<int> revVctr(NUM_ELEMENTS); // User values
unsigned int i;                    // Loop index
int tmpValue;                      // Placeholder

// User populates the vector
cout << "Enter " << NUM_ELEMENTS << " integer values..." << endl;
for (i = 0; i < revVctr.size(); ++i) {
  cout << "Value: ";
  cin >> revVctr.at(i);
}

// Reverse the vector (this doesnt take into account an odd # of vals)
// Size returns the amount of values in a vector, the exact number of
// indexes is really -1 but to rever a vector we really only need to
// pivot around a mid point or in this case a middle value or half of
// the vector's size hence .size() / 2 below
for (i = 0; i < (revVctr.size() / 2); ++i) {
  // temp value holds the values one by one starting from the left i=1
  tmpValue = revVctr.at(i);  
  // .size() - 1 as that is the true last index of the vector and -i
  // so we can begin to move towards the center values right to left
  // i starts off at 0 so the first iteration is in reality swapping
  // the first and last elements of a vector
  revVctr.at(i) = revVctr.at(revVctr.size() - 1 - i);
  // Referring again to the true last element of the vector receiving 
  // the true last index of the vector receiving the value of the first 
  // this is the end of the swap
  revVctr.at(revVctr.size() - 1 - i) = tmpValue;
}
```


---

Related:
- [[Python Data Structures]]
- [[Bash Variables#Double Parentheses]]
