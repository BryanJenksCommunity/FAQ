Tags: 
References: 
Links: [[LaTeX|LaTeX]]

---

# LaTeX Beamer

## Frame Title

Inside the frame environment you run this command to give your slide a title

```latex
\begin{frame}
    \frametitle{Roadmap}
\end{frame}
```

## Pauses

For your slides to pause on say a list populating on the screen use pause to control it

```latex
	\begin{itemize}
		\item frame\pause
		\item beamer themes\pause
		\item pauses and slides\pause
		\item sections\pause
		\item images
		\item columns
	\end{itemize}
```

## Sections

in beamer the `\section{<section name>}` command will appear at the top of the slide deck slides and it also like a hyper link and they are evenly distributed spatially too.



# Documentation

- [theme gallery](http://deic.uab.es/~iblanes/beamer_gallery/index_by_theme.html)
