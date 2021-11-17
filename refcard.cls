%% refcard.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{refcard}[2021/10/21 Refcard LaTeX class]

% default options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% load base class
\LoadClass[a4paper, twocolumn, 11pt]{article}


% ------------------------------------------------------------
% PACKAGES
% ------------------------------------------------------------

% Cork (T1) font encoding
% https://www.ctan.org/pkg/fontenc
\RequirePackage[T1]{fontenc}
% Fontspec
% https://www.ctan.org/pkg/fontspec
\RequirePackage{fontspec}
% Open Sans font
% https://www.ctan.org/pkg/sourcesanspro
%\RequirePackage[defaultsans]{opensans}%{sourcesanspro}
% Source Sans Pro font
% https://www.ctan.org/pkg/sourcesanspro
\RequirePackage[default]{sourcesanspro}%{sourcesanspro}
% FontAwesome icons
% https://www.ctan.org/pkg/fontawesome
\RequirePackage{fontawesome5}
% Layout design
% https://www.ctan.org/pkg/geometry
\RequirePackage[left=1.0cm,right=1.0cm,top=1.5cm,bottom=1.5cm]{geometry}
% Coloured and framed text boxes
% https://www.ctan.org/pkg/tcolorbox
\RequirePackage[minted,most]{tcolorbox}
% Programming code typesetting
% https://www.ctan.org/pkg/listings
\RequirePackage{listings}
% Conditionals
% https://www.ctan.org/pkg/ifthen
\RequirePackage{ifthen}
% Color extension
% https://www.ctan.org/pkg/xcolor
\RequirePackage{xcolor}
% Lipsum
% https://www.ctan.org/pkg/lipsum
\RequirePackage{lipsum} 
% Tocloft
% https://www.ctan.org/pkg/tocloft
\RequirePackage{tocloft}
% Calc
% https://www.ctan.org/pkg/calc
\RequirePackage{calc}
% Tikz
% https://www.ctan.org/pkg/tikz
\RequirePackage{tikz}
% Fancyhdr
% https://www.ctan.org/pkg/fancyhdr
\RequirePackage{fancyhdr}
% Datetime
% https://www.ctan.org/pkg/datetime
\RequirePackage{datetime}
% Minted
% https://www.ctan.org/pkg/minted
\RequirePackage{minted}
\usemintedstyle{tango}
\setmonofont{SourceSansPro-Regular.otf}

% ------------------------------------------------------------
% DEFINE COLORS
% ------------------------------------------------------------

% USE TANGO COLOR STYLE FOR MINTED
\usemintedstyle{tango}

% DEFINE TANGO COLOR PALETTE
% >> BUTTER
\definecolor{butter1}{HTML}{fce94f}
\definecolor{butter2}{HTML}{edd400}
\definecolor{butter3}{HTML}{c4a000}
% >> ORANGE
\definecolor{orange1}{HTML}{fcaf3e}
\definecolor{orange2}{HTML}{f57900}
\definecolor{orange3}{HTML}{ce5c00}
% >> CHOCOLATE
\definecolor{chocolate1}{HTML}{e9b96e}
\definecolor{chocolate2}{HTML}{c17d11}
\definecolor{chocolate3}{HTML}{8f5902}
% >> CHAMELEON
\definecolor{chameleon1}{HTML}{8ae234}
\definecolor{chameleon2}{HTML}{73d216}
\definecolor{chameleon3}{HTML}{4e9a06}
% >> SKYBLUE
\definecolor{skyblue1}{HTML}{729fcf}
\definecolor{skyblue2}{HTML}{3465a4}
\definecolor{skyblue3}{HTML}{204a87}
%>> PLUM
\definecolor{plum1}{HTML}{ad7fa8}
\definecolor{plum2}{HTML}{75507b}
\definecolor{plum3}{HTML}{5c3566}
% >> SCARLET
\definecolor{scarlet1}{HTML}{ef2929}
\definecolor{scarlet1}{HTML}{cc0000}
\definecolor{scarlet1}{HTML}{a40000}
% >> ALUMINIUM
\definecolor{aluminium1}{HTML}{eeeeec}
\definecolor{aluminium2}{HTML}{d3d7cf}
\definecolor{aluminium3}{HTML}{babdb6}
\definecolor{aluminium4}{HTML}{888a85}
\definecolor{aluminium5}{HTML}{555753}
\definecolor{aluminium6}{HTML}{2e3436}

