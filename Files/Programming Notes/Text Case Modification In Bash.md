Tags: 
References: 
Links: [[Bash|Bash]]

---

# Text Case Modification In Bash


I realize that this is beside your point, but…don't shell out to `tr` like you did. It's really slow and Bash has built-in facilities for manipulating strings—especially case. Equivalent to your code `input=$(echo "$value" | tr '[:upper:]' '[:lower:]')` would be something like:

    input="$*"
    input="${input,,}"

We are assigning a new value to the `bash` variable `input`.  The right-hand-side of the `=` is the new value. If we used `${input}`, that would just be the value already in variable `input` The magic is in those two commas `,,`. A `,` operator after the variable name downcases the first letter of the variable and leaves the rest of the value unchanged. The double-comma `,,` operator after the variable downcases every character in the value.

- You can use `^` and `^^` for uppercasing.
- You could have done the same in a single line with `input="${*,,}"`

I ran the `tr` version as written above 1000 times and a "pure" Bash equivalent The `tr` version took 4.1 sec versus "pure" Bash's 0.04 sec (100 X faster). 

See: https://gist.github.com/cfraizer/8f17c375837f6d904bcafd3adaa8466d for the code.

## Parameter   What does it do?

```bash
${VAR^}     # Uppercase first character.
${VAR^^}    # Uppercase all characters.
${VAR,}     # Lowercase first character.
${VAR,,}    # Lowercase all characters.
${VAR~}     # Reverse case of first character.
${VAR~~}    # Reverse case of all characters.
```

```bash
#!/usr/bin/env bash

foo() {
  local value="The Quick Brown FOX Jumped over The Lazy Dog."

  local -i loopCount=1000
  local -i i=0
  for (( i = 0; i < loopCount; ++i )); do
    local newVal=""
    newVal="${value,}"
    printf "%s\n" "$newVal"
  done
}


bar() {
  local value="The Quick Brown FOX Jumped over The Lazy Dog."

  local -i loopCount=1000
  local -i i=0
  for (( i = 0; i < loopCount; ++i )); do
    # shellcheck disable=SC2155
    local newVal=$(echo "$value" | tr '[:upper:]' '[:lower:]')
    printf "%s\n" "$newVal"
  done
}

baz() {
  local value="$*"

  printf "%s\n" "${value,,}"
}

foo
bar
baz

# Lower Case Conversion
lower() {
    # Usage: lower "string"
    printf '%s\n' "${1,,}"
}
# Upper Case Conversion
upper() {
    # Usage: upper "string"
    printf '%s\n' "${1^^}"
}
# Reverse Case Conversion
reverse_case() {
    # Usage: reverse_case "string"
    printf '%s\n' "${1~~}"
}
```

# Documentation

[pure bash bible](https://github.com/dylanaraps/pure-bash-bible)
