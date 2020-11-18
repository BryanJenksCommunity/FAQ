Tags: ,  
References: 
Links: [[LaTeX|LaTeX]]

---

# BibLaTeX 

Use the package via:

`\usepackage[backend=biber, style=authoryear-icomp]{biblatex}`
`\addbibresource{<file path to .bib file>}`

To print our your bibliography:

`\printbibliography`

`\textcite{<ref>}` will add a reference like _Mould [1]_ but 'Mould' would be the name of the ref you passed in and it has that number but adding `style=authoryear-icomp` to the biblatex package optional arg will change it to _Mould (2003)_ with no brackets and numbers

`\parencite{<ref>}` is what I typically like and use and appears like _(Mould 2003)_

## Documentation

- [OverleafOnBiber](https://www.overleaf.com/learn/latex/Bibliography_management_with_bibtex)

---

- address
- annote
- author
    - booktitle
    - chapter
    - crossref
    - edition
    - editor
    - institution
    - journal
    - key
    - month
    - note
    - number
    - organization
    - pages
- publisher
    - school
    - series
- title
    - type
    - volume
- year
- URL
- ISBN
    - ISSN
    - LCCN
    - abstract
    - keywords
    - price
    - copyright
    - language
    - contents

### Notes

This package is used for references and bibliographies

#### Reference guide

##### Standard entry types

*article*
- _Article from a magazine or journal_

*booklet*
- _A work that is printed but have no publisher or sponsoring institution_

*conference*
- _An article in a conference proceedings_

*inbook*
- _A part of a book (section, chapter and so on)_

*incollection*
- _A part of a book having its own title_
	
*inproceedings*
- _An article in a conference proceedings_
	
*manual*
- _Technical documentation_

*masterthesis*
- _A Master's thesis_

*misc*
- _Something that doesn't fit in any other type_

*phdthesis*
- _A PhD thesis_

*proceedings*
- _The same as conference_

*techreport*
- _Report published by an institution_

*unpublished*
- _Document not formally published, with author and title_
