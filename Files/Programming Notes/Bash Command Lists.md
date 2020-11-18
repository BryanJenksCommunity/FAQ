Command Lists
`{ [command list]; }`

Execute the list of commands in the current shell as though they were one command.

Command grouping on its own isn't very useful. However, it comes into play wherever Bash syntax accepts only one command while you need to execute multiple. 

For example, you may want to pass output of multiple commands via a pipe to another command's input:
```bash
{ ls .; ls ..; } | grep file-name
```

Or you may want to execute multiple commands after a || operator:

```bash
rm file || { echo "Removal failed, aborting."; exit 1; }
```

It is also used for [[Bash Functions|function]] bodies. Technically, this can also be used for loop bodies though this is undocumented, not portable and we normally prefer `do ...; done` for this):

```bash
for digit in 1 9 7; { echo "$digit"; }       # non-portable, undocumented, unsupported

for digit in 1 9 7; do echo "$digit"; done   # preferred
```

**\*Note**: You need a `;` before the closing `}` (or it must be on a new line).

Command Lists are similar but not identical to [[Bash Command Substitution]]

---
Tags: 

Links: 
	[[Bash]]
References: 
	[[Bash Functions]]
