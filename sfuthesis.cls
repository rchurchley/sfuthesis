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
%       Bradley Coleman     (2012)
%       Juan Galvez         (2012)
%       Firuz Demir         (2013)
%       Ahmed Saad          (2013)
%       Reynaldo Arteaga    (2014)
%
%   In 2014--15, the template was renamed `sfuthesis` and entirely rewritten.
%
%       Ross Churchley      (2015)
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
%
%   `appendix` to add the word "Appendix" to the Table of Contents
%   `etoolbox` used for class options
%   `fontenc` used to improve accented character output
%   `geometry` used for Margins
%   `lmodern` used for Fonts
%   `pdfpages` used for including Declaration of Partial Copyright Licence form
%   `setspace` used for Line Spacing
%   `tocloft` used for making the ToC nicer
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sfuthesis}[2014/07/30 SFU Thesis/Dissertation Template]


%  CLASS OPTIONS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


%  BASE CLASSONS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   sfuthesis.cls is based on the standard `book` document class.
%   For more information (including standard class options), see
%   http://texdoc.net/texmf-dist/doc/latex/base/classes.pdf
%   or type `texdoc book` on the command line.
%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions
\LoadClass{book}


%  FONTS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Sets the typeface based on the class options (see above).
%   The fontenc package ensures proper hyphenation of accented words.
%

\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}


%  MARGINS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Sets the margins to 1.25" on the left and right, 1" on the top, and
%   0.7" from the bottom to the page numbers. Invoking the `twoside` option
%   will bypass this and allow margins be set by the underlying book class.
%   Prevents LaTeX's page-breaking algorithm from interrupting paragraphs or
%   creating nearly-empty pages.
%

\RequirePackage{geometry}
\nottoggle{bound}{%
    \newgeometry{
        top=1in,
        left=1.25in,
        bottom=0.7in,
        right=1.25in,
        includefoot   % ensure page numbers do not extend into margins
    }
}

\RequirePackage[all]{nowidow}


%  PAGINATION  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Provides commands to set page numbers in roman numerals for preliminary
%   pages (frontmatter) and arabic numbers for all other content (mainmatter)
%   \pagestyle{plain} sets page numbers in the bottom center.
%

\pagestyle{plain}

\apptocmd{\frontmatter}{%
    \pagenumbering{roman}
}

\apptocmd{\mainmatter}{%
    \pagenumbering{arabic}
}


%  LINE SPACING  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Sets 1.5 line spacing for the document body and provides commands to set
%   single-spacing for the "backmatter" (references, bibliography, appendices).
%   These commands do not affect spacing inside figures, tables, and other
%   floats, which remain single-spaced.
%

\RequirePackage{setspace}
\newcommand{\defaultspacing}{\onehalfspacing}
\newcommand{\smallspacing}{\singlespacing}

\defaultspacing
\renewcommand{\backmatter}{\smallspacing}


%  TITLE PAGE %%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
               {\huge\bfseries\@title}                      \\[12pt]
                          by                                \\[12pt]

              {\Large\bfseries\@author}                     \\[12pt]

                  \@previousdegrees
                                                            \vfill

    {\@thesistype} Submitted in Partial Fulfillment         \\
        of the Requirements for the Degree of               \\
                      \@degree                              \\[12pt]

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
%   if the user hasn't provided the correct information.
%   It then defines commands to set the corresponding variable when called.
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
        All rights reserved.\\
        However, in accordance with the \textit{Copyright Act of Canada}, this work may be reproduced without authorization under the conditions for ``Fair Dealing.'' Therefore, limited reproduction of this work for the purposes of private study, research, criticism, review and news reporting is likely to be in accordance with the law, particularly if cited appropriately.
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



%  APPROVAL PAGE  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
    \addtoToC{Approval}
    \smallspacing
                    \begin{center}
                  \textbf{APPROVAL}
                    \end{center}

    \approvall@bel{\textbf{Name:}}        \approvalv@lue{\@author}
    \approvall@bel{\textbf{Degree:}}      \approvalv@lue{\@degree\ \@discipline}
    \approvall@bel{\textbf{Title:}}       \approvalv@lue{\textit{\@title}}
    \approvall@bel{\textbf{\@committeelabel:}}
    \@committee
    \vfill\vfill
    \approvall@bel{\textbf{\@datelabel:}} \approvalv@lue{\@date}
    \newpage
    \defaultspacing
}

