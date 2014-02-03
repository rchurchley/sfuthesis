\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sfuthesis}[2014/01/21 SFU Thesis/Dissertation Template]

\PassOptionsToClass{11pt}{report}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass{report}


%   External packages used by this class:
%
%   `cmbright` optionally called in Fonts
%   `setspace` used in Line Spacing
%   `enumitem` used for Approval Page

\RequirePackage{setspace}
\RequirePackage{enumitem}


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

\pagestyle{plain}

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
%   templates acknowledging that theses are commonly read online. Other 
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

    \newcommand{\defaultspacing}{\onehalfspacing}
    \newcommand{\smallspacing}{\singlespacing}
    \defaultspacing


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

\newcommand{\thesistype}[1]{\renewcommand{\@thesistype}{#1}}
\newcommand{\@thesistype}{\ClassError{sfuthesis}{%
    Missing thesis type. Use \protect\thesistype{...} in the preamble.
}{}}
    
\newcommand{\previousdegrees}[1]{\renewcommand{\@previousdegrees}{#1}}
\newcommand{\@previousdegrees}{\ClassError{sfuthesis}{%
    Missing previous degrees. Use \protect\previousdegrees{...} in the preamble.
}{}}

\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}
\newcommand{\@degree}{\ClassError{sfuthesis}{%
    Missing expected degree. Use \protect\degree{...} in the preamble.
}{}}

\newcommand{\discipline}[1]{\renewcommand{\@discipline}{(#1)}}
\newcommand{\@discipline}{}

\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\@department}{\ClassError{sfuthesis}{%
    Missing department, school, or program. Use \protect\department{...} in the preamble.
}{}}

\newcommand{\faculty}[1]{\renewcommand{\@faculty}{#1}}
\newcommand{\@faculty}{\ClassError{sfuthesis}{%
    Missing faculty. Use \protect\faculty{...} in the preamble.}{}
}

\newcommand{\semester}[1]{\renewcommand{\@semester}{#1}}
\newcommand{\@semester}{\ClassError{sfuthesis}{%
    Missing semester approved. Use \protect\semester{...} in the preamble.}{}
}

\newcommand{\copyrightyear}[1]{\renewcommand{\@copyrightyear}{#1}}
\newcommand{\@copyrightyear}{\ClassError{sfuthesis}{%
    Missing copyright year. Use \protect\copyrightyear{...} in the preamble.}{}
}

\newcommand{\copyrightnotice}[1]{\renewcommand{\@copyrightnotice}{#1}}
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


\newcommand{\@tpbreak}{\\[0.75\baselineskip]}    % an extra big line break

\renewcommand{\maketitle}{{%
    \thispagestyle{empty}
    \begin{center}
                                                                    \vfill
        {\doublespacing\Large\bfseries\@title}                      \@tpbreak\par
        \defaultspacing
        by                                                          \@tpbreak
        {\bfseries\@author}                                         \@tpbreak
        \@previousdegrees                                               
                                                                    \vfill
        {\@thesistype} Submitted in Partial Fulfillment             \\ 
        of the Requirements for the Degree of                       \@tpbreak
        \@degree                                                    \@tpbreak
        in the                                                      \\
        \@department                                                \\
        \@faculty                                                       
                                                                    \vfill
        \copyright\ \@author\ \@copyrightyear                       \\
        SIMON FRASER UNIVERSITY                                     \\
        \@semester                                                  \@tpbreak
        \smallspacing\@copyrightnotice
    \end{center}
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

\newcommand{\chair}[2]{%
    #1                  \\
    #2                  \@tpbreak
}
\newcommand{\member}[2]{%
    \rule{0.1pt}{0.4pt}\hrulefill          \\
    \textbf{#1}         \\
    #2                  \@tpbreak
}

\newcommand{\committee}[2]{\renewcommand{\@committee}{%
    \item[\textbf{#1:}] #2
}}
\newcommand{\@committee}{}

\newcommand{\defended}[1]{\renewcommand{\@approvaldateline}{%
    \item[\textbf{Date Defended:}] #1
}}
\newcommand{\approved}[1]{\renewcommand{\@approvaldateline}{%
    \item[\textbf{Date Approved:}] #1
}}
\newcommand{\@approvaldateline}{\item[\textbf{Date Approved:}] n/a}


\newcommand{\makecommittee}{%
    \addtoToC{Supervisory Committee}
    \begin{center}\textbf{APPROVAL}\end{center}
    \begin{itemize}[labelwidth=10em, leftmargin=10em, align=parleft]
        \item[\textbf{Name:}] \@author
        \item[\textbf{Degree:}] \@degree\ \@discipline
        \item[\textbf{Title of Thesis:}] \textit{\@title}
        \@committee
        \@approvaldateline
    \end{itemize}
    \newpage
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
   % \@panel

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