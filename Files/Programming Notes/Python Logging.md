# Python Logging

5 types of Logs

- Debug
- Info
- Warning
- Error
- Critical

The level of the logger:

| Level    | Numberic Value |
| -        | -              |
| NOTSET   | 0              |
| DEBUG    | 10             |
| INFO     | 20             |
| WARNING  | 30             |
| ERROR    | 40             |
| CRITICAL | 50             |

```python
import logging

dir(logging)
# items in all caps are constants
# capitalized items are classes
# lowercase are methods

# create an configure logger
logging.basicConfig(filename = "~/py.log")
logger = logging.getLogger()

# Test the logger
logger.info("our first message.")
print(logger.level) # Defaulted 30 so info and below is not shown
```