%
%   Implementation: Have \@committee store the committee, \committee set it,
%   and \chair and \member format its contents. If the thesis is undefended
%   (see class options), the committee and date is labeled differently.
%

\newcommand{\@committee}{}
\newcommand{\committee}[1]{\renewcommand{\@committee}{#1}}

\newcommand{\chair}[2]{
    \hfill
    \begin{minipage}[t]{0.6\textwidth}
        \textbf{#1} (chair) \newline
        #2
    \end{minipage}
    \newline
    \vfill
}

\newcommand{\member}[2]{
    \noindent\begin{minipage}[b]{0.4\textwidth}
        \textbf{#1} \newline
        #2
    \end{minipage}
    \hrulefill
    \newline
    \vfill
}

\newcommand{\@committeelabel}{%
    % "Supervisory" or "Examining" committee depends on whether a defence occurs
    \iftoggle{undefended}{Supervisory Committee}{Examining Committee}%
}

\newcommand{\@datelabel}{%
    % "Date defended" or "Date approved" depends on whether a defence occurs
    \iftoggle{undefended}{Date Approved}{Date Defended}%
}

\newcommand{\approvall@bel}[1]{\noindent
    \begin{minipage}[t]{0.3\textwidth}
        #1
    \end{minipage}
}

\newcommand{\approvalv@lue}[1]{%
    \hfill
    \begin{minipage}[t]{0.6\textwidth}
        #1
    \end{minipage}
    \\[5pt]
}


%  DECLARATION OF PARTIAL COPYRIGHT LICENCE  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Provides a command to add the PCL to the preamble.
%

\RequirePackage{pdfpages}
\newcommand{\makecopyrightdeclaration}{%
    \addtoToC{Partial Copyright Licence}
    \includepdf{declaration_of_partial_copyright_licence.pdf}
}


%  ABSTRACT AND KEYWORDS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Redefines the abstract environment to set it and the keywords on its own
%   page. While the abstract should appear in the main document after
%   \makecopyrightdeclaration, the keywords should be defined with \keyword{...}
%   in the preamble.
%

\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}
\newcommand{\@keywords}{KEYWORDS \@MissingMetadata{keywords}}

\newenvironment{abstract}{%
    \setlength{\parindent}{0pt}%
    \setlength{\parskip}{5pt}%
    \addtoToC{Abstract}
    \null\vfill

                    \begin{center}
                  \textbf{ABSTRACT}
                    \end{center}
}{%
    \leavevmode\\[5pt]
    \noindent\textbf{Keywords:} \@keywords
    \vfill\null\newpage
}


%  TABLE OF CONTENTS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Fixes some display issues for the table of contents.
%   Provides a command to add sections like the bibliography to the ToC.
%


\RequirePackage{tocloft}
\RequirePackage[titletoc]{appendix}

\newcommand{\addtoToC}[1]{\addcontentsline{toc}{chapter}{#1}}

\renewcommand{\cfttabpresnum}{Table\ }
\renewcommand{\cfttabnumwidth}{0.75in}
\renewcommand{\cftfigpresnum}{Figure\ }
\renewcommand{\cftfignumwidth}{0.90in}


%  DEDICATION AND ACKNOWLEDGEMENTS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Provides environments for optional dedication and acknowledgements pages
%

\newenvironment{dedication}{%
    \addtoToC{Dedication}
    \null\vfill
                    \begin{center}
                 \textbf{DEDICATION}
                    \end{center}
    }{\vfill\null\newpage}

\newenvironment{acknowledgements}{%
    \newpage\addtoToC{Acknowledgements}
    \null\vfill
                    \begin{center}
              \textbf{ACKNOWLEDGEMENTS}
                    \end{center}
    }{\vfill\null\newpage}


%  APPENDICES  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Sets appendix paragraph style to remove indents and add space between them.
%   If the user loads hyperref, makes sure that autorefs to an appendix display
%   correctly.
%

\BeforeBeginEnvironment{appendices}{
    \parskip=0.5\baselineskip \advance\parskip by 0pt plus 2pt
    \parindent=\z@
}

\AtBeginDocument{%
    \@ifpackageloaded{hyperref}{\newcommand*{\Appendixautorefname}{Appendix}}{}
}

\endinput
