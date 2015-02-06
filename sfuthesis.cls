%   Copyright (C) 1989--2014 Simon Fraser University
%
%   Contributors
%   ============
%   The previous thesis template, `csthesis`, was written by Stephen Chan based
%   on Stanford's PhD thesis style.
%
%       Stephen Chan        (1989)
%       Margaret Sharon     (1996)
%       Pepe Kubon          (1997--98)
%       Greg Baker          (2003--06)
%       Chris McIntosh      (2011)
%       Ahmed Saad          (2013--14)
%       Reynaldo Arteaga    (2014)
%
%   In 2014, the template was renamed `sfuthesis` and rewritten from the ground up.
%
%       Ross Churchley      (2014)
%
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
%   This work has the LPPL maintenance status `author-maintained'.
%
%   This work consists of the file sfuthesis.cls.
%
%
%   Dependencies
%   ============
%
%   This class uses the following external packages:
%   `etoolbox` used for class options
%   `cmbright` or `lmodern` used for Fonts
%   `setspace` used for Line Spacing
%   `enumitem` used for Approval Page
%   `pdfpages` used for including Declaration of Partial Copyright Licence form
%   `tocloft` used for making the ToC nicer
%   `appendix` to add the word "Appendix" to the Table of Contents
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sfuthesis}[2014/07/30 SFU Thesis/Dissertation Template]


%   Class Options --- Fonts
%
%   Users of sfuthesis.cls may choose between a serif font (default) and
%   a sans-serif font (using the `sans` option). Other font choices may
%   be acceptable to the SFU library, and can be set in the user's preamble.
%

\RequirePackage{etoolbox}
\newtoggle{sans}

\DeclareOption{sans}{
    \toggletrue{sans}
}

\PassOptionsToClass{11pt}{report}


%   Base Class
%
%   sfuthesis.cls is based on the standard `report` document class.
%   For more information (including standard class options), see
%   http://texdoc.net/texmf-dist/doc/latex/base/classes.pdf
%   or type `texdoc report` on the command line.
%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ProcessOptions
\LoadClass{report}


%   Fonts
%
%   Sets the typeface based on the class options (see above).
%   The fontenc package ensures proper hyphenation of accented words.
%

\iftoggle{sans}{%
  \RequirePackage{cmbright}
}{% else
  \RequirePackage{lmodern}
}

\RequirePackage[T1]{fontenc}


%   External packages used by this class:
%
%   `etoolbox` used for class options, above
%   `setspace` used in Line Spacing
%   `enumitem` used for Approval Page
%   `pdfpages` used for including Declaration of Partial Copyright Licence form
%   `tocloft` used for making the ToC nicer
%   `appendix` to add the word "Appendix" to the Table of Contents
%   `cmbright` and `lmodern` optionally called in Fonts, above
%

\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{pdfpages}
\RequirePackage{tocloft}
\RequirePackage[titletoc]{appendix}


%   Margins
%
%   All content must be inside the margins to allow theses to be printed and
%   bound. Though margins cannot be smaller, they can be larger --- however,
%   this is not recommended.
%
%   1.25" left/right and 1" top/bottom (page numbers at a minimum of .7")
%
%   Please ensure that tables, figures, and/or images do not stretch beyond
%   these margins; that is that nothing goes past where the text falls
%   naturally on other pages.
%

\RequirePackage[
    top=1.25in,
    left=1.25in,
    bottom=0.7in,
    right=1in,
    includefoot   % ensure page numbers do not extend into margins
]{geometry}


%   Pagination
%
%   All pages with the exception of the Title Page must have page numbers.
%   Roman numerals must appear on preliminary pages (ii. iii, iv,...) and
%   Arabic numbers must be used for the body of text, beginning with the
%   introduction through to the end of the document (1, 2, 3,...).
%
%   Page numbers must be greater than .5" from the edge of the page.
%   It is preferred that page numbers appear at the bottom/center of each page
%   Page numbers may also be located bottom or top right.
%

\pagestyle{plain}

\newcommand{\frontmatter}{%
    \pagenumbering{roman}
}

\newcommand{\mainmatter}{%
    \clearpage
    \pagenumbering{arabic}
}


%   Line Spacing
%
%   The body of your document requires 1.5 line-spacing with the exception of
%   blockquotes, bullets, a series of numbered paragraphs, references,
%   footnotes, and appendices, all of which are single spaced.
%

\newcommand{\defaultspacing}{\onehalfspacing}
\newcommand{\smallspacing}{\singlespacing}

\defaultspacing

\newcommand{\backmatter}{\singlespacing}


%   Title Page
%
%   The Title Page spans only one page and requires no page number on the page.
%   Ensure there is space between all the elements on the Title Page.
%
%   The title page requires the following elements.
%
%   Title
%   - The title of the thesis needs to be the same on all documents.
%   - Avoid using quotations marks around the title. When necessary, single- or
%     double- quotation marks within a title are permitted.
%   - Do not include a period after the title.
%   - Avoid using acronyms in the title when possible.
%
%   Your name and previous degrees
%   - Firstname Lastname
%   - M.Sc. (Mathematics), Name of University (City or State), 20XX
%   - B.Sc., University of Placename, 20XX
%   - Previous degrees are abbreviated on the title page.
%   - If from a foreign university, please consult that institution for the
%     appropriate short-form degree abbreviation.
%   - Your most recent degree comes first.
%   - City/State/Country is only needed for universities that stipulate these in
%     their names --- e.g. University of California (Berkeley) --- or for
%     universities that share a name with one in another country.
%   - Each degree must fit on one line. If necessary, remove discipline and
%     city/state/country to make it fit. But do not abbreviate the name of the
%     university.
%
%   In Partial Fulfillment...
%   - This element appears on 3 lines.
%   - Use correct thesis type: see http://www.lib.sfu.ca/faqs/thesis-dissertation-extended-essays-research-project-capstone
%   - Use full name of degree, e.g. Master of Arts, Doctor of Philosophy.
%
%   Department/School/Program and Faculty
%   - This element appears on three lines.
%   - State the department/school/Program on one line and the Faculty on another
%   - Check the SFU website to find the correct names
%
%   Copyright, semester, and year
%   - Use 1.5 spacing
%   - "Semester" refers to the semester in which you hand your thesis to the
%     library, not the semester in which you defended.
%
%   Rights statement
%   - Single-spaced, 10pt font size.
%   - The "all rights reserved" text is specified by the library's template.
%     You may instead choose to use an appropriate Creative Commons license.
%     If you do, you still need to fill out a Partial Copyright License form.
%
%
%   To satisfy these requirements, `sfuthesis.cls` requires the following
%   information:
%
%   \previousdegrees{...}
%   \thesistype{...}
%   \degree{...}
%   \department{...}
%   \faculty{...}
%   \date{...}
%   \copyrightyear{...}
%
%   If these are set in the preamble, \maketitle will output a correctly
%   formatted title page. If you want to use a Creative Commons license, you
%   can override the ``all rights reserved'' text with \copyrightnotice{...}
%

%   Define the commands to set metadata

\newcommand{\thesistype}[1]{\renewcommand{\@thesistype}{#1}}
\newcommand{\previousdegrees}[1]{\renewcommand{\@previousdegrees}{#1}}
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}
\newcommand{\discipline}[1]{\renewcommand{\@discipline}{(#1)}}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\faculty}[1]{\renewcommand{\@faculty}{#1}}
\newcommand{\semester}[1]{\renewcommand{\@semester}{#1}}
\newcommand{\copyrightyear}[1]{\renewcommand{\@copyrightyear}{#1}}
\newcommand{\copyrightnotice}[1]{\renewcommand{\@copyrightnotice}{#1}}

%   Define variables to hold metadata and warn you if you haven't set them yet

\newcommand{\@MissingMetadata}[1]{\ClassWarning{sfuthesis}{%
    Missing #1. Set this in the preamble to fix your frontmatter.
}}

\newcommand{\@thesistype}{THESIS \@MissingMetadata{thesistype}}
\newcommand{\@previousdegrees}{PREVIOUS DEGREES \@MissingMetadata{previousdegrees}}
\newcommand{\@degree}{DEGREE \@MissingMetadata{degree}}
\newcommand{\@discipline}{} % optional
\newcommand{\@department}{DEPARTMENT \@MissingMetadata{department}}
\newcommand{\@faculty}{FACULTY \@MissingMetadata{faculty}}
\newcommand{\@semester}{SEMESTER \@MissingMetadata{semester}}
\newcommand{\@copyrightyear}{YEAR \@MissingMetadata{copyrightyear}}
\newcommand{\@copyrightnotice}{%
    \begingroup\small
    All rights reserved.\\
    However, in accordance with the \textit{Copyright Act of Canada}, this work may be\\
    reproduced without authorization under the conditions for ``Fair Dealing.''\\
    Therefore, limited reproduction of this work for the purposes of private study,\\
    research, criticism, review and news reporting is likely to be in accordance\\
    with the law, particularly if cited appropriately.
    \endgroup
}

\newcommand{\newlinesp@ce}{\leavevmode\\[5pt]}    % an extra big line break

%   Automagically produce title page

\renewcommand{\maketitle}{{%
    \thispagestyle{empty}
                                                            \null\vfill
                    \begin{center}
                                                            \doublespacing
               {\Large\bfseries\@title}                     \newlinesp@ce
                                                        \par\defaultspacing
                          by                                \newlinesp@ce

                 {\bfseries\@author}                        \newlinesp@ce

                  \@previousdegrees
                                                            \vfill

    {\@thesistype} Submitted in Partial Fulfillment         \\
        of the Requirements for the Degree of               \newlinesp@ce

                      \@degree                              \newlinesp@ce

                       in the                               \\
                    \@department                            \\
                     \@faculty
                                                            \vfill

        \copyright\ \@author\ \@copyrightyear               \\
               SIMON FRASER UNIVERSITY                      \\
                     \@semester                             \newlinesp@ce

           \smallspacing\@copyrightnotice
                    \end{center}
                                                            \vfill
    \newpage
}}


%   Approval page
%
%   Page ii is the Approval Page. It should be unsigned in your thesis, with a
%   signed copy uploaded separately into the Thesis Registration System. See
%   http://www.lib.sfu.ca/help/writing/thesis/format/approval-page
%   for more details.
%
%   The Approval Page contains the following elements:
%
%   Name
%
%   Degree (Discipline)
%
%   Title
%   - Title may be italicized, is not surrouned by quotation marks, and does
%     not end in a period.
%
%   Examining/Supervisory Committee
%   - Name of each committee member
%   - Position on committee
%   - Position in department
%   - Department, if different from your own
%   - University, if different from your own
%   - All information should be accurate as of the date approved
%
%   Date defended/approved
%   - Use "Date defended" if defended, and "Date approved" otherwise
%
%
%   To display the Approval Page, fill out your committee using
%
%   \committee{External/Supervisory Committee}{%
%       \chair{Name}{Chair}
%       \member{Name}{Senior Supervisor \\ Title}
%       \member{Name}{Role on Committee \\ Title \\ Affiliation}
%   }
%
%   Then, after \maketitle, call \makecommittee.

%   Commands to set committee

\newcommand{\signatureline}{\noindent\rule{0.1pt}{0.4pt}\hrulefill\\[-0.2\baselineskip]}
\newcommand{\chair}[2]{%
    #1                  \newline
    #2
}
\newcommand{\member}[2]{%
                        \newlinesp@ce
    \signatureline
    \textbf{#1}         \newline
    #2
}
\newcommand{\committee}[2]{\renewcommand{\@committee}{%
    \item[\textbf{#1:}] #2
}}
\newcommand{\@committee}{}

%   "Date defended" or "Date approved", depending on whether there was a defence

\newcommand{\defended}[1]{\renewcommand{\@approvaldateline}{%
    \item[\textbf{Date Defended:}] #1
}}
\newcommand{\approved}[1]{\renewcommand{\@approvaldateline}{%
    \item[\textbf{Date Approved:}] #1
}}
\newcommand{\@approvaldateline}{\item[\textbf{Date Approved:}] n/a}


%   Automagically generate approval page

\newcommand{\makecommittee}{%
    \addtoToC{Approval}
                    \begin{center}
                  \textbf{APPROVAL}
                    \end{center}

    \begin{itemize}[labelwidth=10em, leftmargin=10em, align=parleft]

        \item[\textbf{Name:}]               \@author
        \item[\textbf{Degree:}]             \@degree\ \@discipline
        \item[\textbf{Title of Thesis:}]    \textit{\@title}
                                            \@committee
                                                                    \vfill
                                            \@approvaldateline
    \end{itemize}
    \newpage
}


%   Declaraion of Partial Copyright Licence
%
%   The (Declaration of) Partial Copyright Licence appears immediately after the
%   Approval Page in your thesis.
%
%   Make sure you have an up-to-date copy of the DPCL from the SFU Library, that
%   it is named correctly, and that it's in the same folder as this class file
%   and your thesis.
%

\newcommand{\makecopyrightdeclaration}{%
    \addtoToC{Partial Copyright Licence}
    \includepdf{declaration_of_partial_copyright_licence.pdf}
}


%   Abstract and keywords
%
%   The abstract contains a clear statement of the essence of the thesis.
%   The problem or questions dealt with, the methods of investigation used, and
%   the general conclusions are stated here.
%
%   All versions of the abstract (PDF and abstract entered into the Thesis
%   Registration System) must be the same.
%
%   Abstract length maximums:
%   - Master's Thesis: 150 words (the thesis registration system requires the
%     abstract be entered as one paragraph)
%   - Doctorate: 350 words (usually 3 paragraphs; the thesis registration system
%     requires the abstract be entered as one paragraph)
%
%   The abstract must appear after the Partial Copyright Licence and start on
%   page iv or page v if you have pasted the Ethics Statement into your
%   document.
%
%   Use plain text only (avoid using bullets, numbered paragraphs, citations,
%   footnotes, tables, graphs, or illustrations).
%
%   The abstract should appear on one page.
%
%   Keywords appear under the abstract and must be entered into the Thesis
%   Registration System.
%
%   Keywords should be separated by semi-colons. The list of keywords is
%   sentence-cased and does not end in a period.
%

\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}
\newcommand{\@keywords}{KEYWORDS \@MissingMetadata{keywords}}

\renewenvironment{abstract}{%
    \setlength{\parindent}{0pt}%
    \setlength{\parskip}{5pt}%
    \addtoToC{Abstract}                         \ \vfill

                    \begin{center}
                  \textbf{ABSTRACT}
                    \end{center}
}{%
    \newlinesp@ce
    \noindent\textbf{Keywords:} \@keywords
    \vfill\vfill\newpage
}


%   Table of Contents
%
%   Fixes some display issues for the table of contents.
%   Provides a command to add sections like the bibliography to the ToC.
%

\newcommand{\addtoToC}[1]{\addcontentsline{toc}{chapter}{#1}}

\renewcommand{\cfttabpresnum}{Table\ }
\renewcommand{\cfttabnumwidth}{0.75in}
\renewcommand{\cftfigpresnum}{Figure\ }
\renewcommand{\cftfignumwidth}{0.90in}

\setcounter{lofdepth}{2}


%   Dedication and Acknowledgements
%
%   There do not seem to be restrictions on the style of these optional pages.
%   Feel free to change these as you see fit.
%

\newenvironment{dedication}{%
    \addtoToC{Dedication}
                    \begin{center}
                 \textbf{DEDICATION}
                    \end{center}

    }{\newpage}

\newenvironment{acknowledgements}{%
    \newpage\addtoToC{Acknowledgements}

                    \begin{center}
              \textbf{ACKNOWLEDGEMENTS}
                    \end{center}

    }{\newpage}





\endinput
