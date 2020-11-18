# Python Datetime

## [[Python Classes|Classes]]

- Date
- Time
- Datetime

python will handle dates from january 1st 1 to december 31st 9999

## Date

dates are constructed with 3 args

date(y,m,d)

## timedelta

use this class to add days to a date:

```python
from datetime import date, timedelta

today = date(2020, 2, 19)

print(today)
print(today.year)
print(today.month)
print(today.day)

tomorrow = timedelta(1)
print("Tomorrow is: ", today + tomorrow)
```

formatting a date that is dropped into a template literal:

```python
import datetime

today = datetime.date(2020, 2, 19)

print(today)
print(today.year)
print(today.month)
print(today.day)

tomorrow = datetime.timedelta(1)
print("Tomorrow is: ", today + tomorrow)

# date time message formatting:

print(today.strftime("%A, %B %d, %Y"))
message = "Today is: {:%A, %B %d, %Y}."
print(message.format(today))
```

time delta can also be used to DATEDIFF
