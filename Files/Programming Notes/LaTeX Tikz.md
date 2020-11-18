Tags: 
References: [[Flow Charts With Mermaid]]
Links: [[LaTeX|LaTeX]]

---

#  LaTeX Tikz


## Flow Chart

```latex
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Welcome to Overleaf --- just edit your LaTeX on the left,
% and we'll compile it for you on the right. If you open the
% 'Share' menu, you can invite other users to edit at the same
% time. See www.overleaf.com/learn for more info. Enjoy!
%
% Note: you can export the pdf to see the result at full
% resolution.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Decision tree
% Author: Stefan Kottwitz
% https://www.packtpub.om/hardware-and-creative/latex-cookbook
\documentclass[border=10pt]{standalone}
%%%<
\usepackage{verbatim}
%%%>
\begin{comment}
:Title: Decision tree
:Tags: Trees;Cookbook
:Author: Stefan Kottwitz
:Slug: decision-tree

A horizontal tree, growing to the right.
I created a basic style for tree nodes, and
derived styles for specific kinds of nodes.
\end{comment}

\usepackage{tikz}
\tikzset{
  treenode/.style = {shape=rectangle, rounded corners,
                     draw, align=center,
                     top color=white, bottom color=blue!20},
  root/.style     = {treenode, font=\Large, bottom color=red!30},
  env/.style      = {treenode, font=\ttfamily\normalsize},
  dummy/.style    = {circle,draw}
}
\begin{document}
\begin{tikzpicture}
  [
    grow                    = right,
    sibling distance        = 6em,
    level distance          = 10em,
    edge from parent/.style = {draw, -latex},
    every node/.style       = {font=\footnotesize},
    sloped
  ]
  \node [root] {Formula}
    child { node [env] {equation}
      edge from parent node [below] {single-line?} }
    child { node [dummy] {}
      child { node [dummy] {}
        child { node [env] {align\\flalign}
          edge from parent node [below] {at relation sign?} }
        child { node [env] {alignat}
          edge from parent node [above] {at several}
                           node [below] {places?} }
        child { node [env] {gather}
                edge from parent node [above] {centered?} }
        edge from parent node [below] {aligned?} }
      child { node [env] {multline}
              edge from parent node [above, align=center]
                {first left,\\centered,}
              node [below] {last right}}
              edge from parent node [above] {multi-line?} };
\end{tikzpicture}
\end{document}
```

```latex
\usepackage{tikz}
\usetikzlibrary{shapes.geometric, arrows}


    \tikzstyle{startstop} = [rectangle, rounded corners, minimum width=3cm, minimum height=1cm, text centered, draw=black, fill=red!30]
    \tikzstyle{io} = [trapezium, trapezium left angle=70, trapezium right angle=110, minimum width=3cm, minimum height=1cm, text centered, draw=black, fill=blue!30]
    \tikzstyle{process} = [rectangle, text width=3cm, minimum width=3cm, minimum height=1cm, text centered, draw=black, fill=orange!30]
    \tikzstyle{decision} = [diamond, minimum width=3cm, minimum height=1cm, text centered, draw=black, fill=green!30]
    \tikzstyle{arrow} = [thick,->,>=stealth]


    \begin{tikzpicture}[node distance=2cm]
        \node (start) [startstop] {start};
        \node (in1) [io, below of=start] {Input};
        \node (pro1) [process, below of=in1] {Process 1};
        \node (dec1) [decision, below of=pro1, yshift=-0.5cm] {Decision 1};
        \node (pro2a) [process, below of=dec1, yshift=-0.5cm] {Process 2a};
        \node (pro2b) [process, right of=dec1, xshift=2cm] {Process 2b};
        \node (out1) [io, below of=pro2a] {Output};
        \node (stop) [startstop, below of=out1] {See Step \textbf{\ref{test}}};

        \draw [arrow] (start) -- (in1);
        \draw [arrow] (in1) -- (pro1);
        \draw [arrow] (pro1) -- (dec1);
        \draw [arrow] (dec1) -- node[anchor=east] {yes} (pro2a);
        \draw [arrow] (dec1) -- node[anchor=south] {no} (pro2b);
        \draw [arrow] (pro2b) |- (pro1);
        \draw [arrow] (pro2a) -- (out1);
        \draw [arrow] (out1) -- (stop);
    \end{tikzpicture}
```

# Documentation

- [Tikz Documentations](http://texdoc.net/texmf-dist/doc/generic/pgf/pgfmanual.pdf)
- [Short Intro To Tikz](https://cremeronline.com/LaTeX/minimaltikz.pdf)-
