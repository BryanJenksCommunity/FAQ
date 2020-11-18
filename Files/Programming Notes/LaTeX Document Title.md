Tags: 
References: 
Links: [[LaTeX|LaTeX]]

---

# LaTeX Document Title

## Title

`\title{My {\LaTeX} R\'esum\'e}`

your title is defined in the title command but this is outsize of your document body, inside the document body you actually call:

`\maketitle`

to render your title onto the document

you can customize the title with the [[LaTeX Titling|titling]] package and the renewcommand command like so:

```latex
\renewcommand{\maketitle}{
\begin{center}
{\huge\bfseries
\theauthor}
\vspace{.25em}

BryanJenks@protonmail.com --- https://www.bryanjenks.xyz

\end{center}
} % first new arg from titling package
```

## Title Spacing

\\titlespacing*{command}
{left}
{before-sep}
{after-sep}[right-sep]

### Examples

```latex
\titlespacing{\subsubsection}
{0em} % Left Margin
{.25em} % Line Spacing
{0em} % Right Margin
```

## Title Format

\\titleformat{\<command\>}[\<shape\>]
{\<format\>}
{\<label\>}
{\<sep\>} <!-- The Only required Arg -->
{\<before-codee\>}[\<after-code\>]

### Examples

```latex
\titleformat{\section}[frame]
{\huge}
{}
{.25em} % The only required argument
{\filcenter\bfseries\lowercase}% Horizontal line [\titlerule] % Optional param

% SubSection Formatting
\titleformat{\subsection}
{\bfseries\Large}
{\hspace{-.25in}$\bullet$}
{.3em}
{}

% SubSubSection Formatting
\titleformat{\subsubsection}[runin] % Optional param
{\bfseries}
{}
{0em}
{}[---]

\titleformat{\section}[frame]
{\normalfont}
{\filright\footnotesize\enspace SECTION \thesection\enspace}
{8pt}
{\Large\bfseries\filcenter}
```\

# Documentation

- [titlesec](https://mirrors.concertpass.com/tex-archive/macros/latex/contrib/titlesec/titlesec.pdf)
