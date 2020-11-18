Tags: 
References: 
Links: [[LaTeX|LaTeX]]

---

# LaTeX Graphix

- [Documentation](http://texdoc.net/texmf-dist/doc/latex/graphics/graphicx.pdf)

he `\includegraphics{}` command is used to add images to a document and can take several optional parameters in square brackets as well an example of this function is:

`\includegraphics[width=3in,height=5in,keepaspectratio,scale=0.5]{<path to image file.png>}`

## Params

*width*: Obvious
    - `width=\textwidth`: it will fit in within the span of a line of text or `width=0.5\textwidth` to fit it in 50% of the space of the width of your text span
*height*: Obvious
*keepaspectratio*: uses width and height as maximum value args and make image keep its aspect ration
*scale*: basically like saying the image should be a percentage of its original size so using a decimal like `scale=0.5` for 50% scale
*angle*: this will rotate the image and uses a 360 degree number for the angle of rotation

and to take an image and center it we can add it to the center environment


`\begin{center}`
    `\includegraphics[width=3in]{<path to image file.png>}`
`\end{center}`

to center a figure you can use this example:

```latex
\begin{figure}
    \begin{center}
        \includegraphics[width=0.3\textwidth]{../Pictures/archLinuxLogo.png}
    \end{center}
\end{figure}
```

Figures are more flexible and they come with added bonuses like captions and automatic numbering which you can add or mess with this way


```latex
\begin{figure}
    \begin{center}
        \includegraphics[width=0.3\textwidth]{../Pictures/archLinuxLogo.png}
        \caption{this is my caption}
    \end{center}
\end{figure}
```


to center a figure you can also use the following command `\centering` with the figure code block

```latex
\begin{figure}
    \centering
        \includegraphics[width=0.3\textwidth]{../Pictures/archLinuxLogo.png}
        \caption{this is my caption}
\end{figure}
```

to keep a figure inline where you write it in you need to pass an optional arg to the figure command `[h]`

```latex
\begin{figure}[h]
    \centering
        \includegraphics[width=0.3\textwidth]{../Pictures/archLinuxLogo.png}
        \caption{this is my caption}
\end{figure}
```

the optional arg `[t]` will put the figure at the top of the page

`\begin{figure}[t]`

and `[b]` will put it at the bottom

and `[p]` will put it on a page of its own
