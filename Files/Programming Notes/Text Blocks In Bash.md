Tags: 
References: 
Links: [[Bash|Bash]]

---

# Text Blocks In Bash

You can have blocks of formatted text in a script for use such as a help menu If you want some of the text to be dynamic you will need to wrap it in double quote. Also echo CAN work for this but its just better to use `cat` or `printf`


```bash
cat <<EOF
Hello world
How's it going?
EOF
# Or use printf (also efficient, printf is built-in):
printf %s "\
Hello world
How's it going?
"
```

# Documentation

<https://mywiki.wooledge.org/BashPitfalls>
