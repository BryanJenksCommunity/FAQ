Tags: 
References: 
Links: [[LaTeX|LaTeX]]

---

# LaTeX Document Draft Watermark

<https://tex.stackexchange.com/questions/118939/add-watermark-that-overlays-the-images>

Figures overlay the watermark:

```latex
\documentclass{article}
\usepackage[printwatermark]{xwatermark}
\usepackage{xcolor}
\usepackage{graphicx}
\usepackage{lipsum}

\newwatermark[allpages,color=red!50,angle=45,scale=3,xpos=0,ypos=0]{DRAFT}

\begin{document}

\lipsum[1-2]
\begin{figure}[!ht]
\centering
\includegraphics[width=3cm]{example-image-a}
\end{figure}
\lipsum[1-2]
\end{document}
```

Figures covered by watermark:

```latex
\documentclass{article}
\usepackage[printwatermark]{xwatermark}
\usepackage{xcolor}
\usepackage{graphicx}
\usepackage{lipsum}

\newwatermark*[allpages,color=red!50,angle=45,scale=3,xpos=0,ypos=0]{DRAFT}

\begin{document}

\lipsum[1-2]
\begin{figure}[!ht]
\centering
\includegraphics[width=3cm]{example-image-a}
\end{figure}
\lipsum[1-2]
\end{document}
```
