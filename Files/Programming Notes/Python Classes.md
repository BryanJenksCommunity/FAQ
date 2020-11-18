#### Python Classes

```python
import datetime

# class names should start with a capital letter
class User:
    """This is a doc string for this python class,
    if you call help(User) this is what will appear
    it will also show you other useful and relevant information
    but it must be encapsulated within 3 sets of double quotes"""

    # init/initializer is basically a constructor, this code runs first every time a new instance of this class is created
    # self is a reference to the newly created object instance
    def __init__(self, full_name, birthday):
        self.name = full_name # getter/setter
        self.birthday = birthday

    # extract first and last names
    name_pieces = full_name.split(" ")
    self.first_name = name_pieces[0]
    self.last_name = name_pieces[-1]

    def age(self):
        """Return the age of the user in years"""
        today = datetime.date(2001, 5, 12)
        yyyy = int(self.birthday[0:4])
        mm = int(self.birthday[4:6])
        dd = int(self.birthday[6:8])
        dob = datetime.date(yyyy, mm, dd) # date of birth
        age_in_days = (today - dob).days
        age_in_years = age_in_days / 365
        return int(age_in_years)

user1 = new User("john legend", 20191120)
user1.name # result: "john legend"
user1.first_name # result: "john"
user1.last_name # result: "legend"
user1.birthday # result: 20191120

```

```python
class User1:
    pass

# Conventions: Class names Proper case
# Method names lower case snake case
# variables lower case
user1 = User1()
user1.first_name = "Bryan"
user1.last_name = "Jenks"
user1.age = 27
print(user1.first_name)
print(user1.last_name)

user2 = User1()
user2.first_name = "Frank"
user2.last_name = "Poole"
user2.favorite_book = "2001: A Space Odessey"

# CLASS BENEFITS:
## Methods
## Initialization
## Help Text
import datetime

class User:
    """
    A member of friendface. for now we only store name and birthday, but in the future we will store an uncomfortable amount of information of the user.
    """
    # __INIT__ is the initilization/constructor of the class instance
    def __init__(self, full_name, birthday):
        self.name = full_name
        self.birthday = birthday

        # Extract First and Last Names
        name_pieces = full_name.split(" ")
        self.first_name = name_pieces[0]
        self.last_name = name_pieces[-1]

    def age(self):
        """Return The age of the user in years"""
        today = datetime.date(2001, 5, 12)
        yyyy = int(self.birthday[0:4])
        mm = int(self.birthday[4:6])
        dd = int(self.birthday[6:8])
        dob = datetime.date(yyyy, mm, dd)
        age_in_days = (today - dob).days
        age_in_years = age_in_days / 365
        return int(age_in_years)

user = User("Bryan Jenks", "19920923")
print(user.name)
print(user.first_name)
print(user.last_name)
print(user.birthday)
print(user.age())
```
