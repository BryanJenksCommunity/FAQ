#### C++ Case Statements

---

# The Case Statement

Case statement == Switch

## Syntax

```cpp
int main() {
    int num = 0;

    cout << "Enter a number (1,2, or 3: ";
    cin  >> num;

    switch (num) {
       case 1:
          cout << "You Chose 1!" << endl;
          break;

       case 2:
          cout << "You Chose 2!" << endl;
          break;

       case 3:
          cout << "You Chose 3!" << endl;
          break;

       default:
          cout << "WUT" << endl;
          break;
    }

   return 0;
}
```

## Multi-Case Flows

If you line up a bunch of cases like this:

```cpp
int main() {
   int dogAgeYears  = 0;
   int dogAgeMonths = 0;

   cout << "Enter dog's age (in years): ";
   cin >> dogAgeYears;

   if (dogAgeYears == 0) {
      cout << "Enter dog's age in months: ";
      cin  >> dogAgeMonths;

      switch (dogAgeMonths) {
         case 0:
         case 1:
         case 2:
            cout << "That's 0..14 human months." << endl;
            break;

         case 3:
         case 4:
         case 5:
         case 6:
            cout << "That's 1..5 human years." << endl;
            break;

         case 7:
         case 8:
            cout << "That's 5..9 human years." << endl;
            break;

         case 9:
         case 10:
         case 11:
         case 12:
            cout << "That's 9..15 human years." << endl;
            break;

         default:
            cout << "Invalid input." << endl;
            break;
      }
   }
   else {
      cout << "FIXME: Do earlier dog year cases." << endl;
      switch (dogAgeYears) {
      }
   }

   return 0;
}
```

The cases for 3,4,5, and 6 will all cause the same result, i.e. the result for case 6. The other cases will hit and then flow down executing all code until they finally hit a `break;` statement. This can be useful shorthand for grouping multiple inputs to the same output code. ^723541

---

Related:
- [[Bash Case Statements]]
