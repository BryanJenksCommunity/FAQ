Tags: 
References: 
Links: [[Bash|Bash]]

---

# Bash Test Conditionals

Testing conditions is down to using square bracket syntax:

```bash
if [ 1 = 3 ] || [ 2 = 2 ]; then
    echo "yes!"
fi
```

To note, double brackets are a BASH-ism and not [[POSIX]] compliant.
To test multiple conditions for the same evaluation do not use the
internal `-a` for and or the `-o` for or like:

```bash
if [ 1 = 3 -o 2 = 2 ]; then
    echo "yes!"
fi
```

Instead separate the tests into separate commands with the `&&` operator.
This way it will run each test as a separate command, AND it will only
continue forward if the condition is true:

`<this has to be true> && "AND" <this has to be true, to continue>`.

Double quote [[Bash Variables|variables]] use in the test condition unless you
explicitly know and understand why they should be unquoted.

## Ternary Tests ^[[pure bash bible](https://github.com/dylanaraps/pure-bash-bible)]

```bash
# Ternary Tests
## Set the value of var to var2 if var2 is greater than var.
## var: variable to set.
## var2>var: Condition to test.
## ?var2: If the test succeeds.
## :var: If the test fails.
((var=var2>var?var2:var))
```

# Documentation

<https://mywiki.wooledge.org/BashPitfalls>
