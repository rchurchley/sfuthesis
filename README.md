# thesis-template

You’re a graduate student preparing to write your thesis or dissertation. You'd like to start writing up your amazing research results, but first there's the small matter of your university's style requirements.

This project provides LaTeX classes that do most of that formatting work for you. It is intended to be easy to use and easy to maintain, so you don't have to be a TeX genius to make those small changes your supervisor asks for.

The following universities are currently supported:

- University of Victoria
- Simon Fraser University


## System Requirements

You will need a relatively recent LaTeX distribution. In particular, the SFU template requires the following packages and their dependencies:

- `etoolbox` used for class options
- `setspace` used in line spacing
- `enumitem` used for approval page
- `pdfpages` used for including Declaration of Partial Copyright Licence form
- `tocloft` used for making the ToC nicer
- `appendix` to add the word "Appendix" to the Table of Contents
- `cmbright`, `lmodern`, or `tgheros` fonts, depending on class options

If you do not have these installed, you can easily get them using the package manager that came with your distribution (`tlmgr` in TeX Live or its GUI frontend `TeX Live Utility` on OS X; `mpm` on Windows MikTeX installations).


## Installation

1. [Download all of the project's files][1] and move the files appropriate to your university to the (same) folder of your choice.

2. Rename `template.tex` to something more suitable.

3. Delete the main content and replace it with your own.

4. Compile it!


## Contributing

If you find you have to make any changes to these templates, either because it doesn't compile on your system or because your university's requirements have changed, please email me at `ross@rosschurchley.com` so other people can benefit.

If you're into git, then you can also contribute your own fixes and enhancements by doing the following:

1. Fork the plugin repository.
2. Hack on a separate topic branch created from the latest master.
3. Commit and push the topic branch.
4. Make a pull request.

[1]: https://github.com/rchurchley/thesis-template/archive/master.zip
