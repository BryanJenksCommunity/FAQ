Tags: ,  
References: 
Links: [[LaTeX|LaTeX]]

---

# LaTeX Custom Commands

To create a new command that provides new behavior or functionality use the `\newcommand` command

```latex
\newcommand{<your commands name>}[<number of arguments it takes>]
{what your command does}
```

```latex
\newcommand{\bryan}[3]{\textit{#1}, \textbf{#2}, \underline{#3}}
```