% ------------------------------------------------------------
% DEFINE THEMES
% ------------------------------------------------------------

% Default theme color (Ansible/dark gray)
\colorlet{xctheme}{aluminium5} 

% Theme colors
\newcommand{\theme}[1]{
    % Default theme
    \ifthenelse{\equal{#1}{default}}{\colorlet{xctheme}{aluminium5}}{}
    % Project theme
    \ifthenelse{\equal{#1}{project}}{\colorlet{xctheme}{chameleon3}}{}
}


% ------------------------------------------------------------
% TITLE DESIGN
% ------------------------------------------------------------
\DeclareRobustCommand\ltseries{\fontseries{l}\selectfont}
\DeclareTextFontCommand{\textlt}{\ltseries}

% Re-define title command
\def\@title{refcard template} % Default title
\renewcommand{\title}[1]{\gdef\@title{#1}}

% Define logo command
\def\@logo{\includegraphics[height=2.0cm]{example-image-a}} % Default logo
\newcommand{\logo}[1]{\gdef\@logo{\includegraphics[height=2.0cm]{#1}}}

\renewcommand*{\maketitle}{
    \twocolumn[{%
    \begin{tikzpicture}
        %\draw[step=1cm,gray!50,very thin] (0,0) grid (\textwidth, 8);
        \draw[white, fill=white] (0,0) rectangle (\textwidth, 10);
        \draw[xctheme!10, line width=0.1em] (0,1) -- (\textwidth,1);
        \draw[xctheme!10, line width=0.1em] (0,10) -- (\textwidth,10);
        \draw[xctheme!10, fill=xctheme!10] (0.65\textwidth,1) rectangle (\textwidth, 10);
        \node[anchor=west, align=left] at (0., 5.5) {
            \begin{minipage}[][6cm][c]{0.6\textwidth}
    \flushleft\textcolor{xctheme}{\fontsize{50pt}{60pt}\selectfont\sourcesansprolight\lowercase{\@title}}
    \end{minipage}
        };
        \node[anchor=west, align=left] at (0.7\textwidth, 5.5) {\begin{minipage}[l][0.25\textwidth][c]{6cm}\color{aluminium5}\tableofcontents\end{minipage}};
    \end{tikzpicture}
    }]
    \thispagestyle{fancy}
}


% ------------------------------------------------------------
% SECTION TITLE DESIGN
% ------------------------------------------------------------

\renewcommand{\cfttoctitlefont}{\sffamily\bfseries\MakeUppercase}
\setlength\cftparskip{-0.5em}

%Remove section numbering
\setcounter{secnumdepth}{0}

% Remove section's page number
\cftpagenumbersoff{section}
\cftpagenumbersoff{subsection}
\cftpagenumbersoff{subsubsection}
 
 % Adjust sectional unit title fonts in ToC
\renewcommand{\cftsecfont}{\sffamily}
\renewcommand{\cftsubsecfont}{\sffamily}

% Section design
\renewcommand{\section}[1]{
    \addcontentsline{toc}{section}{\hspace{0.25em} \large\textbullet\ \hspace{0.25em} \normalsize #1}
    % Add some space before title
    \vspace{0.5em}
    % Section's title
    \textcolor{xctheme}{\bfseries\large\sffamily\uppercase{\noindent #1}}
}

% Subsection design
\renewcommand{\subsection}[1]{
    %\addcontentsline{toc}{section}{\hspace{0.25em} \large\textbullet\ \hspace{0.25em} \normalsize #1}
    % Add some space before title
    \vspace{0.5em}
    % Section's title
    \textcolor{xctheme}{\bfseries\normalsize\sffamily\uppercase{\noindent $\bullet$\ #1}}
}

% ------------------------------------------------------------
% PAGE HEADER FOOTER DESIGN
% ------------------------------------------------------------

% Initialize page style
\pagestyle{fancy}
\fancyhf{}

% Remove horizontal rume in header
\renewcommand{\headrulewidth}{0pt}

%Customize header
%\fancyhead[L]{\includegraphics[height=0.75cm]{images/devops-logo.png}}

% Customize footer
\fancyfoot[C]{\centering\protect\circled{\thepage}}
\newcommand*\circled[1]{\tikz[baseline]{\node[aluminium5, fill=aluminium5, shape=circle,draw,inner sep=2pt] (char) {\textcolor{white}{\sffamily#1}};}}

% ------------------------------------------------------------
% SET LISTING ENVIRONMENTS
% ------------------------------------------------------------
\tcbuselibrary{minted}
\tcbsetforeverylayer{autoparskip}
\tcbsetforeverylayer{before skip balanced=0.1\baselineskip}% plus 2pt}
\tcbsetforeverylayer{after skip balanced=0.5\baselineskip}% plus 2pt}

\newminted[myshell]{bash}{
    frame=lines,
    rulecolor=aluminium1,
    baselinestretch=1.2,
    bgcolor=aluminium1,
    fontsize=\small
}

\newcommand{\consolefgcolor}{%
  \def\FancyVerbFormatLine##1{\textcolor{aluminium1}{\$\ ##1}}%
}

\newcommand{\filefgcolor}{%
  \def\FancyVerbFormatLine##1{\textcolor{aluminium1}{##1}}%
}

% Define listing style for CLI 
\newtcblisting{ttyenv}{%
  listing only,%
  colback=aluminium5,%
  breakable,%
  colframe=aluminium5,%
  width = \columnwidth,%
  %center,%
  top=0pt,%
  bottom=0pt,%
  left=0pt,%
  arc=0pt,
  outer arc=0pt,
  listing engine=minted,%
  minted language=text,%
  minted options={%
    %autogobble,%
    fontsize=\footnotesize,%
    %tabsize=2,%
    frame=none,%
    formatcom=\consolefgcolor
  }%
}

% Listing environment for Dockerfiles
\newtcblisting{dockerbox}[1][]{%
  #1,
  fonttitle=\footnotesize	,
  listing only,%
  colback=aluminium5!10,%
  breakable,%
  colframe=aluminium5,%
  width = \columnwidth,%
  %center,%
  top=0pt,%
  bottom=0pt,%
  left=0pt,%
  arc=0pt,
  outer arc=0pt,
  listing engine=minted,%
  minted language=docker,%
  minted options={%
    %autogobble,%
    fontsize=\footnotesize,%
    %tabsize=2,%
    frame=none,
  }%
}

% Listing environment for YAML files
\newtcblisting{yamlbox}[1][]{%
  #1,
  fonttitle=\footnotesize	,
  listing only,%
  colback=aluminium5!10,%
  breakable,%
  colframe=aluminium5,%
  width = \columnwidth,%
  %center,%
  top=0pt,%
  bottom=0pt,%
  left=0pt,%
  arc=0pt,
  outer arc=0pt,
  listing engine=minted,%
  minted language=yaml,%
  minted options={%
    %autogobble,%
    fontsize=\footnotesize,%
    %tabsize=2,%
    frame=none,
  }%
}

\newtcblisting{filenv}[1][]{%
  #1,
  listing only,%
  colback=aluminium5!10,%
  breakable,%
  colframe=aluminium5,%
  width = \columnwidth,%
  %center,%
  top=0pt,%
  bottom=0pt,%
  left=0pt,%
  arc=0pt,
  outer arc=0pt,
  listing engine=minted,%
  minted language=text,%
  minted options={%
    %autogobble,%
    fontsize=\footnotesize,%
    %tabsize=2,%
    frame=none,
  }%
}


% ------------------------------------------------------------
% SET SOME DOCUMENT PARAMETERS 
% ------------------------------------------------------------

\AtBeginDocument{%
    % Sans serif family
    \sffamily
    % No indent
    \setlength{\parindent}{0pt}
    % Text color
    \color{aluminium4}
}


% ------------------------------------------------------------
% SET LICENSE COMMAND
% ------------------------------------------------------------

\newcommand{\rflicense}{
    \begin{tcolorbox}[colback=white, colframe=xctheme, left=1.0em,right=1.0em,top=0.5em,bottom=0.5em,boxrule=1pt, fonttitle=\bfseries]
    \centering This work is licensed under the CC-BY-SA 4.0 International license \\ 
    \centering \Large \faCreativeCommons\ \faCreativeCommonsBy\ \faCreativeCommonsSa
    \end{tcolorbox}
}