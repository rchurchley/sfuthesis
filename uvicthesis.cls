\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uvicthesis}[2012/08/20 UVic Thesis/Dissertation Template]

%--------------------------------------------------------------------------------------%
%								OPTIONS										
%--------------------------------------------------------------------------------------%
% Pass class options to the underlying book class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions

\LoadClass{book}


%--------------------------------------------------------------------------------------%
%								MARGINS AND SPACING										
%--------------------------------------------------------------------------------------%
\RequirePackage[top=1.3in,left=1.5in,bottom=1in,right=1in,headsep=0.5in]{geometry}
\RequirePackage{setspace}


%--------------------------------------------------------------------------------------%
%								PARTS
%--------------------------------------------------------------------------------------%
\renewcommand{\frontmatter}{%
	\onehalfspacing
	\pagenumbering{roman}
}

\renewcommand{\mainmatter}{%
	\clearpage
	\doublespacing
	\pagenumbering{arabic}
}


%--------------------------------------------------------------------------------------%
%								STUFF REQUIRED FOR OTHER STUFF
%--------------------------------------------------------------------------------------%
\RequirePackage{textcase}

%--------------------------------------------------------------------------------------%
%								HEADERS
%--------------------------------------------------------------------------------------%

\usepackage{fancyhdr}
\setlength{\headheight}{15pt}

\fancypagestyle{plain}{%
		\fancyhf{}
		\fancyhead[R]{\thepage}
		\renewcommand{\headrulewidth}{0pt}
		\renewcommand{\footrulewidth}{0pt}
}
\pagestyle{plain}


%--------------------------------------------------------------------------------------%
%								TITLE PAGE METADATA										
%--------------------------------------------------------------------------------------%

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

%--------------------------------------------------------------------------------------%
%								TITLE PAGE REDESIGN										
%--------------------------------------------------------------------------------------%

\newcommand{\tpbreak}{\\[\baselineskip]}	% an extra big line break

\newcommand{\maketitlepage}{{\centering
	\@title																\tpbreak
	by																	\tpbreak
	\@author 															\\
	\@authordetails														\tpbreak
	A {\@type} Submitted in Partial Fulfillment of the \\
	Requirements for the Degree of										\tpbreak
	\MakeUppercase{\@degree}															\tpbreak
	in the \@department						\\\vfill
	
	\begin{tabular}{cl}
		\copyright 	& \@author, \@date\\
					& University of Victoria
	\end{tabular}														\tpbreak
	All rights reserved. This \MakeLowercase{\@type} may not be reproduced in whole or in part, by photocopying or other means, without the permission of the author.		\\
}}

\newcommand{\makepanelpage}{
	\addtoToC{Supervisory Committee}
	{\centering
	\@title																\tpbreak
	by																	\tpbreak
	\@author 															\\
	\@authordetails														\tpbreak
	}																	\vfill

	\noindent Supervisory Committee										\tpbreak
	\@panel																\vfill
}

\renewcommand{\maketitle}{%
	\thispagestyle{empty}
	\maketitlepage%							% prints the actual title page (defined above)
	\newpage%
	\setcounter{footnote}{0}
}

\newcommand{\makecommittee}{%
	\makepanelpage
	\newpage%
}


%--------------------------------------------------------------------------------------%
%								ABSTRACT										
%--------------------------------------------------------------------------------------%

\newenvironment{abstract}{%
	\newpage\addtoToC{Abstract}

	\noindent \textbf{Supervisory Committee}
	\tpbreak
	\@panel

	\begin{center}\textbf{ABSTRACT}\end{center}
	
	}{}


%--------------------------------------------------------------------------------------%
%								TABLE OF CONTENTS										
%--------------------------------------------------------------------------------------%
\newcommand{\addtoToC}[1]{\addcontentsline{toc}{chapter}{#1}}

\usepackage{tocloft}
\renewcommand{\cfttabpresnum}{Table\ }
\renewcommand{\cfttabnumwidth}{0.75in}
\renewcommand{\cftfigpresnum}{Figure\ }
\renewcommand{\cftfignumwidth}{0.90in}

\setcounter{lofdepth}{2}


%--------------------------------------------------------------------------------------%
%								ACKNOWLEDGEMENTS
%--------------------------------------------------------------------------------------%

\newenvironment{acknowledgements}{%
	\newpage\addtoToC{Acknowledgements}

	\begin{center}\textbf{ACKNOWLEDGEMENTS}\end{center}
	
	}{}


%--------------------------------------------------------------------------------------%
%								DEDICATION
%--------------------------------------------------------------------------------------%

\newenvironment{dedication}{%
	\newpage\addtoToC{Dedication}

	\begin{center}\textbf{DEDICATION}\end{center}
	
	}{}


\endinput