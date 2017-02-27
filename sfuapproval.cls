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

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sfuapproval}[2017/01/01 v1.0.0 SFU Approval Signature Page]

%   BASE CLASS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   sfuapproval.cls patches sfuthesis.cls by replacing the entire document with
%   a slight variation on the approval page, where each committee member (other
%   than the chair) is given a signature line.
%

\LoadClass{sfuthesis}

\patchcmd{\chapter}{plain}{empty}{}{}

\let\oldbegindocument\document
\let\oldenddocument\enddocument
\renewenvironment{document}{%
    \oldbegindocument
    \chapter*{Approval}%
    \smallspacing%
    \@approvallabel{Name:}          \@approvalvalue{\@author}
    \@approvallabel{Degree:}        \@approvalvalue{\@degree\ \@discipline}
    \@approvallabel{Title:}         \@approvalvalue{\@title}
    \@approvallabel{\@committeelabel:}
    \@committee
    \@approvallabel{\@datelabel:}   \@approvalvalue{\@date}
    \newpage
    \defaultspacing
    \oldenddocument
}{}

\renewcommand{\member}[2]{%
    \noindent%
    \begin{minipage}[b]{0.35\textwidth}%
        \raggedright
        \textbf{#1}\newline
        #2
    \end{minipage}%
    \hrulefill%
    \par%
    \vspace{1.5\baselineskip}%
}

\endinput
