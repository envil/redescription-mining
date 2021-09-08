%%
%% This is file `uefcsthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% uefcsthesis.dtx  (with options: `cs')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2018 by Pauli Miettinen <pauli.miettinen@uef.fi>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3c of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2006/05/20 or later.
%% 
%% 
\NeedsTeXFormat{LaTeX2e}[2003/12/01]
\ProvidesClass{uefcsthesis}
  [2021/05/05 v0.5.2 UEF School of Computing BSc and MSc thesis class]
\newif\ifuef@mscthesis\uef@mscthesistrue
\newif\ifuef@twoside\uef@twosidefalse
\newif\ifuef@osf\uef@osffalse
\newif\ifuef@polyglossia\uef@polyglossiafalse
\newif\ifuef@finnish\uef@finnishtrue
\newcommand{\uef@language}{finnish}
\newif\ifuef@numbertheoremsbychapter\uef@numbertheoremsbychaptertrue
\newif\ifuef@singlemathnumber\uef@singlemathnumbertrue
\newif\ifuef@biblatex\uef@biblatexfalse
\newcommand{\uef@biblatexstyle}{authoryear-comp}
\newif\ifuef@hyperref\uef@hyperreftrue
\newif\ifuef@pdfa\uef@pdfafalse

\DeclareOption{mscthesis}{\uef@mscthesistrue}
\DeclareOption{bscthesis}{%
  \uef@mscthesisfalse%
  \uef@twosidefalse%
  \uef@numbertheoremsbychapterfalse%
}
\DeclareOption{gradu}{\uef@mscthesistrue}
\DeclareOption{kandi}{%
  \uef@mscthesisfalse%
  \uef@twosidefalse%
  \uef@numbertheoremsbychapterfalse%
}
\DeclareOption{oneside}{\uef@twosidefalse}
\DeclareOption{twoside}{\uef@twosidetrue}
\DeclareOption{polyglossia}{\uef@polyglossiatrue}
\DeclareOption{finnish}{\uef@finnishtrue\renewcommand{\uef@language}{finnish}}
\DeclareOption{english}{\uef@finnishfalse\renewcommand{\uef@language}{english}}
\DeclareOption{british}{\uef@finnishfalse\renewcommand{\uef@language}{british}}
\DeclareOption{osf}{\uef@osftrue}
\DeclareOption{lining}{\uef@osffalse}
\DeclareOption{bibtex}{\uef@biblatexfalse}
\DeclareOption{biblatex}{\uef@biblatextrue}
\DeclareOption{numeric}{\renewcommand{\uef@biblatexstyle}{numeric-comp}}
\DeclareOption{authoryear}{\renewcommand{\uef@biblatexstyle}{authoryear-comp}}
\DeclareOption{chaptermathnum}{\uef@numbertheoremsbychaptertrue}
\DeclareOption{runningmathnum}{\uef@numbertheoremsbychapterfalse}
\DeclareOption{sharedtheoremnumbers}{\uef@singlemathnumbertrue}
\DeclareOption{separatetheoremnumbers}{\uef@singlemathnumberfalse}
\DeclareOption{hyperref}{\uef@hyperreftrue}
\DeclareOption{nohyperref}{\uef@hyperreffalse}
\DeclareOption{pdfa}{\uef@pdfatrue}
\DeclareOption{nopdfa}{\uef@pdfafalse}
\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{final}{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions\relax
\ifuef@mscthesis
  \def\@tempa{Master's thesis}
\else
  \def\@tempa{Bachelor's thesis}
\fi
\ifuef@twoside
  \def\@tempb{two-sided}
\else
  \def\@tempb{one-sided}
\fi
\ifuef@osf
  \def\@tempc{old-style}
\else
  \def\@tempc{lining}
\fi
\ifuef@biblatex
  \ClassInfo{uefcsthesis}{Creating a \@tempa\space in \uef@language . \MessageBreak
    Using BibLaTeX with style \uef@biblatexstyle .\MessageBreak
    Layout is \@tempb \MessageBreak
    and numbers \@tempc
  }
\else % BibTeX
  \ClassInfo{uefcsthesis}{Creating a \@tempa\space in \uef@language . \MessageBreak
    Using BibTeX with style \uef@biblatexstyle .\MessageBreak
    Layout is \@tempb \MessageBreak
    and numbers \@tempc
  }
\fi
\ifuef@twoside
  \PassOptionsToClass{twoside}{book}
\else
  \PassOptionsToClass{oneside}{book}
\fi
\LoadClass[a4paper,12pt]{book}

\RequirePackage[a4paper,%
top=3cm,%
left=35mm,%
right=30mm,%
bottom=20mm,%
head=0pt,%
headsep=0pt,%
foot=12pt,%
footskip=13mm,
]%
{geometry}
\RequirePackage{ifxetex}
\RequirePackage{ifluatex}
\RequirePackage{ifthen}
\newif\ifuef@modern
\ifthenelse{\boolean{xetex}\OR\boolean{luatex}}{\uef@moderntrue}{\uef@modernfalse}
\ifuef@modern
\else
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
\fi
\RequirePackage{amsthm}
\ifuef@modern\else
  \ifuef@osf
    \RequirePackage[theoremfont,osf]{newtxtext}
  \else
    \RequirePackage[theoremfont]{newtxtext}
  \fi
\fi
\RequirePackage{textcomp}
\RequirePackage[varg]{newtxmath}
\RequirePackage{bm}
\ifuef@modern
  \RequirePackage[no-math]{fontspec}
  \ifuef@osf
    \setmainfont[Numbers=OldStyle]{TeX Gyre Termes}
  \else
    \setmainfont{TeX Gyre Termes}
  \fi
  \DeclareSymbolFont{operators}{\encodingdefault}{\familydefault}{m}{n}
\fi
\setlength{\parindent}{0pt}
\setlength{\parskip}{1em \@plus 1em}
\RequirePackage[onehalfspacing]{setspace}[2011/12/19]
\RequirePackage{csquotes}
\ifuef@polyglossia
  \RequirePackage{polyglossia}
  \ifuef@finnish
    \setdefaultlanguage{finnish}
    \setotherlanguages{english,swedish}
  \else
    \ifthenelse{\equal{\uef@language}{english}}{%
      \setdefaultlanguage{english}%
    }{%
      \setdefaultlanguage[british]{english}%
    }
    \setotherlanguages{finnish,swedish}
  \fi % \ifuef@finnish
\else % using babel
  \RequirePackage[main=\uef@language,swedish,finnish,english,british]{babel}[2013/04/07]
\fi % \ifuef@polyglossia
\RequirePackage[final,babel]{microtype}

\def\@makechapterhead#1{%
  \vspace*{50\p@}% some empty space
  {\parindent \z@ \raggedright \normalfont
    \interlinepenalty \@M
    \Huge \bfseries \thechapter. \hspace{1ex} #1\par\nobreak
    \vskip 40\p@
  }%
}
\RequirePackage{fancyhdr}
\ifuef@twoside
  \fancypagestyle{plain}{%
    \fancyhf{}% Clear all
    \fancyfoot[RO,LE]{\thepage}%
  }
\else
  \fancypagestyle{plain}{%
    \fancyhf{}% Clear all
    \fancyfoot[C]{\thepage}%
  }
\fi
\fancypagestyle{empty}{\fancyhf{}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\frontmatter}{%
  \cleardoublepage
  \pagenumbering{roman}
  \pagestyle{plain}
  \newenvironment{preface}{\chapter*{\uef@s@prefacename}}{}
  \newenvironment{acknowledgements}{\chapter*{\uef@s@acknowledgementsname}}{}
}
\addto\captionsfinnish{\def\uef@s@prefacename{Esipuhe}}
\addto\captionsenglish{\def\uef@s@prefacename{Preface}}
\addto\captionsbritish{\def\uef@s@prefacename{Preface}}
\addto\captionsfinnish{\def\uef@s@acknowledgementsname{Kiitokset}}
\addto\captionsenglish{\def\uef@s@acknowledgementsname{Acknowledgments}}
\addto\captionsbritish{\def\uef@s@acknowledgementsname{Acknowledgements}}
\renewcommand{\mainmatter}{%
  \cleardoublepage
  \pagenumbering{arabic}
  \pagestyle{plain}
  \def\preface{\ClassError{uefcsthesis}%
    {Environment 'preface' can only be used in preface}%
    {You must put the environment 'preface' before the \MessageBreak
      \noexpand\mainmatter command.}}
  \def\acknowledgements{\ClassError{uefcsthesis}%
    {Environment 'acknowledgements' can only be used in preface}%
    {You must put the environment 'acknowledgements' before the \MessageBreak
      \noexpand\mainmatter command.}}
}
\renewcommand{\backmatter}{%
  \label{LastNormalPage}
  \cleardoublepage
  \pagestyle{plain}
}
\RequirePackage[titletoc,]{appendix}
\ifuef@finnish
  \renewcommand{\appendixname}{Liite}
  \renewcommand{\appendixtocname}{Liitteet}
  \renewcommand{\appendixpagename}{Liitteet}
\else
  \renewcommand{\appendixtocname}{List of appendices}
\fi

\ifuef@biblatex
  \RequirePackage[natbib=true,
  sorting=nyt,
  sortcites=true,
  style=apa,
  ]
  {biblatex}
  % Update language-specific strings
  \DefineBibliographyStrings{english}{%
    bibliography = {References},
    references = {References},
  }
  \DefineBibliographyStrings{finnish}{%
    bibliography = {Viitteet},
    references = {Viitteet},
  }
\else
  \RequirePackage[natbibapa]{apacite}
  \bibliographystyle{apacite}
  \addto\captionsfinnish{
    \renewcommand{\bibname}{Viitteet}
  }
  \addto\captionsenglish{
    \renewcommand{\bibname}{References}
  }
  \addto\captionsfinnish{
    \renewcommand{\BCBT}{}
    \renewcommand{\BCBL}{}
  }
\fi % Using BibTeX
\RequirePackage[nottoc]{tocbibind}

\RequirePackage{xparse}
\gdef\@author@first{}
\gdef\@author@family{}
\renewcommand{\author}[2]{\gdef\@author@first{#1}%
  \gdef\@author@family{#2}%
  \gdef\@author{#1\space #2}%
}
\def\uef@supervisor@first{\ClassWarning{uefcsthesis}{First supervisor is not defined}}
\newcommand{\firstsupervisor}[1]{\def\uef@supervisor@first{#1}}
\newcommand{\secondsupervisor}[1]{\def\uef@supervisor@second{#1}}
\DeclareDocumentCommand{\title}{ O{\uef@language} m }{
  \def\lang{#1}
  \expandafter\addto\csname captions\lang\endcsname{\def\@title{#2}}
}
\DeclareDocumentCommand{\subtitle}{ O{\uef@language} m }{
  \def\lang{#1}
  \expandafter\addto\csname captions\lang\endcsname{\def\@subtitle{#2}}
}
\DeclareDocumentCommand{\date}{ O{\uef@language} m }{
  \def\lang{#1}
  \expandafter\addto\csname captions\lang\endcsname{\def\@date{#2}}
}
\def\uef@keywords{}
\def\uef@all@keywords{}
\providecommand{\sep}{\leavevmode\unskip ;\space}
\DeclareDocumentCommand{\keywords}{ O{\uef@language} m }{
  \def\lang{#1}
  \expandafter\addto\csname captions\lang\endcsname{\def\uef@keywords{#2}}
  \let\@tempa\uef@all@keywords
  \def\uef@all@keywords{\@tempa \sep \uef@keywords}
}
\def\uef@city{\ClassError{uefcsthesis}%
  {Thesis city is not defined}%
  {You must define the city of the thesis (Joensuu or Kuopio)\MessageBreak
    using \noexpand\city command}}
\DeclareDocumentCommand{\city}{ o m }{
  \IfNoValueTF {#1} {
    \addto\captionsfinnish{\def\uef@city{#2}}
    \addto\captionsenglish{\def\uef@city{#2}}
    \addto\captionsbritish{\def\uef@city{#2}}
  }
  {
    \def\lang{#1}
    \expandafter\addto\csname captions\lang\endcsname{\def\uef@city{#2}}
  }
}

\DeclareDocumentCommand \setstring { o m m } {%
  \IfNoValueTF {#1} {%
    \set@string {\uef@language} {#2} {#3}%
  }{%
    \set@string {#1} {#2} {#3}%
  }%
}
\newcommand{\set@string}[3]{%
  \def\lang{#1}
\expandafter\addto\csname captions\lang \endcsname{%
  \expandafter\renewcommand\csname uef@s@#2\endcsname{#3}%
}
}
\ifuef@mscthesis
  \addto\captionsfinnish{\def\uef@s@thesistype{Pro gradu -tutkielma}}
  \addto\captionsenglish{\def\uef@s@thesistype{Master's thesis}}
  \addto\captionsbritish{\def\uef@s@thesistype{Master's thesis}}
\else
  \addto\captionsfinnish{\def\uef@s@thesistype{Kandidaatintutkielma}}
  \addto\captionsenglish{\def\uef@s@thesistype{Bachelor's thesis}}
  \addto\captionsbritish{\def\uef@s@thesistype{Bachelor's thesis}}
\fi
\addto\captionsfinnish{\def\uef@s@field{Tietojenkäsittelytiede}}
\addto\captionsenglish{\def\uef@s@field{Computer Science}}
\addto\captionsbritish{\def\uef@s@field{Computer Science}}
\addto\captionsfinnish{%
  \def\uef@s@departmentname{Tietojenkäsittelytieteen laitos}}
\addto\captionsenglish{%
  \def\uef@s@departmentname{School of Computing}}
\addto\captionsbritish{%
  \def\uef@s@departmentname{School of Computing}}
\addto\captionsfinnish{%
  \def\uef@s@facultyname{Luonnontieteiden ja metsätieteiden tiedekunta}}
\addto\captionsenglish{%
  \def\uef@s@facultyname{Faculty of Science and Forestry}}
\addto\captionsbritish{%
  \def\uef@s@facultyname{Faculty of Science and Forestry}}
\addto\captionsfinnish{%
  \def\uef@s@universityname{Itä-Suomen yliopisto}}
\addto\captionsenglish{%
  \def\uef@s@universityname{University of Eastern Finland}}
\addto\captionsbritish{%
  \def\uef@s@universityname{University of Eastern Finland}}
\addto\captionsfinnish{\def\uef@s@pages{s.}}
\addto\captionsenglish{\def\uef@s@pages{p.}}
\addto\captionsbritish{\def\uef@s@pages{p.}}
\addto\captionsfinnish{\def\uef@s@and{ja}}
\addto\captionsenglish{\def\uef@s@and{and}}
\addto\captionsbritish{\def\uef@s@and{and}}
\addto\captionsfinnish{\def\uef@s@keywordsname{Avainsanat}}
\addto\captionsenglish{\def\uef@s@keywordsname{Keywords}}
\addto\captionsbritish{\def\uef@s@keywordsname{Keywords}}
\addto\captionsfinnish{\def\uef@s@supervisorname{Ohjaaja}}
\addto\captionsenglish{\def\uef@s@supervisorname{Supervisor}}
\addto\captionsbritish{\def\uef@s@supervisorname{Supervisor}}
\addto\captionsfinnish{\def\uef@s@supervisorsname{Ohjaajat}}
\addto\captionsenglish{\def\uef@s@supervisorsname{Supervisors}}
\addto\captionsbritish{\def\uef@s@supervisorsname{Supervisors}}
\addto\captionsfinnish{\def\uef@s@app@o{liite}\def\uef@s@app@m{liitettä}}
\addto\captionsenglish{\def\uef@s@app@o{appendix}\def\uef@s@app@m{appendices}}
\addto\captionsbritish{\def\uef@s@app@o{appendix}\def\uef@s@app@m{appendices}}
\def\ccsname{ACM CCS (2012)}
\def\uef@logo{uef_logo}
\RequirePackage{graphicx}

\ifuef@polyglossia
\let\uef@selectlanguage=\selectlanguage
\else
\newcommand{\uef@selectlanguage}[1]{%
  \begingroup\edef\x{\endgroup
    \noexpand\selectlanguage{#1}}\x
}
\fi
\renewcommand{\maketitle}{%
  \hypersetup{pageanchor=false}
  \begin{titlepage}%
    \uef@selectlanguage{\uef@language}
    \null\vspace{0.5cm}
    \begin{center}
      {\LARGE \@title \par}
      \ifdefined\@subtitle
        {\Large \@subtitle \par}
      \fi
      \vspace{1.5cm}
      {\large \@author \par}
      \vfill
      {\large \uef@s@thesistype\\
        \vspace{1em}
        \includegraphics[height=7cm]{\uef@logo}\\
        \uef@s@departmentname\\
        \uef@s@field\\
        \@date \par}
    \end{center}
  \end{titlepage}%
  \hypersetup{pageanchor=true}
}
\newcounter{uef@appendixcounter}
\newcounter{uef@appendixpages}
\newcommand{\numberofappendices}[1]{\setcounter{uef@appendixcounter}{#1}}
\newcommand{\appendixpagecount}[1]{\setcounter{uef@appendixpages}{#1}}
\def\uef@printappendixpagenumbers{%
 \ifnum\value{uef@appendixcounter}>0
   ,\space
   \ifcase\value{uef@appendixcounter}\relax
   \or%
     \arabic{uef@appendixcounter}~\uef@s@app@o%
   \else
     \arabic{uef@appendixcounter}~\uef@s@app@m%
   \fi
   \space (\arabic{uef@appendixpages}~\uef@s@pages)
 \fi
}
\newcommand{\uef@printsupervisors}%
{\@ifundefined{uef@supervisor@second}%
  {\uef@s@supervisorname :\space \uef@supervisor@first}%
  {\uef@s@supervisorsname :\space \uef@supervisor@first\space%
    \uef@s@and\space\uef@supervisor@second}%
}
\RequirePackage{comment}
\excludecomment{CCSXML}
\let\@concepts\@empty
\newcommand\ccsdesc[2][100]{%
  \ccsdesc@parse#1~#2~}
%%\RequirePackage{textcomp} % already included
\def\ccsdesc@parse#1~#2~#3~{%
  \expandafter\ifx\csname CCS@#2\endcsname\relax
    \expandafter\gdef\csname CCS@#2\endcsname{\textbullet\textbf{#2} \textrightarrow }%
  \g@addto@macro{\@concepts}{\csname CCS@#2\endcsname}\fi
  \expandafter\g@addto@macro\expandafter{\csname CCS@#2\endcsname}{%
    \ifnum#1>499\textbf{#3; }\else
    \ifnum#1>299\textit{#3; }\else
  #3; \fi\fi}}
\newenvironment{abstract}[1][\uef@language]{%
  \hypersetup{pageanchor=false}
  \titlepage
  \uef@selectlanguage{#1}
  \singlespacing
  \textsc{\large\MakeLowercase{\uef@s@universityname}},
  \uef@s@facultyname , \uef@city\\
  \uef@s@departmentname\\
  \uef@s@field\\[2em]
  \@author@family , \@author@first : \@title
  \ifdefined\@subtitle\space -- \@subtitle\fi\\
  \uef@s@thesistype ,\space \pageref{LastNormalPage}~\uef@s@pages %
  \uef@printappendixpagenumbers\\
  \uef@printsupervisors\\
  \@date \par
  \paragraph{\abstractname :}
}%
{\vspace{2em}
  \paragraph{\uef@s@keywordsname :} \uef@keywords\par
  \ifx\@concepts\empty\else\bgroup
    {\paragraph{\ccsname}\mbox{}\\ \@concepts\par }\egroup
  \fi
  \endtitlepage
  \hypersetup{pageanchor=true}}

\addto\captionsfinnish{\def\uef@s@theoremname{Lause}}
\addto\captionsenglish{\def\uef@s@theoremname{Theorem}}
\addto\captionsbritish{\def\uef@s@theoremname{Theorem}}
\addto\captionsfinnish{\def\uef@s@lemmaname{Lemma}}
\addto\captionsenglish{\def\uef@s@lemmaname{Lemma}}
\addto\captionsbritish{\def\uef@s@lemmaname{Lemma}}
\addto\captionsfinnish{\def\uef@s@corollaryname{Korollaari}}
\addto\captionsenglish{\def\uef@s@corollaryname{Corollary}}
\addto\captionsbritish{\def\uef@s@corollaryname{Corollary}}
\addto\captionsfinnish{\def\uef@s@propositionname{Propositio}}
\addto\captionsenglish{\def\uef@s@propositionname{Proposition}}
\addto\captionsbritish{\def\uef@s@propositionname{Proposition}}
\addto\captionsfinnish{\def\uef@s@conjecturename{Konjektuuri}}
\addto\captionsenglish{\def\uef@s@conjecturename{Conjecture}}
\addto\captionsbritish{\def\uef@s@conjecturename{Conjecture}}
\addto\captionsfinnish{\def\uef@s@definitionname{Määritelmä}}
\addto\captionsenglish{\def\uef@s@definitionname{Definition}}
\addto\captionsbritish{\def\uef@s@definitionname{Definition}}
\addto\captionsfinnish{\def\uef@s@problemname{Ongelma}}
\addto\captionsenglish{\def\uef@s@problemname{Problem}}
\addto\captionsbritish{\def\uef@s@problemname{Problem}}
\addto\captionsfinnish{\def\uef@s@examplename{Esimerkki}}
\addto\captionsenglish{\def\uef@s@examplename{Example}}
\addto\captionsbritish{\def\uef@s@examplename{Example}}
\addto\captionsfinnish{\def\uef@s@remarkname{Huomautus}}
\addto\captionsenglish{\def\uef@s@remarkname{Remark}}
\addto\captionsbritish{\def\uef@s@remarkname{Remark}}
\addto\captionsfinnish{\def\uef@s@notename{Merkintä}}
\addto\captionsenglish{\def\uef@s@notename{Note}}
\addto\captionsbritish{\def\uef@s@notename{Note}}
\theoremstyle{plain}
\ifuef@numbertheoremsbychapter
  \newtheorem{theorem}{\uef@s@theoremname}[chapter]
\else
  \newtheorem{theorem}{\uef@s@theoremname}
\fi
\ifuef@singlemathnumber
  \newtheorem{lemma}[theorem]{\uef@s@lemmaname}
  \newtheorem{corollary}[theorem]{\uef@s@corollaryname}
  \newtheorem{proposition}[theorem]{\uef@s@propositionname}
  \newtheorem{conjecture}[theorem]{\uef@s@conjecturename}
\else
  \newtheorem{lemma}{\uef@s@lemmaname}
  \newtheorem{corollary}{\uef@s@corollaryname}
  \newtheorem{proposition}{\uef@s@propositionname}
  \newtheorem{conjecture}{\uef@s@conjecturename}
\fi
\let\cor\corollary \let\endcor\endcorollary
\let\prop\proposition \let\endprop\endproposition
\theoremstyle{definition}
\ifuef@numbertheoremsbychapter
  \newtheorem{definition}{\uef@s@definitionname}[chapter]
  \newtheorem{problem}{\uef@s@problemname}[chapter]
  \newtheorem{example}{\uef@s@examplename}[chapter]
\else
  \newtheorem{definition}{\uef@s@definitionname}
  \newtheorem{problem}{\uef@s@problemname}
  \newtheorem{example}{\uef@s@examplename}
\fi%
\theoremstyle{remark}
\newtheorem*{remark}{\uef@s@remarkname}
\newtheorem*{note}{\uef@s@notename}
\ifuef@numbertheoremsbychapter%
\else
  \RequirePackage{chngcntr}
  \counterwithout{equation}{chapter}
\fi
\RequirePackage{mathtools}
\DeclarePairedDelimiter\abs{\lvert}{\rvert}
\DeclarePairedDelimiter\norm{\lVert}{\rVert}
\DeclareMathDelimiter{\lOpen}{\mathopen}{operators}{93}{largesymbols}{3}
\DeclareMathDelimiter{\rOpen}{\mathclose}{operators}{91}{largesymbols}{2}
\DeclarePairedDelimiter\lointerval{\lOpen}{\rbrack}
\DeclarePairedDelimiter\rointerval{\lbrack}{\rOpen}
\DeclarePairedDelimiter\ointerval{\lOpen}{\rOpen}

\RequirePackage[%
  figureposition=bottom,%
  tableposition=top,%
  labelfont=bf,%
]{caption}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{tabularx}
\newcolumntype{C}{>{$}c<{$}}
\newcolumntype{L}{>{$}l<{$}}
\newcolumntype{R}{>{$}r<{$}}
\addto\captionsfinnish{\def\algorithmcfname{Algoritmi}}
\addto\captionsenglish{\def\algorithmcfname{Algorithm}}
\addto\captionsbritish{\def\algorithmcfname{Algorithm}}
\addto\captionsfinnish{\def\listalgorithmcfname{Algoritmiluettelo}}
\addto\captionsenglish{\def\listalgorithmcfname{List of Algorithms}}
\addto\captionsbritish{\def\listalgorithmcfname{List of Algorithms}}
\providecommand{\floatname}[2]{}
\addto\captionsfinnish{\floatname{algorithm}{Algoritmi}}
\addto\captionsengligh{\floatname{algorithm}{Algorithm}}
\addto\captionsbritish{\floatname{algorithm}{Algorithm}}
\addto\captionsfinnish{\def\listalgorithmname{Algoritmiluettelo}}
\addto\captionsenglish{\def\listalgorithmname{List of Algorithms}}
\addto\captionsbritish{\def\listalgorithmname{List of Algorithms}}
\addto\captionsfinnish{\def\lstlistingname{Listaus}}
\addto\captionsenglish{\def\lstlistingname{Listing}}
\addto\captionsbritish{\def\lstlistingname{Listing}}
\addto\captionsfinnish{\def\lstlistlistingname{Listausluettelo}}
\addto\captionsenglish{\def\lstlistingname{List of Listings}}
\addto\captionsbritish{\def\lstlistingname{List of Listings}}
\RequirePackage{etoolbox}
\AtEndPreamble{
\ifdefined\@subtitle
  \def\uef@pdf@title{\@title{} - \@subtitle}
\else
  \def\uef@pdf@title{\@title}
\fi
\ifdefined\@author@first
  \def\uef@pdf@author{\@author@family , \@author@first}
\else
  \def\uef@pdf@author{}
\fi
\def\uef@pdf@subject{\uef@s@thesistype, %
  \uef@s@field. \uef@s@universityname, %
  \uef@s@facultyname}
}
\ifuef@pdfa
  \AtEndPreamble{%
    \uef@selectlanguage{\uef@language}%
    \RequirePackage{colorprofiles}
    \RequirePackage[a-1b,mathxmp]{pdfx}[2018/12/22]%
    \hypersetup{pdfstartview=}
  }
\fi
\ifuef@hyperref
\ifuef@pdfa\else
  \RequirePackage{hyperref}
  \AtBeginDocument{
  \let\oldsep\sep
  \def\sep{,\space}
  \hypersetup{pdfauthor={\uef@pdf@author},
    pdftitle={\uef@pdf@title},
    pdfkeywords={\uef@all@keywords},
    pdfsubject={\uef@pdf@subject}
  }
  \let\sep\oldsep
  }%
\fi\fi % \ifhyperref\ifpdfa
\providecommand{\hypersetup}[1]{}
\pagestyle{empty}
\endinput
%%
%% End of file `uefcsthesis.cls'.
