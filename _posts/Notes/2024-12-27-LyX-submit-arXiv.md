---
title: Submit LyX file to arXiv
author: cotes
date: 2024-12-27 14:10:00 +0800
categories: [Notes, Tex]
tags: [tex]
render_with_liquid: false
---
## Submit lyx file to arXiv
### Procedure
1. LyX --> File --> Export --> LaTex(pdflatex)
2. compile `.tex` file
    ```bash
    pdflatex <filename>.tex # generate .aux file
    bibtex <filename>.aux # generate .bbl file
    ```
3. Upload `.aux` and `.bbl` file:  
    The multi-layer path needs to be modified into a single layer like below:

    `begin{figure}includegraphics[width=0.45\textwidth]{Images/77873}\includegraphics[width=0.45\textwidth]{Images/78461}`  
    to:  
    `begin{figure}includegraphics[width=0.45\textwidth]{Images/77873}\includegraphics[width=0.45\textwidth]{78461}`
### Notes
- For using non-standard templates such as IOP, nature templates, etc. you need to include the template file.
- If you modify the tex file, it is best to delete all auxiliary files and upload it again.