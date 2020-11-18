#### C++ Include vector

---

# Array++

## Site Definition

[vector](http://cplusplus.com/reference/vector/vector/)

> Vectors are sequence containers representing arrays that can change in size. 
> .
> Just like arrays, vectors use contiguous storage locations for their elements, which means that their elements can also be accessed using offsets on regular pointers to its elements, and just as efficiently as in arrays. But unlike arrays, their size can change dynamically, with their storage being handled automatically by the container.

## Vector Member Functions 

### Capacity

#### resize()

To dynamically resize a vector while program is executing and size is not known during compile time.

```cpp
vctr.resize(N);  // Allocates N elements for vector vctr.
```

resize is now adding new slots on top of existing elements, rather it just states that *"THIS is how many elements are in this vector"*. If the resize value is smaller than the vectors current size, all elements in indexes larger than `N` are destroyed and `N` is now the size of the vector.

### Element Access

#### at()

Returns the value at the index number given like the traditional array syntax:

```cpp
vector.at(1) == array[1]; // True
```

you can even use the array syntax on the vector although `.at()` is recommended due to superior error checking just like strings:

![[C++ Include string#at index]]

#### back()

Basically asks *"Hey, whats the item at the end? i don't know the index but that's the last value??"*

```cpp
// playersList initially 55, 99, 44

cout << playersList.back(); // Prints 44 

// playersList is still  55, 99, 44
```

### Modifiers

#### push_back()

just like `push()` in Javascript for vectors you are adding a new element to the vector and therefore creating a single new index. 

```cpp
// playersList initially 55, 99, 44      (size is 3)

playersList.push_back(77); // Appends new element, sets value to 77 

// playersList is now    55, 99, 44, 77  (size is 4)
```

#### pop_back()

Just like `pop()` in Javascript, this removes the last element from the vector. 

```cpp
// playersList is 55, 99, 44 (size 3)

playersList.pop_back();     // Removes last element

// playersList now 55, 99    (size 2)

cout << playersList.back(); // Common combination of back() 

playersList.pop_back();     // followed by pop_back()

// Prints 99. playersList becomes just 55

cout << playersList.pop_back(); // Common error 
                                // pop_back() returns void
```

## Modification

### Vector copying

In this example `salePrices = origPrices;`

```cpp

const int   NUM_ELEMENTS = 4;         // Number of elements
vector<int> origPrices(NUM_ELEMENTS); // Original prices
vector<int> salePrices(NUM_ELEMENTS); // Sale prices
int i = 0;                            // Loop index

// Assign original prices
origPrices.at(0) = 10;
origPrices.at(1) = 20;
origPrices.at(2) = 30;
origPrices.at(3) = 40;

// Copy original prices to sales prices

salePrices = origPrices;
```

vector `salePrices` is empty and of size 0 until it copies every element in `origPrices`. This is a complete duplication and takes up twice the memory.

### Vector Equality

in the above example in [[#Vector copying]], if one were to change the values in some of the elements in `salePrices` and then perform an equality check `==` then the vector will compare element to element through the whole vector and return a boolean result.

```cpp
// Update salePrices. Note: does not affect origPrices
salePrices.at(2) = 27;
salePrices.at(3) = 35;

salePrices == origPrices; // because of above they are no longer equal
						  // or identical, result is false
```
