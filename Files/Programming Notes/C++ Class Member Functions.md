#### C++ Class Member Functions

---

# Class Member Function

A member function is a [[C++ Functions|function]] that is a _member_ of a class.

Typically these are `public` functions so that the user can call them as methods of the class instances. There are however private member functions that do some work in the background that the user doesn't even know exist.

### Member Access Operator

These function use the `.` operator known as the `Member Access Operator` which is typical dot notation of `class.method();`

Typically the class will have `getter` and `setter` functions some to set the values of the private data members to the value of inputted data, and others to output that data for the user to use. 

### Scope Resolution Operator

in the class we may declare member functions but if there is a lot of logic we don't want to crowd the class so we may take advantage of the `Scope Resolution Operator`: `::`. Similar to how `R` code uses `::` to access functions from specific packages. We do this by putting a [[C++ Functions#Declaration]] in the class declaration and then the [[C++ Functions#Definition]] below which houses all the logic:

```cpp
void   SetTime(int timeRunSecs);       // Time run in seconds

}; // end of the class declaration

// "RunnerInfo::" means SetTime is a RunnerInfo member function
void RunnerInfo::SetTime(int timeRunSecs) {
   timeRun = timeRunSecs;  // timeRun refers to data member
   return;
}
```

If a member function has the word `const` after its declaration like: 

```cpp
double GetSpeedMph() const;            // Speed in miles/hour
```

from the [[C++ Classes#Example]] above, then this means that this member function cannot change the value of any data member or else an error is thrown.

### Inline Member Functions

Unlike the example in [[C++ Classes#Scope Resolution Operator]] you can put all the code for a member function in the class declaration. this is called an Inline Member Function, because the [[C++ Functions#Definition]] is in the class declaration.

```cpp
class RunnerInfo {
   public:
      void   SetTime(int timeRunSecs) { // Here is the inline function
         timeRun = timeRunSecs;
      }
      void   SetDist(double distRunMiles);
      double GetSpeedMph() const;
   private:
      int    timeRun;
      double distRun;
};

void RunnerInfo::SetDist(double distRunMiles) {
   distRun = distRunMiles;

   return;
}
```

### Mutators, Accessors, and Private Helpers

> Commonly, a data member has a pair of associated functions: a mutator for setting its value, and an accessor for getting its value, as above. Those functions are also known as a **setter** and **getter** functions, respectively, and typically have names that start with set or get.

#### Example

```cpp
#include <iostream>
using namespace std;

class GameInfo {
   public:
      void SetPlayer1PlayA(int playScore); // Mutator
      void SetPlayer1PlayB(int playScore); // Mutator
      void SetPlayer2PlayA(int playScore); // Mutator
      void SetPlayer2PlayB(int playScore); // Mutator

      int  GetPlayer1PlayA() const;        // Accessor
      int  GetPlayer1PlayB() const;        // Accessor
      int  GetPlayer2PlayA() const;        // Accessor
      int  GetPlayer2PlayB() const;        // Accessor

      int  GetPlayer1HighScore() const;    // Accessor
      int  GetPlayer2HighScore() const;    // Accessor

   private:
      int player1PlayA;
      int player1PlayB;
      int player2PlayA;
      int player2PlayB;
      int MaxOfPair(int num1, int num2) const; // Private helper fct
};

void GameInfo::SetPlayer1PlayA(int playScore) {
   player1PlayA = playScore;
}

void GameInfo::SetPlayer1PlayB(int playScore) {
   player1PlayB = playScore;
}

void GameInfo::SetPlayer2PlayA(int playScore) {
   player2PlayA = playScore;
}

void GameInfo::SetPlayer2PlayB(int playScore) {
   player2PlayB = playScore;
}

int  GameInfo::GetPlayer1PlayA() const {
   return player1PlayA;
}

int  GameInfo::GetPlayer1PlayB() const {
   return player1PlayB;
}

int  GameInfo::GetPlayer2PlayA() const {
   return player2PlayA;
}

int  GameInfo::GetPlayer2PlayB() const {
   return player2PlayB;
}

int GameInfo::GetPlayer1HighScore() const {
   return MaxOfPair(player1PlayA, player1PlayB);
}

int GameInfo::GetPlayer2HighScore() const {
   return MaxOfPair(player2PlayA, player2PlayB);
}

int GameInfo::MaxOfPair(int num1, int num2) const {
   if (num1 > num2) {
      return num1;
   }
   else {
      return num2;
   }
}

int main() {
   GameInfo funGame;

   funGame.SetPlayer1PlayA(88);
   funGame.SetPlayer1PlayB(97);
   funGame.SetPlayer2PlayA(74);
   funGame.SetPlayer2PlayB(40);

   cout << "Player1 playA: " << funGame.GetPlayer1PlayA() << endl;

   cout << "Player1 max: " << funGame.GetPlayer1HighScore() << endl;
   cout << "Player2 max: " << funGame.GetPlayer2HighScore() << endl;

   return 0;
}
```

#### Mutators

Modify / 'Mutate' the data members of a class (a setter, it sets the value of a data member by changing it)

```cpp
// Public member function. Setter / Mutator
public:
	void SetPlayer1PlayA(int playScore); // Mutator

// Private data member that users cant access
private:
	int player1PlayA;

// Function definition, get input value and set private data member
// value equal to that input
void GameInfo::SetPlayer1PlayA(int playScore) {
   player1PlayA = playScore;
}
```

#### Accessors

Accessors can let the user access the values of the private data members:

> Accessor functions usually are defined as const, to enforce that they do not change data members. The keyword **const** after a member function's declaration and definition causes the compiler to report an error if the function modifies a data member. **<u>If a const member function calls another member function, that function must also be const.</u>**

```cpp
int  GetPlayer1PlayA() const;        // Accessor
int  GameInfo::GetPlayer1PlayA() const {
   return player1PlayA;
}
```

#### Private Helpers

These are private functions that are used in the background to carry out tasks. The user will not be able access the functions at all, to the users these functions do not exist.

```cpp
private:
	int MaxOfPair(int num1, int num2) const; // Private helper fct
```

---

Related: 
- [[C++ Classes]]
	- [[C++ Class Constructors]]
	- [[C++ Classes The Big Three]]
	- [[C++ Class Unit Testing]]
