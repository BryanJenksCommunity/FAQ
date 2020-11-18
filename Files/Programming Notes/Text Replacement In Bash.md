Tags: 
References: 
Links: [[Bash|Bash]]

---

# Text Replacement In Bash

Bash tip: instead of spawning an instance of `sed`, you can do text replacement in "pure" Bash like `status="${status//,/}"`. Breaking that down:

- `status=`   # assign a new value to the Bash variable `status`.
- `status="${ … }"` # I just always use double quotes when doing parameter (and command) substitution.
- `status="${status … }"` # the new value I am assigning to `status` is the expansion of (value of) `status`, BUT first we alter that value…
- `status="${status//PATTERN/STRING}"` # the `//` means "globally replace" (a single `/` would replace the first occurrence of PATTERN)

```bash
status="${status//,/}"
status="${status//PATTERN/STRING}"

firstString="I love Suzi and Marry, but Suzi Most"
secondString="Sara"
echo "${firstString/Suzi/$secondString}"    # prints 'I love Sara and Marry'
```

# Documentation

[pure bash bible](https://github.com/dylanaraps/pure-bash-bible
