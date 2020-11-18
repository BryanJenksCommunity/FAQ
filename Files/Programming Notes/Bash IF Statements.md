Tags: 
References: [[Bash Test Conditionals]]
Links: [[Bash|Bash]]

---

# Bash IF Statements

Many beginners have an incorrect intuition about `if` statements brought about by seeing the very common pattern of an if keyword followed immediately by a `[` or `[[`. This convinces people that the `[` is somehow part of the `if` statement's syntax, just like parentheses used in C's if statement.

This is not the case! `if` takes a command. `[` is a command, not a syntax marker for the if statement. It's equivalent to the test command, except that the final argument must be a `]`. For example:

```bash
# POSIX
if [ false ]; then echo "HELP"; fi
if test false; then echo "HELP"; fi
```

Are equivalent -- both checking that the argument "false" is non-empty. In both cases HELP will always be printed, to the surprise of programmers from other languages guessing about shell syntax.

The syntax of an if statement is:

```bash
if COMMANDS
then <COMMANDS>
elif <COMMANDS> # optional
then <COMMANDS>
else <COMMANDS> # optional
fi # required
```

# Documentation

<https://mywiki.wooledge.org/BashPitfalls>
