%   Copyright (C) 2014--2015 Ross Churchley
%
%   License
%   =======
%
%   This work may be distributed and/or modified under the conditions of
%   the LaTeX Project Public License, either version 1.3 of this license
%   or (at your option) any later version. The latest version of this
%   license is in:
%
%      http://www.latex-project.org/lppl.txt
%
%   and version 1.3 or later is part of all distributions of LaTeX version
%   2005/12/01 or later.
%
%   This work has the LPPL maintenance status `maintained'. The Current
%   Maintainer is Ross Churchley.
%
%
%   Contributors
%   ============
%
%   The previous thesis template, `csthesis`, was written by Stephen Chan based
%   on Stanford's PhD thesis style.
%
%       Stephen Chan        (1989)
%       Margaret Sharon     (1996)
%       Pepe Kubon          (1997--98)
%       Greg Baker          (2003--06)
%       Chris McIntosh      (2011)
%       Bradley Coleman     (2012)
%       Juan Galvez         (2012)
%       Firuz Demir         (2013)
%       Ahmed Saad          (2013)
%       Reynaldo Arteaga    (2014)
%
%   In 2015, the old template was retired and replaced by a new class,
%   `sfuthesis`, written by Ross Churchley.
%
%       Ross Churchley      (2015)
%
%
%   Note to future contributors
%   ===========================
%
%   When writing this class, we incorporated many lessons learned from the long
%   history of the previous template. We hope to preserve some of those lessons
%   here to explain some of our choices and to help inform your contributions.
%
%   - This class, unlike most LaTeX bundles, is not distributed as a .dtx file.
%     The previous template was, for a time, but as of 2014 the .dtx file was
%     several years out of date. As future contributions to this class will
%     likely come from users who have directly modified this class file to suit
%     their needs, we have decided not to bother with the overhead of managing
%     the .dtx.
%
%   - The old template contained a considerable amount of vestigial plain TeX;
%     later contributors preferred to append to the template, understandably
%     not wanting to mess with decades-old unfamiliar code. This class has been
%     written with readability in mind: we use indentation, spacing, verbose
%     macro names, and comments to document our code. Where possible, we
%     prefer using LaTeX and etoolbox macros over plain TeX.
%
%   - This class also includes basic standard packages like `geometry` and
%     `setspace` to improve its readability and maintainability. (Almost fifty
%     lines of the old template could be replaced by two RequirePackages!)
%     But we have endeavored to keep the dependencies to a minimum in order to
%     reduce potential incompatabilities with user-loaded packages.
%
%
%   Dependencies
%   ============
%
%   This class uses the following external packages:
%
%   `appendix` to add the word "Appendix" to the Table of Contents
%   `etoolbox` used for class options
%   `fontenc` used to improve accented character output
%   `geometry` used for Margins
%   `lmodern` used for Fonts
%   `nowidow` used to prevent nearly-empty pages
%   `setspace` used for Line Spacing
%   `tocloft` used for making the ToC nicer
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sfuthesis}[2017/01/01 v2.2.0 SFU Thesis/Dissertation Template]


%   CLASS OPTIONS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   The library requires a slightly different approval page format if the
%   thesis is accepted without a defence taking place. If this applies to you,
%   use the `undefended` class option to format the approval page correctly.
%
%   The SFU Library has moved to digital-only thesis submission and no longer
%   requires print copies of theses be submitted. However, if you do want to
%   print your thesis, you can use the `bound` or `twoside` option to set
%   margins for book binding.
%

\RequirePackage{etoolbox}
\newtoggle{undefended}
\newtoggle{bound}

\DeclareOption{undefended}{\toggletrue{undefended}}
\DeclareOption{bound}{\toggletrue{bound}}
\DeclareOption{twoside}{\toggletrue{bound}}

\iftoggle{bound}{
    \PassOptionsToClass{twoside}{book}
}{%else
    \PassOptionsToClass{oneside}{book}
}

\PassOptionsToClass{11pt}{book}


%   BASE CLASS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   sfuthesis.cls is based on the standard `book` document class.
%   For more information (including standard class options), see
%   http://texdoc.net/texmf-dist/doc/latex/base/classes.pdf
%   or type `texdoc book` on the command line.
%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions
\LoadClass{book}


%   FONTS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Use the Latin Modern implementation of Computer Modern, for better support
%   of diacritics and non-English glyphs, including correct PDF search.
%   The fontenc package ensures proper hyphenation of accented words.
%

\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}


%   MARGINS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Sets the margins to 1.25" on the left and right, 1" on the top, and
%   0.7" from the bottom to the page numbers. Invoking the `twoside` option
%   will bypass this and allow margins be set by the underlying book class.
%

\RequirePackage{geometry}[2010/09/12]
\nottoggle{bound}{%
    \newgeometry{
        top=1in,
        left=1.25in,
        bottom=0.7in,
        right=1.25in,
        includefoot   % ensure page numbers do not extend into margins
    }
}


%   LINE SPACING  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   (1) Sets 1.5 line spacing for the document body, excluding figures, tables,
%   and other floats, which remain single-spaced.
%
%   (2) Provides a command to set single-spacing for chapter and section titles
%       as well as the whole "backmatter" (references, bibliography, and any
%       appendices). It would make more sense if we defined \smallspacing to be
%       just \singlespacing, but it's a bit quirky; the setspace package source
%       code has:
%
%           \newcommand{\singlespacing}{%
%               \setstretch {\setspace@singlespace}%  normally 1
%               \vskip \baselineskip  % Correction for coming into singlespace
%           }
%
%       In our use case, we most commonly go in and out of single-spacing in
%       chapter and section titles, and the extra \vskip\baselineskip is
%       extremely noticible (as it's based on font size). We avoid this problem
%       by defining \smallspacing as the portion of \singlespacing we actually
%       need.
%

\RequirePackage{setspace}
\newcommand{\defaultspacing}{\onehalfspacing} % (1)
\newcommand{\smallspacing}{\setstretch{\setspace@singlespace}}  % (2)
\renewcommand{\backmatter}{%
  \renewcommand{\defaultspacing}{\smallspacing}%
  \clearpage%
}

\defaultspacing

%   Set single-spacing for chapter and section titles. If you use a package
%   (e.g. titlesec) that redefines the chapter- and section-printing macros,
%   you will have to adjust the spacing yourself.
%

\pretocmd{\@chapter}{\smallspacing}{}{}
\apptocmd{\@chapter}{\defaultspacing}{}{}

\pretocmd{\@schapter}{\smallspacing}{}{}
\apptocmd{\@schapter}{\defaultspacing}{}{}

\pretocmd{\@sect}{\smallspacing}{}{}
\apptocmd{\@sect}{\defaultspacing}{}{}

\pretocmd{\@ssect}{\smallspacing}{}{}
\apptocmd{\@ssect}{\defaultspacing}{}{}


%   FOOTNOTES  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Remove the dividing line between body text and footnotes, replacing it with
%   extra space. This is not formally part of the Library requirements, but
%   makes our footnotes consistent with the preferred style in the official
%   Word thesis template. We then add a full line space between footnotes on
%   the same page; this is also not an official requirement but was suggested
%   as a reasonable default by the Library's Thesis Assistant and the
%   footnote-heavy Chicago style.
%

\def\footnoterule{\relax}
\setlength{\skip\footins}{\baselineskip}
\setlength{\footnotesep}{\baselineskip}

%   PAGINATION  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Provides commands to set page numbers in roman numerals for preliminary
%   pages (frontmatter) and arabic numbers for all other content (mainmatter).
%   \pagestyle{plain} sets page numbers in the bottom center.
%

\pagestyle{plain}

\apptocmd{\frontmatter}{%
    \pagenumbering{roman}
}

\apptocmd{\mainmatter}{%
    \pagenumbering{arabic}
}


%   WIDOWS AND ORPHANS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Prevents LaTeX's page-breaking algorithm from interrupting paragraphs or
%   creating nearly-empty pages.
%

\RequirePackage[all]{nowidow}


%   TITLE PAGE  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Generates a correctly-formatted title page, provided the following
%   information is given in the preamble:
%
%   \title{...}
%   \author{...}
%   \previousdegrees{...}
%   \thesistype{...}
%   \degree{...}
%   \discipline{...} (optional)
%   \department{...}
%   \faculty{...}
%   \semester{...}
%   \copyrightyear{...}
%
%   The ``all rights reserved'' text may also be overrided with
%   \copyrightnotice{...}
%

\renewcommand{\maketitle}{{%
    \thispagestyle{empty}
                                                            \null\vfill
                    \begin{center}
               {\huge\bfseries\@title\par}                  \vspace{1em}

                          by                                \vspace{1em}

              {\Large\bfseries\@author}                     \vspace{1em}

                  \@previousdegrees
                                                            \vfill

    {\@thesistype} Submitted in Partial Fulfillment of the  \\
              Requirements for the Degree of                \\
                      \@degree                              \vspace{1em}

                       in the                               \\
                    \@department                            \\
                     \@faculty
                                                            \vfill

                     {\bfseries
        \textcopyright\ \@author\ \@copyrightyear           \\
               SIMON FRASER UNIVERSITY                      \\
                     \@semester}                            \vfill

           \smallspacing\@copyrightnotice
                    \end{center}
                                                            \vfill
    \newpage
}}

%   The implementation creates a new "variable" for each metadata needed,
%   initially storing placeholder text and an instruction to throw a warning
%   if the user hasn't provided the correct information. We then define the
%   user-facing commands to set the corresponding variables when called.
%   The copyright notice is set in a minipage to provide an extra margin of
%   0.5" on either side.

\newcommand{\@thesistype}{THESIS \@MissingMetadata{thesistype}}
\newcommand{\@previousdegrees}{PREVIOUS DEGREES \@MissingMetadata{previousdegrees}}
\newcommand{\@degree}{DEGREE \@MissingMetadata{degree}}
\newcommand{\@discipline}{} % optional
\newcommand{\@department}{DEPARTMENT \@MissingMetadata{department}}
\newcommand{\@faculty}{FACULTY \@MissingMetadata{faculty}}
\newcommand{\@semester}{SEMESTER \@MissingMetadata{semester}}
\newcommand{\@copyrightyear}{YEAR \@MissingMetadata{copyrightyear}}
\newcommand{\@copyrightnotice}{%
    \begin{minipage}{\dimexpr\textwidth-1in\relax}
        \small\centering
        Copyright in this work rests with the author. Please ensure that any reproduction or re-use is done in accordance with the relevant national copyright legislation.
    \end{minipage}
}

\newcommand{\@MissingMetadata}[1]{\ClassWarning{sfuthesis}{%
    Missing #1. Set this in the preamble to fix your frontmatter.
}}

\newcommand{\previousdegrees}[1]{\renewcommand{\@previousdegrees}{#1}}
\newcommand{\thesistype}[1]{\renewcommand{\@thesistype}{#1}}
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}
\newcommand{\discipline}[1]{\renewcommand{\@discipline}{(#1)}}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\faculty}[1]{\renewcommand{\@faculty}{#1}}
\newcommand{\semester}[1]{\renewcommand{\@semester}{#1}}
\newcommand{\copyrightyear}[1]{\renewcommand{\@copyrightyear}{#1}}
\newcommand{\copyrightnotice}[1]{%
    \renewcommand{\@copyrightnotice}{%
        \begin{minipage}{\dimexpr\textwidth-1in\relax}
            \small\centering
            #1
        \end{minipage}
    }
}



%   APPROVAL PAGE  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Generates a correctly formatted approval page, provided a commitee is given
%   in the preamble as follows:
%
%   \committee{
%       \chair{Name}{Chair}
%       \member{Name}{Senior Supervisor \\ Title}
%       \member{Name}{Role on Committee \\ Title \\ Affiliation}
%   }
%
%   To display the committee, invoke \makecommittee.
%

\newcommand{\makecommittee}{%
    \addtoToC{Approval}%
    \chapter*{Approval}%
    \smallspacing%
    \@approvallabel{Name:}              \@approvalvalue{\@author}
    \@approvallabel{Degree:}            \@approvalvalue{\@degree\ \@discipline}
    \@approvallabel{Title:}             \@approvalvalue{\@title}
    \@approvallabel{\@committeelabel:}  \@approvalvalue{\@committee}
    \@approvallabel{\@datelabel:}       \@approvalvalue{\@date}
    \newpage
    \defaultspacing
}

%   The Word template uses tab stops to produce a table-like approval page.
%   We reproduce this behaviour in LaTeX with fixed-width minipages.
%   (It would be much easier to do this using a description list modified with
%    the enumitem package. However, this would cause more trouble than it
%    saved: prematurely including the enumitem package here creates a compile
%    error if the user includes the same package with different options.)
%   A bit of fiddling is needed to maintain consistent spacing when an
%   \@approvalvalue minipage contains more than one line: for details, see
%   http://tex.stackexchange.com/questions/34971/

\newcommand{\@approvallabel}[1]{%
    \noindent%
    \begin{minipage}[t]{0.35\textwidth}%
        \raggedright
        \textbf{#1}
    \end{minipage}%
    \ignorespaces%
}

\newcommand{\@approvalvalue}[1]{%
    \begin{minipage}[t]{0.65\textwidth}%
        \raggedright%
        \bfseries%
        #1
        \par\xdef\tpd{\the\prevdepth}
    \end{minipage}
    \bigskip\par\prevdepth\tpd
}

%   Implementation: Have \@committee store the committee, \committee set it,
%   and \chair and \member format its contents. If the thesis is undefended
%   (see class options), the committee and date is labeled differently.

\newcommand{\@committee}{\@MissingMetadata{committee}}
\newcommand{\committee}[1]{\renewcommand{\@committee}{\mdseries#1}}

\newcommand{\chair}[2]{%
    \textbf{Chair:}\quad
    \begin{minipage}[t]{0.8\textwidth}%
        \raggedright
        #1 \newline
        #2
    \end{minipage}%
    \par%
    \vspace{1.5\baselineskip}%
}

\newcommand{\member}[2]{%
    \raggedright
    \textbf{#1} \newline
    #2%
    \par%
    \vspace{\baselineskip}%
}

%   Theses in some degree programs do not require a defence. In these cases,
%   the "Examining Committee" and "Date defended" labels need to be changed.

\newcommand{\@committeelabel}{%
    \iftoggle{undefended}{Supervisory Committee}{Examining Committee}%
}

\newcommand{\@datelabel}{%
    \iftoggle{undefended}{Date Approved}{Date Defended}%
}



%   ABSTRACT AND KEYWORDS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Redefines the abstract environment to set it on its own page together with
%   the keywords. While the abstract should appear in the main document after
%   \makecopyrightdeclaration, keywords should be defined with \keyword{...}
%   in the preamble.
%

\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}
\newcommand{\@keywords}{KEYWORDS \@MissingMetadata{keywords}}

\newenvironment{abstract}{%
    \addtoToC{Abstract}%
    \chapter*{Abstract}%
    \setlength{\parindent}{0pt}%
    \setlength{\parskip}{5pt}%
}{%
    \leavevmode\\[5pt]
    \noindent\textbf{Keywords:} \@keywords
    \newpage
}


%   TABLE OF CONTENTS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Fixes some display issues for the table of contents.
%   Provides a command to add sections like the bibliography to the ToC.
%

\RequirePackage{tocloft}
\RequirePackage[titletoc]{appendix}
\renewcommand{\contentsname}{Table of Contents}

\newcommand{\addtoToC}[1]{\addcontentsline{toc}{chapter}{#1}}

\renewcommand{\cfttabpresnum}{Table\ }
\renewcommand{\cfttabnumwidth}{0.75in}
\renewcommand{\cftfigpresnum}{Figure\ }
\renewcommand{\cftfignumwidth}{0.90in}


%   DEDICATION AND ACKNOWLEDGEMENTS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Provides environments for optional dedication and acknowledgements pages.
%

\newenvironment{dedication}{%
    \chapter*{Dedication}
    \addtoToC{Dedication}
    }{\newpage}

\newenvironment{acknowledgements}{%
    \chapter*{Acknowledgements}
    \addtoToC{Acknowledgements}
    }{\newpage}


%   APPENDICES  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Sets appendix paragraph style to remove indents and add space between them.
%   This code is copied from the `parskip` package included in standard LaTeX
%   distributions.
%

\BeforeBeginEnvironment{appendices}{
    \parskip=0.5\baselineskip \advance\parskip by 0pt plus 2pt
    \parindent=\z@
}


%   HYPERREF SETUP  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   If the user loads hyperref, make sure that links to (e.g.) frontmatter
%   sections point to the correct page and that autoreferences to appendices
%   display correctly.
%

\AtBeginDocument{%
    \@ifpackageloaded{hyperref}{%
        \pretocmd{\addtoToC}{\phantomsection{}}{}{}
        \newcommand{\Appendixautorefname}{Appendix}
    }{}
}

\endinput
