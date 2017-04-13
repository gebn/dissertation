% adapted from ociamthesis v2.2
% https://www.maths.ox.ac.uk/members/it/faqs/latex/thesis-class
%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bhamdissertation}[2017/04/03 v0.1 University of Birmingham dissertation class]
%-------------------------- initial code -----------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
%\LoadClass[a4paper]{report}
% As an alternative to the above could use next line for twosided output
\LoadClass[a4paper,twoside,openright]{report}

\RequirePackage{graphicx} % needed for latest frontpage logo
\RequirePackage{emptypage} % hide page numbers on empty pages

\raggedbottom

%define the default submitted text
\newcommand{\submittedtext}{{A dissertation submitted for the degree of}}

%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
\def\college#1{\gdef\@college{#1}}

%
% Setup choosen crest/logo
%
\def\logo{{\includegraphics[width=32mm]{crest.png}}}

%
% Define text area of page and margin offsets
%
\setlength{\topmargin}{0.0in}
\setlength{\oddsidemargin}{0.33in}
\setlength{\evensidemargin}{-0.08in}
\setlength{\textheight}{9.0in}
\setlength{\textwidth}{6.0in}

%
% Environments
%

% This macro define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}

%define title page layout
\renewcommand{\maketitle}{%
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
  \null\vfill
  \begin{center}
    % title
    {\Huge
        {\bfseries {\@title}} \par}
    
    % crest
    {\large
        \vspace*{35mm}
        {\logo \par}
        \vspace*{20mm}}
    
    % author & supervisor
    {{\Large \@author} \par}
    {\large
        \vspace*{1ex}{{1220556} \par}}
    {\large
        \vspace*{2ex}{Supervised by Dr Ian Batten} \par}
    
    {\Large
        \vspace*{12mm}{{\@college} \par}}
    
    {\large
        \vspace*{1ex}{University of Birmingham \par}
        \vspace*{12mm}{{\submittedtext} \par}
        \vspace*{1ex}{\it {\@degree} \par}
        \vspace*{2ex}{\today}}
  \end{center}
  \null\vfill
\end{alwayssingle}}

% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{\begin{alwayssingle} \thispagestyle{plain}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}


%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\renewenvironment{abstract} {\begin{alwayssingle} % \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractlong} {\begin{alwayssingle} \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}}
{\end{alwayssingle}}

%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}
