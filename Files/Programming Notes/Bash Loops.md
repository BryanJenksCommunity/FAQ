Tags: 
References: 
Links: [[Bash|Bash]]

---

# Loops In Bash

For looping over all positional arguments / words sent to the command you can use the following:

```bash
for arg in "$@"
# Or simply:
for arg
```

Since looping over the positional parameters is such a common thing to do in
scripts, for arg defaults to for arg in `"$@"`. The double-quoted `"$@"` is
special magic that causes each parameter to be used as a single word (or a
single loop iteration). It's what you should be using at least 99% of the time.

```bash
# Correct version

for x in "$@"; do
  echo "parameter: '$x'"
done

# or better:

for x do
  echo "parameter: '$x'"
done

$ ./myscript 'arg 1' arg2 arg3

#> parameter: 'arg 1'
#> parameter: 'arg2'
#> parameter: 'arg3'
```

---
```bash
do [command list]; done
```

This constitutes the actual loop that is used by the next few commands.
The list of commands between the do and done are the commands that will be executed in every iteration of the loop.

```bash
for [name] in [words]
```

The next loop will iterate over each WORD after the in keyword.
The loop's commands will be executed with the value of the variable denoted by name set to the word.

```bash
for (( [arithmetic expression]; [arithmetic expression]; [arithmetic expression] ))
```

The next loop will run as long as the second arithmetic expression remains true.
The first arithmetic expression will be run before the loop starts. The third arithmetic expression will be run after the last command in each iteration has been executed.

```bash
while [command list]
```

The next loop will be repeated for as long as the last command ran in the command list exits successfully.

```bash
until [command list]
```

The next loop will be repeated for as long as the last command ran in the command list exits unsuccessfully ("fails").

```bash
select [name] in [words]
```

The next loop will repeat forever, letting the user choose between the given words.


The iteration's commands are executed with the variable denoted by name's value set to the word chosen by the user. Naturally, you can use break to end this loop.

# Documentation

<https://mywiki.wooledge.org/BashPitfalls>
