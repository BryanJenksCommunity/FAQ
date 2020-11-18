# Python JSON

```python
import json

# json.load(f) load json from a file or file like object
# json.loads(s) load json data from a string
# json.dump(j, f) write json objects to file or file like object
# json.dumps(j) output json object as string

json_file = open("sample.json", "r", encoding="utf-8")

movie = json.load(json_file)
json_file.close()
print(movie)

type(movie)
print(movie["title"])

value = """{
    "title":"Tron: Legacy",
    "release_year":2010,
    "won_oscar":false,
    "actors": null,
    "budget":170000000,
    "composer":"Daft Punk"
    }"""
tron = json.loads(value)
print(tron)

json.dumps(movie)
print(json.dumps(movie))
```
