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
%   `geometry` used for Margins
%   `setspace` used for Line Spacing
%   `enumitem` used for Approval Page
%   `pdfpages` used for including Declaration of Partial Copyright Licence form
%   `tocloft` used for making the ToC nicer
%   `appendix` to add the word "Appendix" to the Table of Contents
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sfuthesis}[2014/07/30 SFU Thesis/Dissertation Template]


%   Class Options
%
%   Users of sfuthesis.cls may choose between a sans-serif font (default) and
%   a serif font (using the `serif` option). Other font choices may
%   be acceptable to the SFU library, and can be set in the user's preamble.
%
%   The library requires a slightly different approval page format if the
%   thesis is accepted without a defence taking place. If this applies to you,
%   use the `undefended` class option to format the approval page correctly.
%

\RequirePackage{etoolbox}
\newtoggle{serif}
\newtoggle{undefended}

\DeclareOption{serif}{
    \toggletrue{serif}
}

\DeclareOption{undefended}{
    \toggletrue{undefended}
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

\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}

\iftoggle{serif}{%
    \renewcommand*\familydefault{\rmdefault}
}{% else
    \renewcommand*\familydefault{\sfdefault}
}




\RequirePackage{tocloft}
\RequirePackage[titletoc]{appendix}


%   Margins
%
%   Set the margins to 1.25" on the left and right, 1" on the top, and
%   0.7" from the bottom to the page numbers.
%

\RequirePackage[
    top=1in,
    left=1.25in,
    bottom=0.7in,
    right=1.25in,
    includefoot   % ensure page numbers do not extend into margins
]{geometry}


%   Pagination
%
%   Provides commands to set page numbers in roman numerals for preliminary pages
%   (frontmatter) and arabic numbers for all other content (mainmatter)
%   \pagestyle{plain} sets page numbers in the bottom center.
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
%   Sets 1.5 line spacing for the document body and provides commands to set
%   single-spacing for the references-bibliography-appendices "backmatter".
%   These commands do not affect spacing inside figures, tables, and other
%   floats, which remain single-spaced.
%

\RequirePackage{setspace}
\newcommand{\defaultspacing}{\onehalfspacing}
\newcommand{\smallspacing}{\singlespacing}

\defaultspacing
\newcommand{\backmatter}{\smallspacing}


%   Provides an internal command to generate extra space between elements on
%   the title and approval page.
%

\newcommand{\newlinesp@ce}{\leavevmode\\[5pt]}


%   Title Page
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

%   Implementation: create a new "variable" for each of the above metadata,
%   initially storing placeholder text and an instruction to throw a warning
%   if the user hasn't provided the correct information.
%   Then define commands to set the corresponding variable when called.
%   Finally, redefine \maketitle to set the title page as desired.
%

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
\newcommand{\copyrightnotice}[1]{\renewcommand{\@copyrightnotice}{#1}}

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

        \textcopyright\ \@author\ \@copyrightyear               \\
               SIMON FRASER UNIVERSITY                      \\
                     \@semester                             \newlinesp@ce

           \smallspacing\@copyrightnotice
                    \end{center}
                                                            \vfill
    \newpage
}}


%   Approval page
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
%
%   Implementation: Have \@committee store the committee, \committee set it,
%   and \chair and \member format its contents. If the thesis is undefended
%   (see class options), the committee and date is labeled differently.
%

\RequirePackage{enumitem}
\newcommand{\@committee}{}
\newcommand{\committee}[1]{\renewcommand{\@committee}{%
    \item[\textbf{\@committeetype}] #1
}}

\newcommand{\chair}[2]{%
    #1                          \newline
    #2
}

\newcommand{\member}[2]{\newlinesp@ce
    \noindent\null\hrulefill    \newline  % signature line
    \textbf{#1}                 \newline
    #2
}

\newcommand{\@committeetype}{%
    \iftoggle{undefended}{%
        Supervisory Committee
    }{% else
        Examining Committee
    }
}

\newcommand{\@approvaldateline}{%
    \iftoggle{undefended}{%
        \item[\textbf{Date Approved:}] \@date
    }{% else
        \item[\textbf{Date Defended:}] \@date
    }
}

\newcommand{\makecommittee}{%
    \addtoToC{Approval}
    \smallspacing
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
    \defaultspacing
}


%   Declaraion of Partial Copyright Licence
%
%   Provides a command to add the PCL to the preamble.
%

\RequirePackage{pdfpages}
\newcommand{\makecopyrightdeclaration}{%
    \addtoToC{Partial Copyright Licence}
    \includepdf{declaration_of_partial_copyright_licence.pdf}
}


%   Abstract and keywords
%
%   Redefines the abstract environment to set it and the keywords on its own
%   page. While the abstract should appear in the main document after
%   \makecopyrightdeclaration, the keywords should be defined with \keyword{...}
%   in the preamble.
%

\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}
\newcommand{\@keywords}{KEYWORDS \@MissingMetadata{keywords}}

\renewenvironment{abstract}{%
    \setlength{\parindent}{0pt}%
    \setlength{\parskip}{5pt}%
    \addtoToC{Abstract}
    \null\vfill

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
    \null\vfill
                    \begin{center}
                 \textbf{DEDICATION}
                    \end{center}
    \vfill
    }{\newpage}

\newenvironment{acknowledgements}{%
    \newpage\addtoToC{Acknowledgements}
    \null\vfill
                    \begin{center}
              \textbf{ACKNOWLEDGEMENTS}
                    \end{center}
    \vfill
    }{\newpage}

\endinput
