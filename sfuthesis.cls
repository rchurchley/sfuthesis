\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sfuthesis}[2014/01/21 SFU Thesis/Dissertation Template]

\PassOptionsToClass{11pt}{report}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass{report}

%   Publication Style
%
%   The most commonly used citation/referencing styles are APA,
%   Chicago/Turabian, and MLA.  If you are unsure which writing style to use
%   or the degree to which you must follow its conventions, contact your
%   supervisor/instructor or department graduate assistant.  In some cases
%   (such as headings, line spacing, paragraph alignment, font) deviation from
%   your publication style is permitted.


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

\RequirePackage[top=1.25in,left=1.25in,bottom=1in,right=1in]{geometry}

%   Pagination
%   All pages with the exception of the Title Page must have page numbers.
%   Roman numerals must appear on preliminary pages (ii. iii, iv,...) and
%   Arabic numbers must be used for the body of text, beginning with the
%   introduction through to the end of the document (1, 2, 3,...).
%
%   Page numbers must be greater than .5" from the edge of the page.
%   It is preferred that page numbers appear at the bottom/center of each page
%   Page numbers may also be located bottom or top right.

\newcommand{\frontmatter}{%
    \pagenumbering{roman}
}

\newcommand{\mainmatter}{%
    \clearpage
    \pagenumbering{arabic}
}


%   Font
%
%   Arial 11 point (pt) is the preferred font/size and is the default in the
%   templates acknowledging that theses are commonly read online.  Other 
%   cross-platform sans serif fonts for text are also acceptable; the size
%   chosen should be the same physical size as Arial 11pt.
%
%   sfuthesis.cls uses the sans-serif Computer Modern Bright typeface.
%   The size, 11pt, is set at with \PassOptionsToClass at the beginning of
%   this file.

\RequirePackage{cmbright}


%   Line Spacing
%
%   The body of your document requires 1.5 line-spacing with the exception of
%   blockquotes, bullets, a series of numbered paragraphs, references, 
%   footnotes, and appendices, all of which are single spaced.

\RequirePackage{setspace}
    \newcommand{\defaultspacing}{\onehalfspacing}
    \newcommand{\smallspacing}{\singlespacing}
    \defaultspacing





%   Headers
%
%   Sets the page number in the top right corner of all pages by default
%

\usepackage{fancyhdr}
\setlength{\headheight}{15pt}

\fancypagestyle{plain}{%
        \fancyhf{}
        \fancyhead[R]{\thepage}
        \renewcommand{\headrulewidth}{0pt}
        \renewcommand{\footrulewidth}{0pt}
}
\pagestyle{plain}


%   Title page metadata
%
%   Allows the user to easily set the information displayed on the title page.
%

\renewcommand{\@date}{\the\year}

\newcommand{\type}[1]{\renewcommand\@type{#1}}
\newcommand{\@type}{%
    \ClassError{uvicthesis}{I need to know whether this is a thesis or a dissertation. Use \protect\type{Thesis} or \protect\type{Dissertation} in the preamble.}{}}
    
\newcommand{\authordetails}[1]{\renewcommand\@authordetails{#1}}
\newcommand{\@authordetails}{}

\newcommand{\degree}[1]{\renewcommand\@degree{#1}}
\newcommand{\@degree}{%
    \ClassError{uvicthesis}{What degree are you writing this for? Use \protect\degree in the preamble to tell me your expected degree.}{}}

\newcommand{\department}[1]{\renewcommand\@department{#1}}
\newcommand{\@department}{%
    \ClassError{uvicthesis}{What department are you in? Let me know with  \protect\department in the preamble.}{}
}

\newcommand\panelist[3]{\noindent #1, #2\\\noindent(#3)\tpbreak}
\newcommand{\panel}[1]{\renewcommand\@panel{#1}}
\newcommand{\@panel}{}


%   Title page
%
%   Displays the title page and second page listing the supervisory
%   committee.
%

\RequirePackage{textcase}
\newcommand{\tpbreak}{\\[\baselineskip]}    % an extra big line break

\newcommand{\maketitlepage}{{\centering
    \@title                                                             \tpbreak
    by                                                                  \tpbreak
    \@author                                                            \\
    \@authordetails                                                     \tpbreak
    A {\@type} Submitted in Partial Fulfillment of the \\
    Requirements for the Degree of                                      \tpbreak
    \MakeUppercase{\@degree}                                                            \tpbreak
    in the \@department                     \\\vfill
    
    \begin{tabular}{cl}
        \copyright  & \@author, \@date\\
                    & University of Victoria
    \end{tabular}                                                       \tpbreak
    All rights reserved. This \MakeLowercase{\@type} may not be reproduced in whole or in part, by photocopying or other means, without the permission of the author.       \\
}}

\newcommand{\makepanelpage}{
    \addtoToC{Supervisory Committee}
    {\centering
    \@title                                                             \tpbreak
    by                                                                  \tpbreak
    \@author                                                            \\
    \@authordetails                                                     \tpbreak
    }                                                                   \vfill

    \noindent Supervisory Committee                                     \tpbreak
    \@panel                                                             \vfill
}

\renewcommand{\maketitle}{%
    \thispagestyle{empty}
    \maketitlepage%             % prints the actual title page (defined above)
    \newpage%
    \setcounter{footnote}{0}
}

\newcommand{\makecommittee}{%
    \makepanelpage
    \newpage%
}


%   Abstract
%
%   Displays the abstract page (including the supervisory committee again) and
%   adds it to the table of contents.
%

\renewenvironment{abstract}{%
    \newpage\addtoToC{Abstract}

    \noindent \textbf{Supervisory Committee}
    \tpbreak
    \@panel

    \begin{center}\textbf{ABSTRACT}\end{center}
    
    }{}


%   Table of Contents
%
%   Fixes some display issues for the table of contents.
%   Provides a command to add sections like the bibliography to the ToC.
%

\newcommand{\addtoToC}[1]{\addcontentsline{toc}{chapter}{#1}}

\usepackage{tocloft}
\renewcommand{\cfttabpresnum}{Table\ }
\renewcommand{\cfttabnumwidth}{0.75in}
\renewcommand{\cftfigpresnum}{Figure\ }
\renewcommand{\cftfignumwidth}{0.90in}

\setcounter{lofdepth}{2}


%   Acknowledgements
%
%   Displays the acknowledgements page and adds it to the table of contents.
%

\newenvironment{acknowledgements}{%
    \newpage\addtoToC{Acknowledgements}

    \begin{center}\textbf{ACKNOWLEDGEMENTS}\end{center}
    
    }{}


%   Dedication
%
%   Displays the dedication page and adds it to the table of contents.
%

\newenvironment{dedication}{%
    \newpage\addtoToC{Dedication}

    \begin{center}\textbf{DEDICATION}\end{center}
    
    }{}


\endinput