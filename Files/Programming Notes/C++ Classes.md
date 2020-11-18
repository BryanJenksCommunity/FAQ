#### C++ Classes

---

# Classes and OOP

> The **class** construct defines a new type that can group data and functions to form an object

## Example

```cpp
#include <iostream>
using namespace std;

class RunnerInfo {
   public:                                // The class' public functions
      void   SetTime(int timeRunSecs);       // Time run in seconds
      void   SetDist(double distRunMiles);   // Distance run in miles
      double GetSpeedMph() const;            // Speed in miles/hour
   private:  // The class' private internal data members
      int    timeRun;
      double distRun;
};

// "RunnerInfo::" means SetTime is a RunnerInfo member function
void RunnerInfo::SetTime(int timeRunSecs) {
   timeRun = timeRunSecs;  // timeRun refers to data member
   return;
}

void RunnerInfo::SetDist(double distRunMiles) {
   distRun = distRunMiles;
   return;
}

double RunnerInfo::GetSpeedMph() const {
   return distRun / (timeRun / 3600.0); // miles / (secs / (hrs / 3600 secs))
}

int main() {
   RunnerInfo runner1; // User-created object of class type RunnerInfo
   RunnerInfo runner2; // A second object

   runner1.SetTime(360);
   runner1.SetDist(1.2);

   runner2.SetTime(200);
   runner2.SetDist(0.5);

   cout << "Runner1's speed in MPH: " << runner1.GetSpeedMph() << endl;
   cout << "Runner2's speed in MPH: " << runner2.GetSpeedMph() << endl;

   return 0;
}
```

```cpp
class ClassName {
  public:
      // Public member functions
   private:
      // Private data members
};
```

## Data management best practices

The best practice is to make all data members in a class private.

if a data member is declared but is not under a specific label of `public:` or `private:` then the default is **private**. The opposite is true in [[C++ Structs]].

## Classes with [[C++ Arrays and Vectors|Vectors]]

### Example

```cpp
#include <iostream>
#include <vector>
#include <string>
using namespace std;

/*** Seat class definition ***/
class Seat {
public:
   void Reserve(string resfirstName, string resLastName, int resAmountPaid);
   void MakeEmpty();
   bool IsEmpty() const;
   void Print() const;
   
private:
   string firstName;
   string lastName;
   int    amountPaid;
};

void Seat::Reserve(string resfirstName, string resLastName, int resAmountPaid) {
   firstName  = resfirstName;
   lastName   = resLastName;
   amountPaid = resAmountPaid;
   
   return;
}

void Seat::MakeEmpty() {
   firstName  = "empty";
   lastName   = "empty";
   amountPaid = 0;
   
   return;
}

bool Seat::IsEmpty() const {
   return(firstName == "empty");
}

void Seat::Print() const {
   cout << firstName << " " << lastName  << ", ";
   cout << "Paid: "  << amountPaid << endl;
   
   return;
}
/*** End definitions for Seat class ***/


/*** Functions for vector of Seat objects ***/
void SeatsMakeEmpty(vector<Seat>& seats) {
   unsigned int i = 0;
   
   for (i = 0; i < seats.size(); ++i) {
      seats.at(i).MakeEmpty();
   }
   
   return;
}

void SeatsPrint(vector<Seat> seats) {
   unsigned int i = 0;
   
   for (i = 0; i < seats.size(); ++i) {
      cout << i << ": ";
      seats.at(i).Print();
   }
   
   return;
}

void SeatsCreateReservation(vector<Seat>& seats) {
   string firstName, lastName;
   int amountPaid = 0;
   unsigned int seatNum = 0;
   Seat seat;
   
   cout << "Enter seat number (0..";
   cout << seats.size() - 1 << "): ";
   cin  >> seatNum;
   
   if (seatNum > (seats.size() - 1)) {
      cout << "Seat number too large." << endl;
   }
   else if ( !(seats.at(seatNum).IsEmpty()) ) {
      cout << "Seat already occupied." << endl;
   }
   else {
      cout << "Enter first name: ";
      cin >> firstName;
      cout << "Enter last name: ";
      cin >> lastName;
      cout << "Enter amount paid: ";
      cin >> amountPaid;
      
      seat.Reserve(firstName, lastName, amountPaid);
      seats.at(seatNum) = seat;
      
      cout << "Completed." << endl;
   }
   
   return;
}
/*** End functions for vector of Seat objs ***/

int main() {
   char   userKey = '-';
   vector<Seat> seats(5);
   
   SeatsMakeEmpty(seats);
   
   while (userKey != 'q') {
      cout << endl << "Enter command (p/r/q): ";
      cin >> userKey;
      
      if (userKey == 'p') { // Print seats
         SeatsPrint(seats);
      }
      else if (userKey == 'r') { // Reserve seat
         SeatsCreateReservation(seats);
      }
      else if (userKey == 'q') { // Quit
         cout << "Quitting." << endl;
      }
      else {
         cout << "Invalid command." << endl;
      }
   }
   
   return 0;
}
```


