# thesis-template

You’re a graduate student preparing to write your thesis or dissertation. You'd like to start writing up your amazing research results, but first there's the small matter of your university's style requirements.

This project provides LaTeX classes that do most of that formatting work for you. It is intended to be easy to use and easy to maintain, so you don't have to be a TeX genius to make those small changes your supervisor asks for.

This project is primarily aimed at graduate students at Simon Fraser University. If you go to the University of Victoria, you might want to check out a [different template](https://github.com/rchurchley/uvic-thesis) based on my master's thesis there.


## System Requirements

You will need a relatively recent LaTeX distribution. In particular, the SFU template depends on the following (standard) packages:

- `etoolbox` for class options
- `lmodern` and `fontenc` for extended fonts
- `geometry` to set margins
- `setspace` for line spacing
- `pdfpages` to include Declaration of Partial Copyright Licence form
- `tocloft` to make the ToC nicer
- `appendix` to add the word "Appendix" to the Table of Contents

If you do not have these installed, you can easily get them using the package manager that came with your distribution (`tlmgr` in TeX Live or its GUI frontend `TeX Live Utility` on OS X; `mpm` on Windows MikTeX installations).


## Installation

1. [Download all of the project's files][1] and move the files appropriate to your university to the (same) folder of your choice.

2. Rename `template.tex` to something more suitable.

3. Delete the main content and replace it with your own.

4. Compile it!


## Contributing

If you find you have to make any changes to these templates, either because it doesn't compile on your system or because your university's requirements have changed, please email me at `rchurchl@sfu.ca` so other people can benefit.

If you have a GitHub account, you can [open an issue][newissue] to report a bug or suggest an enhancement.


## Changelog

**6 Feb 2015:** Many bugfixes and improvements, but also a few compatibility-breaking changes:

- All font class options except for `serif` are removed. Users may now safely change fonts to their hearts' content in their own preamble.
- `\committee` now only takes one argument. Users who need to change the committee type from "Examining Committee" to "Supervisory Committee" may now use the `undefended` class option.
- `\defended` and `\approved` are removed. Users should now set the date of defence or approval with `\date` and use the `undefended` class option if applicable.
- Users are now required to download their own copy of the Declaration of Partial Copyright License form, in case it changes in the future.

[1]: https://github.com/rchurchley/thesis-template/archive/master.zip
[newissue]: https://github.com/rchurchley/thesis-template/issues/new
