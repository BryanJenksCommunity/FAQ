Tags: 
References: 
Links: [[Bash|Bash]]

---

# Variables

Variables in bash are assigned with a single `=`
No spacing between the variable name, the `=` and the assigned value
You can specify the variables scope with either `export` or `local` or
an environmental variable with no explicit scope.

Once declared in your script or environment etc, you can reference your
variables by matching the exact casing of the variable name and pre-pending
a `$` so my path variable for binaries to execute would be `$PATH`.

When referencing your variables always quote them because of:
"General rule: quote it if it can either be empty or contain spaces"
"`$?` doesn't need quotes since it's a numeric value."

```bash
## Variables

### Local vars
local var=2

### Global Vars
var=2

### Environment
export var=2

echo "$var"
```

"In short, quote everything where you do not require the shell to perform token
splitting and wild card expansion."

```sh

## Token Splitting
words="foo bar baz"
for word in $words; do
    echo "$word"
done
#> foo
#> bar
#> baz

```

Double quotes are suitable when variable [[interpolation]] is
required. With suitable adaptations, it is also a good workaround when you need
single quotes in the string. (There is no straightforward way to escape a
single quote between single quotes, because there is no escape mechanism inside
single quotes -- if there was, they would not quote completely verbatim.)

No quotes are suitable when you specifically require the shell to perform token
splitting and/or wild card expansion.

```bash
## Wildcard Expansion

### Literal Strings
pattern='file*.txt'
ls $pattern
# > file1.txt      file_other.txt

### Double Quotes
ls "$pattern"
#> ls: cannot access file*.txt: No such file or directory
# (There is no file named literally file*.txt.)

ls '$pattern'
#> ls: cannot access $pattern: No such file or directory
# (There is no file named $pattern, either!)
```

In more concrete terms, anything containing a filename should usually be quoted
(because filenames can contain whitespace and other shell meta characters).
Anything containing a URL should usually be quoted (because many URL's contain
shell meta characters like `?` and `&`). Anything containing a regex should usually
be quoted (ditto ditto). Anything containing significant whitespace other than
single spaces between non-whitespace characters needs to be quoted (because
otherwise, the shell will munge the whitespace into, effectively, single
spaces, and trim any leading or trailing whitespace).

When you know that a variable can only contain a value which contains no shell
meta characters, quoting is optional. Thus, an unquoted `$?` is basically fine,
because this variable can only ever contain a single number. However, `"$?"` is
also correct, and recommended for general consistency and correctness (though
this is my personal recommendation, not a widely recognized policy).

Values which are not variables basically follow the same rules, though you
could then also escape any meta characters instead of quoting them. For a common
example, a URL with a & in it will be parsed by the shell as a background
command unless the meta character is escaped or quoted:

## Here is a three-point formula for quotes in general:

### *Double quotes*

In contexts where we want to suppress word splitting and globbing. Also in
contexts where we want the literal to be treated as a string, not a regex.

### *Single quotes*

In string literals where we want to suppress interpolation and special
treatment of backslashes. In other words, situations where using double quotes
would be inappropriate.

### *No quotes*

In contexts where we are absolutely sure that there are no word splitting or
globbing issues or we do want word splitting and globbing.

### *Examples*

#### _Double quotes_

   Literal strings with whitespace ("Stack Overflow rocks!", "Steve's Apple")
    variable expansions (`"$var"`, `"${arr[@]}"`)
    command substitutions (`"$(ls)"`, `"ls"`)
    globs where directory path or file name part includes spaces (`"/my dir/"*`)
    to protect single quotes (`"single'quote'delimited'string"`)
    Bash parameter expansion (`"${filename##*/}"`)

#### _Single quotes_

   Command names and arguments that have whitespace in them literal strings that need interpolation to be suppressed  'Really costs \$\$!', 'just a backslash followed by a t: \t') to protect double quotes ('The "crux"') regex literals that need interpolation to be suppressed use shell quoting for literals involving special characters (`$'\n\t'`) use shell quoting where we need to protect several single and double quotes (`$'{"table": "users", "where": "first_name"=\'Steve\'}'`)

