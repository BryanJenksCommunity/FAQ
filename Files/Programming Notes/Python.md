Links: [[Programming]]
Tags: #🗺️

---

# Python MOC

> Python is the "most powerful language you can still read.
> \
> \- Paul Dubois

## Documentations

- [Good documentation notes](https://thomas-cokelaer.info/tutorials/python/lists.html)

## Working With Python

- [[Jupyter Notebooks]]
- [[New Python Project Workflow]] Using [[Python Virtual Environments]]
- [[Manipulating Files With Python]]
- [[Python Tricks]]

## Language Concepts

- [[Python Classes]]
- [[Python Map Filter Reduce|Map, Filter, Reduce]]
- [[Python Loops|Loops]]
- [[Python Exception Handling|Exception Handling]]
- [[Python Data Types|Data Types]] & [[Python Data Structures|Data Structures]]

## Modules

- [[Python Pandas|Pandas]]
- [[Python Logging|Logging]]
- [[Python JSON|JSON]]
- [[Python CSV|CSV]]
- [[Python Datetime|Datetime]]

## Syntax

1. Use uppercase initials for class names, lowercase for all others.
	+ function names all in lowercase
	+ class.object.field names should not be capitalized, and if multiple words used, then separate with underscores: 'user1.first_name > user1.firstName'
2. Name a private identifier with a leading underscore ( _username)
3. Name a strongly private identifier with two leading underscores ( __password)
4. Special identifiers in Python end with two leading underscores.

*c. f-strings* (template literals)

If you use an f-string, you just need to mention the identifiers in curly braces. Also, write ‘f’ right before the string, but outside the quotes used.

```python
print(f"I just printed {x} pages to the printer {printer}")
```
