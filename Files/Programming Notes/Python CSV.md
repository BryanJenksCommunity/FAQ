# Python CSV

a CSV is read as a collection of strings, parsing the data into their correct data types is completely up to the user to perform.

google stock data url [here](https://goo.gl/3zaUlD)

```python
import csv
from datetime import datetime

path = "googleStockData.csv"
file = open(path, newline='')
reader = csv.reader(file)

header = next(reader) #the first line is the header

#print(header)
#print(data[0])
data = []
for row in reader:
    # row = [date, open, high, low, close, volume, adj.close]
    #       date, float, float,float,float,integer,float
    date = datetime.strptime(row[0], '%m/%d/%Y')
    open_price = float(row[1]) #rename column as open is a function call
    high = float(row[2])
    low = float(row[3])
    close = float(row[4])
    volume = int(row[5])
    adj_close = float(row[6])

    data.append([date, open_price, high, low, close, volume, adj_close])
print(data[0])

#compute and store daily stock returns
returns_path = "google_returns.csv"
file = open(returns_path, 'w')
writer = csv.writer(file)
writer.writerow(["Date", "Return"])

for i in range(len(data) - 1):
    todays_row = data[i]
    todays_date = todays_row[0]
    todays_price = todays_row[-1]
    yesterdays_row = data[i+1]
    yesterdays_price = yesterdays_row[-1]

    daily_return = (todays_price - yesterdays_price) / yesterdays_price
    formatted_date = todays_date.strftime('%m/%d/%Y')
    writer.writerow([formatted_date, daily_return])
```
