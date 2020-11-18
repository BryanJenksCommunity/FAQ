# Python Map Filter Reduce

```python
import math

def area(r):
    """Area of a circle with radius 'r'."""
    return math.pi * (r**2)

radii = [2, 5, 7.1, 0.3, 10]

# Method 1: Direct Method
areas = []
for r in radii:
    a = area(r)
    areas.append(a)

print(areas)

# Method 2: MAP Function
# map(<function>, <list, tuple, or other iterable object>)
list(map(area, radii))
print(list(map(area, radii)))

# Celcius to Farenheit with map and lambda
temps = [("Berlin",29), ("Cairo", 36), ("Buenos Aires", 19), ("Los Angelas", 26), ("Tokyo", 27), ("New York", 28), ("London", 22), ("Beijing", 32)]

c_to_f = lambda data: (data[0], (9/5)*data[1] + 32)

print(list(map(c_to_f, temps)))

# FILTER
import statistics

data = [1.3, 2.7, 0.8, 4.1, 4.3, -0.1]
avg = statistics.mean(data)
print(avg)
print(list(filter(lambda x: x > avg, data)))

# Remove Missing Data
countries = ["", "Argentina", "", "Brazil", "Chile", "", "Columbia", "", "Ecuador", "", "", "Venezuela"]

print(list(filter(None, countries)))

# dont use reduce, just use an explicit for loop
```