## Operator Overloading

Related:
- [[C++ Polymorphism#Function Name Overloading]]
- [[C++ Classes#Constructor Overloading]]

If you have 2 integers and you add them with `+` then you used the `+` operator. If you want to add 2 private data members that are part of a class that are comprised of multiple parts, the `+` operator is not able to handle this unless we overload it:

```cpp
TimeHrMn time1(3, 22);
TimeHrMn time2(2, 50);
TimeHrMn timeTot;

timeTot = time1 + time2;
timeTot.Print();

//#> H:5, M:72
```

> The + operator was somehow redefined to add TimeHrMn objects' hours and minutes fields separately (3 + 2 is 5, 22 + 50 is 72), leading to simple readable code.
> .
> Although `+` requires left and right operands as in `time1 + time2`, the member function only requires the <u>right operand</u> (rhs: right-hand-side) as the parameter, <u>because the left operand is the calling object</u>. In other words, `time1 + time2` is equivalent to the function call `time1.operator+(time2)`, which is valid syntax but almost never used.

```cpp

#include <iostream>
using namespace std;

class TimeHrMn {
public:
   TimeHrMn(int timeHours = 0, int timeMinutes = 0);
   void Print() const;
   TimeHrMn operator+(TimeHrMn rhs) ; // Overloaded `+` operator
private:
   int hours;
   int minutes;
};

// Overload + operator for TimeHrMn
TimeHrMn TimeHrMn::operator+(TimeHrMn rhs) { // Definition of overload
   TimeHrMn timeTotal;
   
   timeTotal.hours   = hours   + rhs.hours;
   timeTotal.minutes = minutes + rhs.minutes;
   
   return timeTotal;
}

TimeHrMn::TimeHrMn(int timeHours, int timeMinutes) {
   hours  = timeHours;
   minutes = timeMinutes;
   
   return;
}

void TimeHrMn::Print() const {
   cout << "H:" << hours << ", " << "M:" << minutes << endl;
   
   return;
}

int main() {
   TimeHrMn time1(3, 22);
   TimeHrMn time2(2, 50);
   TimeHrMn timeTot;
   
   timeTot = time1 + time2; // Implementation of overloaded operator
   timeTot.Print();
   
   return 0;
}
```

> When an operator like `+` has been overloaded, the compiler determines which `+` operation to invoke based on the operand types. In `4 + 9`, the compiler sees two integer operands and thus applies the built-in `+` operation. In `time1 + time2`, where `time1` and `time2` are `TimeHrMn` objects, the compiler sees two `TimeHrMn` operands and thus invokes the programmer-defined function.
> .
> A programmer can define several functions that overload the same operator, as long as each involves different types so that the compiler can determine which to invoke.

```cpp
#include <iostream>
using namespace std;

class TimeHrMn {
public:
   TimeHrMn(int timeHours = 0, int timeMinutes = 0);
   void Print() const;
   TimeHrMn operator+(TimeHrMn rhs);
   TimeHrMn operator+(int rhsHours);
private:
   int hours;
   int minutes;
};

// Operands: TimeHrMn, TimeHrMn. Call this "A"
TimeHrMn TimeHrMn::operator+(TimeHrMn rhs) {
   TimeHrMn timeTotal;
   
   timeTotal.hours   = hours   + rhs.hours;
   timeTotal.minutes = minutes + rhs.minutes;
   
   return timeTotal;
}

// Operands: TimeHrMn, int. Call this "B"
TimeHrMn TimeHrMn::operator+(int rhsHours) {
   TimeHrMn timeTotal;
   
   timeTotal.hours = hours + rhsHours;
   timeTotal.minutes = minutes; // Stays same
   
   return timeTotal;
}

TimeHrMn::TimeHrMn(int timeHours, int timeMinutes) {
   hours  = timeHours;
   minutes = timeMinutes;
   
   return;
}

void TimeHrMn::Print() const {
   cout << "H:" << hours << ", " << "M:" << minutes << endl;
   
   return;
}

int main() {
   TimeHrMn time1(3, 22);
   TimeHrMn time2(2, 50);
   TimeHrMn timeTot;
   int num = 91;
   
   timeTot = time1 + time2; // Invokes "A"
   timeTot.Print();
   
   timeTot = time1 + 10;    // Invokes "B"
   timeTot.Print();
   
   cout << num + 8 << endl; // Invokes built-in add
   
   // timeTot = 10 + time1; // ERROR: No (int, TimeHrMn)
   
   return 0;
}
```

## Class Code Separation of Concerns

Typically 2 files are used to separate class code:

`ClassName.h` **--** *Contains the class definition, including data members and member function declarations.*

`ClassName.cpp` **--**	*Contains member function definitions.*

> Sometimes multiple small related classes are grouped into a single file, to avoid a proliferation of files. But for typical classes, good practice is to create a unique `.cpp` and `.h` file for each class.

### Example

`StoreItem.h`

```cpp
#ifndef STOREITEM_H
#define STOREITEM_H

class StoreItem {
   public:
      void SetWeightOunces(int ounces);
      void Print() const;
   private:
      int weightOunces;
};

#endif
```

`StoreItem.cpp`

```cpp
#include <iostream>
using namespace std;

#include "StoreItem.h"

void StoreItem::SetWeightOunces(int ounces) {
   weightOunces = ounces;
   return;
}

void StoreItem::Print() const {
   cout << "Weight (ounces): " << weightOunces << endl;
   return;
}
```

`main.cpp`

```cpp
#include <iostream>
using namespace std;

#include "StoreItem.h"

int main() {
   StoreItem item1;

   item1.SetWeightOunces(16);
   item1.Print();

   return 0;
}
```

### Classes Within Classes

`TeamPerson.h`

```cpp
#ifndef TEAMPERSON_H
#define TEAMPERSON_H

#include <string>
using namespace std;

class TeamPerson {
   public:
      void   SetFullName(string firstAndLastName);
      void   SetAgeYears(int ageInYears);
      string GetFullName() const;
      int    GetAgeYears() const;
      void   Print() const;

   private:
      string fullName;
      int    ageYears;
};

#endif
```

`TeamPerson.cpp`

```cpp
#include <iostream>
#include <string>
using namespace std;

#include "TeamPerson.h"

void TeamPerson::SetFullName(string firstAndLastName) {
   fullName = firstAndLastName;
   return;
}

void TeamPerson::SetAgeYears(int ageInYears) {
   ageYears = ageInYears;
   return;
}

string TeamPerson::GetFullName() const {
   return fullName;
}

int TeamPerson::GetAgeYears() const {
   return ageYears;
}

void TeamPerson::Print() const {
   cout << "Full name: "   << fullName << endl;
   cout << "Age (years): " << ageYears << endl;
}
```

`SoccerTeam.h`

```cpp
#ifndef SOCCERTEAM_H
#define SOCCERTEAM_H

#include "TeamPerson.h"

class SoccerTeam {
   public:
      void SetHeadCoach(TeamPerson teamPerson);
      void SetAssistantCoach (TeamPerson teamPerson);

      TeamPerson GetHeadCoach() const;
      TeamPerson GetAssistantCoach() const;

      void Print() const;

   private:
      TeamPerson headCoach;
      TeamPerson assistantCoach;
      // Players omitted for brevity
};

#endif
```

`SoccerTeam.cpp`

```cpp
#include <iostream>
using namespace std;

#include "TeamPerson.h"
#include "SoccerTeam.h"

void SoccerTeam::SetHeadCoach(TeamPerson teamPerson) {
   headCoach = teamPerson;
   return;
}

void SoccerTeam::SetAssistantCoach(TeamPerson teamPerson) {
   assistantCoach = teamPerson;
   return;
}

TeamPerson SoccerTeam::GetHeadCoach() const {
   return headCoach;
}

TeamPerson SoccerTeam::GetAssistantCoach() const {
   return assistantCoach;
}

void SoccerTeam::Print() const {
   cout << "HEAD COACH: " << endl;
   headCoach.Print();
   cout << endl;

   cout << "ASSISTANT COACH: " << endl;
   assistantCoach.Print();
   cout << endl;
   return;
}
```

`main.cpp`

```cpp
#include <iostream>
using namespace std;

#include "SoccerTeam.h"
#include "TeamPerson.h"

int main() {
   SoccerTeam teamCalifornia;
   TeamPerson headCoach;
   TeamPerson asstCoach;

   headCoach.SetFullName("Mark Miwerds");
   headCoach.SetAgeYears(42);
   teamCalifornia.SetHeadCoach(headCoach);

   asstCoach.SetFullName("Stanley Lee");
   asstCoach.SetAgeYears(30);
   teamCalifornia.SetAssistantCoach(asstCoach);

   teamCalifornia.Print();

   return 0;
}
```


---

Related: 
- [[Python Classes]]
