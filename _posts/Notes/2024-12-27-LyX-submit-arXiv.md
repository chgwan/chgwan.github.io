---
title: Submit LyX file to arXiv
author: chgwan
# date: 2024-12-27 14:10:00 +0800
categories: [Notes, Tex]
tags: [Note, Tex]
render_with_liquid: false
media_subpath: "/assets/img/commons"
---
## Submit a LyX File to arXiv
### Previous Procedure
1. In LyX, go to `File -> Export -> LaTeX (pdflatex)`.
2. Compile the `.tex` file:
    ```bash
    pdflatex <filename>.tex # generate .aux file
    bibtex <filename>.aux # generate .bbl file
    ```
3. Upload the `.aux` and `.bbl` files.  
    If image paths contain multiple directory levels, modify them to a single level as shown below:
    `begin{figure}includegraphics[width=0.45\textwidth]{Images/77873}\includegraphics[width=0.45\textwidth]{Images/78461}`  
    to:  
    `begin{figure}includegraphics[width=0.45\textwidth]{Images/77873}\includegraphics[width=0.45\textwidth]{78461}`

### Updated Procedure (2026-02-22)
1. Press `Ctrl+R` to preview the PDF.
2. Resolve all errors.
3. Click the displayed PDF, then open the temporary output folder.
![lyx_temp_folder](lyx_temp_folder.png)
_LyX temporary folder used for PDF preview_
4. Copy the folder contents.
5. Compress the folder into a `.zip` file, then upload it to arXiv.

### Common Notes
- If you use non-standard templates (e.g., IOP, Nature), include all required template files.
- If you modify the `.tex` file, it is best to delete all auxiliary files and re-upload the package.
