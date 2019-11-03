\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jamk-report}[2017/09/02 JAMK Report]
\LoadClass[12pt]{report}

\def\blx@nowarnpolyglossia{}

\usepackage[margin=2cm,left=4.3cm]{geometry}
\usepackage[british]{babel}
\usepackage{sectsty}
\usepackage[parfill]{parskip}
\usepackage{fancyhdr}
\usepackage{graphicx}
\usepackage{caption}
\usepackage{setspace}
\usepackage[nottoc,numbib]{tocbibind}
\usepackage{polyglossia}
\usepackage{xcolor}
\usepackage{geometry}
\usepackage{eso-pic}
\usepackage{amssymb}
\setdefaultlanguage[variant=british]{english}
\graphicspath{ {./images/} }

% bibliography
\usepackage[british]{babel}
\usepackage{csquotes}
\usepackage[
    backend=biber,
    style=apa,
    sorting=nty
]{biblatex}
\DeclareLanguageMapping{english}{english-apa}
\addbibresource{refs.bib}

% Titles
\usepackage{titlesec}
\titlespacing*{\section}
    {0pt}
    {0pt}
    {2em}

\newcommand*{\documenttype}[1]{\gdef\@documenttype{#1}%
}
\newcommand*{\@documenttype}{Thesis}
\newcommand*{\orgunit}[1]{\gdef\@orgunit{#1}%
}
\newcommand*{\@orgunit}{School of Technology, Communication and Transport}
\newcommand*{\studyprogram}[1]{\gdef\@studyprogram{#1}%
}
\newcommand*{\@studyprogram}{Degree Programme in Information Technology, Cyber Security}
\definecolor{jamkblue}{RGB}{0,90,125}
\newcommand\BlueBox{%
  \put(40,40){%
    \color{jamkblue}\rule{27pt}{\LenToUnit{\paperheight-80pt}pt}%
  }
}
\renewcommand*{\maketitle}{%
\pagenumbering{globber}
\begin{titlepage}
  \AddToShipoutPicture*{\BlueBox}
  \includegraphics{jamklogo}
  \par
  \vspace{7cm}
  {\LARGE \bfseries \@title \\}
  \vspace{1cm}
  \@author
  \par
  \vspace{4cm}
  \@documenttype \\
  \@date \\
  \@orgunit \\
  \@studyprogram
  \vfill
  \includegraphics{jamklogo2}
\end{titlepage}
}

%% Description page
\newif\ifpublishpermission
\newcommand*{\descriptionauthor}[1]{\gdef\@descriptionauthor{#1}%
}
\newcommand*{\documentlanguage}[1]{\gdef\@documentlanguage{#1}%
}
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}%
}
\newcommand*{\assignedby}[1]{\gdef\@assignedby{#1}%
}
\newcommand*{\documentabstract}[1]{\gdef\@documentabstract{#1}%
}
\newcommand*{\keywords}[1]{\gdef\@keywords{#1}%
}
\newcommand*{\miscellanous}[1]{\gdef\@miscellanous{#1}%
}
\newcommand*{\makedescription}{%
  \pagenumbering{globber}
  \begin{minipage}{0.5\textwidth}
    \includegraphics{jamklogo}
  \end{minipage}
  \begin{minipage}{0.5\textwidth}
    \begin{flushright}
      \textbf{Description}\hspace{2.5cm}
    \end{flushright}
  \end{minipage}

  \begin{table}[hb]
    \begin{tabular}{|p{0.31\textwidth}|p{0.31\textwidth}|p{0.31\textwidth}|}
    \hline
    \multirow{3}{*}{\begin{tabular}[c]{@{}l@{}}Author(s)\\ \@descriptionauthor\end{tabular}} & \begin{tabular}[c]{@{}l@{}}Type of publication\\ \@documenttype\end{tabular} & \begin{tabular}[c]{@{}l@{}}Date\\ \@date\end{tabular} \\ \cline{2-3} 
      & \begin{tabular}[c]{@{}l@{}}Number of pages\\ \pageref{LastPage}\end{tabular} & \begin{tabular}[c]{@{}l@{}}Language of publication\\
    \@documentlanguage\end{tabular} \\ \cline{2-3} 
      &  & \begin{tabular}[c]{@{}l@{}}Permission for web\\publication:
      \ifpublishpermission\makebox[0pt][l]{$\checkmark$}$\square$\else\makebox[0pt][l]{}$\square$\fi\end{tabular} \\ \hline
    \multicolumn{3}{|l|}{\begin{tabular}[c]{@{}l@{}}Title of publication\\
    \@title\end{tabular}} \\ \hline
    \multicolumn{3}{|l|}{\begin{tabular}[c]{@{}l@{}}Degree programme\\
    \@studyprogram\end{tabular}} \\ \hline
    \multicolumn{3}{|l|}{\begin{tabular}[c]{@{}l@{}}Supervisor(s)\\
    \@supervisor\end{tabular}} \\ \hline
    \multicolumn{3}{|l|}{\begin{tabular}[c]{@{}l@{}}Assigned by\\
    \@assignedby\end{tabular}} \\ \hline
    \multicolumn{3}{|l|}{\begin{tabular}[c]{@{}l@{}}Abstract\\
    \@documentabstract\end{tabular}} \\ \hline
    \multicolumn{3}{|l|}{\begin{tabular}[c]{@{}l@{}}Keywords/tags\\
    \@keywords\end{tabular}} \\ \hline
    \multicolumn{3}{|l|}{\begin{tabular}[c]{@{}l@{}}Miscellanous\\
    \@miscellanous\end{tabular}} \\ \hline
    \end{tabular}
  \end{table}
  \vfill
}

%% Chapter formatting
\def\@makechapterhead#1{%
  \reset@font
  \vspace*{24\p@}%
  {\parindent \z@ 
    \begin{flushleft}
      \reset@font \bfseries \LARGE \thechapter \hspace{10pt} #1\par
    \end{flushleft}
    \vskip 12\p@
  }}
\def\@makeschapterhead#1{%
  \reset@font
  \vspace*{24\p@}%
  {\parindent \z@ 
    \begin{flushleft}
      \reset@font \bfseries \LARGE \vphantom{\thechapter} \hspace{10pt} #1\par
    \end{flushleft}
    \vskip 12\p@
  }}

%% Sub section formatting
\titleformat{\subsection}
    {\Large}
    {\thesubsection}
    {2em}
    {}

%% sub sub section formatting
\titleformat{\subsubsection}
    {\large}
    {\thesubsubsection}
    {2em}
    {}

% Fonts
\usepackage{fontspec}
\setmainfont{Carlito}

% set paragraph linespacing to 1.5
\renewcommand{\baselinestretch}{1.5}

% set top header
\setlength{\headheight}{15pt}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[R]{\thepage}

\sectionfont{\fontsize{18pt}{18pt}\selectfont}

\captionsetup[table]{
    font={stretch=2.0},
    justification=justified,
    singlelinecheck=false
}
\captionsetup[figure]{
    font={stretch=2.0},
    justification=justified,
    singlelinecheck=false
}
\captionsetup[listing]{
    font={stretch=2.0},
    justification=justified,
    singlelinecheck=false
}

% Figure command
%% Takes 4 parameters. width, path to image, caption and reference name. Width is optional
\newcommand{\jamkfigure}[4][6in]{
    \vspace{1em}
    \begin{figure}[h]
        \includegraphics[width=#1]{#2}
        \caption{#3}
        \label{#4}
    \end{figure}
    \vspace{1em}
}

% Set path to graphics folder
\graphicspath{ {images/} }

% Table command
% Takes 4 parameters. Caption, reference name, table layout and table contents
\newcommand{\jamktable}[4]{
    \vspace{1em}
    \begin{table}[h]
        \caption{#1}
        \begin{tabular}{ #3 }
            #4
        \end{tabular}
        \label{#2}
    \end{table}
    \vspace{1em}
}

\newcommand{\jamkcite}[2][{}]{
    (\cite[#1]{#2})
}
