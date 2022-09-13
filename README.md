# sfuthesis

The `sfuthesis` project provides a template from which graduate students at Simon Fraser University can start writing their thesis.

The LaTeX class file `sfuthesis.cls` sets your document to follow the SFU Library's style requirements, so you can focus on writing up your research instead of fiddling with formatting.

As of Fall 2020, the SFU Library has approved the 2.3.0 release of `sfuthesis` to replace any older thesis templates.

Before you submit your thesis, please make sure to **double-check all style requirements** on the [SFU Library website](http://www.lib.sfu.ca/help/publish/thesis).
There are several standards (e.g. abstract word limits) that LaTeX cannot automatically arrange for you, and you are ultimately responsible for making sure that your thesis conforms to the regulations set out by the library.



## System requirements

To use the SFU LaTeX thesis class, you will need a relatively recent LaTeX distribution. (For information on how to install one, see the [LaTeX Project website](http://latex-project.org/ftp.html).)
In particular, it depends on the following (standard) packages:

- `appendix` to add the word "Appendix" to the Table of Contents
- `etoolbox` for class options
- `geometry` to set margins
- `lmodern` and `fontenc` for extended fonts
- `nowidow` to prevent nearly-empty pages
- `setspace` for line spacing
- `tocloft` to make the ToC nicer

If you do not already have these installed, you can easily get them using the package manager that came with your distribution (`tlmgr` in TeX Live or its GUI frontend `TeX Live Utility` on OS X; `mpm` on Windows MikTeX installations).


## Installation

1. Download the project files to your computer.

2. Rename `template.tex` to something more suitable, like `thesis.tex`. Delete the placeholder information and replace it with your own.

3. You may copy `sfuthesis.cls` to any folder in your `TEXPATH`. If you don't know what this means, make sure that `sfuthesis.cls` stays in the same folder as your thesis's main file.

4. Compile your main thesis file with your favourite [LaTeX editor][editors] or from the command line using [`latexmk`][latexmk]:

```
latexmk -pdf thesis.tex
```


## Usage

To get started writing your thesis, just follow the installation instructions above and replace the sample content in `template.tex` with your own!


### Including an Ethics Statement

If your research requires an Ethics Statement, you will need to [download a PDF copy of the statement][ethics] and include it immediately after the Declaration of Committee page.

```latex
\usepackage{pdfpages}

...

\addtoToC{Ethics Statement}%
\includepdf[pagecommand={\thispagestyle{plain}}]{ethicsstatement.pdf}%
\clearpage
```

The SFU Library has moved to digital-only thesis submission and no longer requires print copies of theses be submitted. However, if you do want to print your thesis, you can use the `bound` or `twoside` options to set margins for book binding.



## Contributing

The `sfuthesis` class is written such that it should not be necessary to edit `sfuthesis.cls` itself.
If you find you have to do so in order to make your thesis compile or to fix a display bug, please let me know by:

- emailing `ross@rosschurchley.com`, or
- [filing an issue][newissue] if you have a GitHub account, or
- issuing a pull request if you have a GitHub account and a bugfix.

[download]: https://github.com/rchurchley/thesis-template/archive/master.zip
[editors]: http://en.wikipedia.org/wiki/Comparison_of_TeX_editors
[newissue]: https://github.com/rchurchley/sfuthesis/issues/new
[latexmk]: http://ctan.math.ca/tex-archive/support/latexmk/latexmk.pdf
[ethics]: http://www.lib.sfu.ca/help/publish/thesis/regulations#ethics-statement