#### _No quotes_

   Around standard numeric variables (`$`, `$?`, `$#` etc.) in arithmetic contexts like ((count++)), `"${arr[idx]}"`, `"${string:start:length}"`
    inside `[[ ]]` expression which is free from word splitting and globbing issues (this is a matter of style and opinions can vary widely) where we want word splitting (`for word in $words`) where we want globbing (`for txtfile in *.txt; do ...`) where we want ~ to be interpreted as `$HOME` (`~/"some dir" but not "~/some dir"`)

```bash
## Non escaped meta characters
wget http://example.com/q&uack
#> [1] wget http://example.com/q
#> -bash: uack: command not found

### Single quotes is best or put into a variable
wget 'http://example.com/q&uack'  # Single quotes preferred for a static string
wget "http://example.com/q&uack"  # Double quotes work here, too (no $ or ` in the value)
wget http://example.com/q\&uack   # Backslash escape
wget http://example.com/q'&'uack  # Only the meta character really needs quoting
```


## Meta characters with variables

The braces, in addition to delimiting a variable name are used for parameter expansion so you can do things like:

    Truncate the contents of a variable

```bash
var="abcde"; echo ${var%d*}
#> abc
```

    Make substitutions similar to sed

```bash
var="abcde"; echo ${var/de/12}
#> abc12
```

    Use a default value

```bash
default="hello"; unset var; echo ${var:-$default}
#> hello
```

    and several more

Also, brace expansions create lists of strings which are typically iterated
over in loops:

```bash
echo f{oo,ee,a}d
#> food feed fad

mv error.log{,.OLD}
# (error.log is renamed to error.log.OLD because the brace expression
# expands to "mv error.log error.log.OLD")

for num in {000..2}; do echo "$num"; done
#> 000
#> 001
#> 002

echo {00..8..2}
#> 00 02 04 06 08

echo {D..T..4}
#> D H L P T
```

## Double parentheses are used for arithmetic operations:

```bash
((a++))

((meaning = 42))

for ((i=0; i<10; i++))

echo $((a + b + (14 * c)))
```

and they enable you to omit the dollar signs on integer and array variables and include spaces around operators for readability.

Single brackets are also used for array indices:

```bash
array[4]="hello"

element=${array[index]}
```

## Brackets ^[http://wiki.bash-hackers.org/scripting/obsolete]

```bash
if [ CONDITION ]    # Test construct
if [[ CONDITION ]]  # Extended test construct
Array[1]=element1   # Array initialization
[a-z]               # Range of characters within a Regular Expression
$[ expression ]     # A non-standard & obsolete version of $(( expression )) 
```


## Curly Braces

```bash
${variable}                             # Parameter substitution
${!variable}                            # Indirect variable reference
{ command1; command2; . . . commandN; } # Block of code
{string1,string2,string3,...}           # Brace expansion
{a..z}                                  # Extended brace expansion
{}                                      # Text replacement, after find and xargs
```

## Parentheses

```bash
( command1; command2 )             # Command group executed within a subshell
Array=(element1 element2 element3) # Array initialization
result=$(COMMAND)                  # Command substitution, new style
>(COMMAND)                         # Process substitution
<(COMMAND)                         # Process substitution
```

## Double Parentheses


```bash
(( var = 78 ))            # Integer arithmetic
var=$(( 20 + 5 ))         # Integer arithmetic, with variable assignment
(( var++ ))               # C-style variable increment
(( var-- ))               # C-style variable decrement
(( var0 = var1<98?9:21 )) # C-style ternary operation
```


# Documentation

[bashtips](https://drawings.jvns.ca/bashtips/)
[quoting variables SO](https://stackoverflow.com/questions/10067266/when-to-wrap-quotes-around-a-shell-variable#10067297)
