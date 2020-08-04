% Class-definition
\ProvidesClass{e2ereport}[2017/05/16 Very nice reports...]
\LoadClass[a4paper,twoside,\reportfontsize pt]{report}


% Contents:

% Latex Setup
%%% General setup
%%% Language
%%% Fonts
%%% Hyperlinks
%%% Basic Layout
%%% Page Layout
%%% TOC
%%% Graphics and Tables 
%%% Lists, etc.
%%% Math
%%% Nomenclature
%%% Bibliography
%%% Fun Stuff

% Feature Macros
%%% Sections Maker Macros
%%% Tables Macros
%%% Figure Macros
%%% Box Environment Macros
%%% Cross Reference Macros
%%% Symbols Macros

% FORMATTER MACROS
%%% 




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% L A T E X   S E T U P %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% General setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[utf8]{inputenc}

% scripting stuff
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{etoolbox}
\RequirePackage[nomessages]{fp}


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Language
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[USenglish]{babel}					% or ngerman, dutch or french
\RequirePackage[ddmmyy]{datetime}
\renewcommand{\dateseparator}{-}


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonts 
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[T1]{fontenc}
%\RequirePackage{palatino}
%\RequirePackage{eulervm}
\RequirePackage{helvet}
\RequirePackage{amsmath}
%\RequirePackage{amssymb}
%\RequirePackage{textcomp}
\RequirePackage{gensymb}
\renewcommand{\sfdefault}{phv}


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hyperlinks
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{url}
\RequirePackage{hyperref}

% colors
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}% Colors
%\RequirePackage[usenames, dvipsnames]{color}
\RequirePackage{colortbl}
\definecolor{mygreen}{RGB}{28,172,0} % color values Red, Green, Blue
\definecolor{mylilas}{RGB}{170,55,241}

%\hypersetup{colorlinks=true}
\hypersetup{pdfborder={0 0 0}, colorlinks, linkcolor=NavyBlue, citecolor=NavyBlue}
%\hypersetup{linkbordercolor=NavyBlue, citebordercolor=DarkGreen}


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Basic Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{rotating}
\RequirePackage{layout}
\RequirePackage{geometry}
\RequirePackage{setspace}

% Basic geometry
\setlength\parindent{\parindentdefault}
\setlength{\parskip}{\parskipdefault}
\sloppy 								%fixes some hyphenation stuff
\widowpenalty10000					% Disallow widows --> page breaks are more appropriate
\clubpenalty10000

%\setstretch{0.8} % make stuff look ugly and crammed
\setstretch{1} % normal


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
% Reset Headers to do nothing
\fancyhf{}
% Reset Headers to do something
\fancyhead[L]{\headleft}
\fancyfoot[C]{\thepage}
\fancyhead[R]{\headright}
\fancyfoot[L]{\footleft}

% basic pagestyle
\pagestyle{empty}%
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sections and Titles Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{bm}
\RequirePackage{sectsty}
\RequirePackage{titlesec}
\RequirePackage{tocloft}% http://ctan.org/pkg/tocloft

% Title Fonts
\allsectionsfont{\sffamily} % section headings look nicer when they are not serif

% Numbering of Sections
%\renewcommand{\thechapter}{\Numberstring{chapter}}
\setcounter{secnumdepth}{3}
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{chapter}.\arabic{section}.\arabic{subsection} (\alph{subsubsection})}
\numberwithin{equation}{chapter} % get equtions as 1.1 or stuff for sections
\numberwithin{figure}{chapter}% get figures as 1.1 or stuff for sections
\numberwithin{table}{chapter}% get tables as 1.1 or stuff for sections
%\setlength{\cftchapnumwidth}{3em}% Set length of number width in ToC for \chap, sec or subsec% Bib name

% Chapter page layout
\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{} % Header and footer also for pages with chapter headings (NOT SURE IF THIS IS NEEDED WITH THE IN-COLUMN HACK BUT KEPT FOR COMPLIANCE WITH onecol)
   \makeatletter                          % Make in-column chapter title for 2col
   	  \renewcommand\chapter{\global\@topnum\z@
                       	    \@afterindentfalse
                       	    \secdef\@chapter\@schapter}
   	  \def\@topnewpage[#1]{#1}
   \makeatother

% no page break before chapter pages
% \makeatletter
 %    \patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}
% \makeatother

%% Reduce whitespace before every chapter
\titleformat{\chapter}[hang]
      {\sffamily\huge\bfseries}% global formatting (number and title)
      {\chaptertitlename\ \thechapter:}% label: number and its formatting
      {0.7em}% spacing between number and title
      {}% optional (content between number and title)
\titlespacing*{\chapter}
      {0pt}% left
      {20pt}% this is for 
      %{-20pt}% before % this is for onecol
      %{-5pt} % this is for twocol
      {1.2em}% after

\titlespacing{\paragraph}{0pt}{8pt}{3em}[]
\renewcommand{\cfttoctitlefont}{\sffamily \huge \bfseries}


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TOC
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Numbering of Sections
\setcounter{tocdepth}{1}

% Reduce whitespace before toc
\setlength{\cftbeforetoctitleskip}{-1em} 
%\renewcommand\printtoctitle[1]{\huge\bfseries #1}


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Graphics and Tables 
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}
\graphicspath{{zz_images/},{},{aa_layout/}}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage[font={small,sf},labelfont={bf,sf},width=\subcapwidth \textwidth]{subcaption}
\captionsetup{font={small,sf},labelfont={bf,sf}}
\RequirePackage{fourier} 
\RequirePackage{array}
\RequirePackage{makecell}
\setlength{\heavyrulewidth}{1.5pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lists, etc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{enumitem}
\let\tempone\itemize
\let\temptwo\enditemize
\renewenvironment{itemize}{\tempone\addtolength{\itemsep}{-0.6\baselineskip}}{\temptwo} % makes itemize more compact
\setlist[itemize]{topsep=2pt} % makes itemize more compact


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Math
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% makes proper symbol for an angle
\renewcommand{\angle}{\measuredangle} 

% "Closed" root symbol
\makeatletter
\let\oldr@@t\r@@t 
\def\r@@t#1#2{%
\setbox0=\hbox{$\oldr@@t#1{#2\,}$}\dimen0=\ht0
\advance\dimen0-0.15\ht0
\setbox2=\hbox{\vrule height\ht0 depth -\dimen0}%
{\box0\lower0.4pt\box2}}
\LetLtxMacro{\oldsqrt}{\sqrt}
\renewcommand*{\sqrt}[2][\ ]{\oldsqrt[#1]{#2}}
\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nomenclature
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{nomencl}
\makenomenclature
% make calling nomenclature also add a line in the TOC
\renewcommand{\nomname}{\huge{\sffamily\nomenclatureheading}\addcontentsline{toc}{section}{\nomenclatureheading}}

\setlength{\nomitemsep}{0pt}

\renewcommand\nomgroup[1]{%
\item[\sffamily\Large\bfseries%
	\ifstrequal{#1}{A}{\symbolsheading}{%
	\ifstrequal{#1}{B}{\greekheading}{%
	\ifstrequal{#1}{Y}{\abbrvheading}{%
	\ifstrequal{#1}{C}{\subheading}{%
	\ifstrequal{#1}{D}{\superheading}{%
	\ifstrequal{#1}{Z}{\expressionsheading}}}}}{}}%
]%
\vspace{8pt}%
}

% make unitS
%\newcommand{\nomunit}[1]{%
%  \renewcommand{\nomentryend}{\hspace*{\fill}\[#1\]}%
%  }
\newcommand{\nomunit}[1]{%
\renewcommand{\nomentryend}{\hspace*{\fill}\makebox[1cm][l]{#1}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bibliography
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- biblatex (new!) ---%
\RequirePackage{csquotes}% Recommended
\RequirePackage[backend=biber,
              style=numeric, % or apa
              language=american,
              maxbibnames=9,
              maxcitenames=2,
              sorting=none % chronologically if set to none
              ]
              {biblatex} % using biblatex now
%\DeclareLanguageMapping{american}{american-apa} %only needed for apa
\addbibresource{aa_lists/bibliography.bib}

% --- natbib (old!) ---%
%\RequirePackage[square,numbers]{natbib} % harvard
%\RequirePackage{har2nat}                % harvard
%\RequirePackage{apacite}
%\bibliographystyle{apacite}
%\setcitestyle{authoryear,open={(},close={)}}  % custom in-text stuff


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fun Stuff
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Watermark
\RequirePackage{draftwatermark}
\SetWatermarkText{\watermarktext}
\SetWatermarkScale{1}

% whatever...
\RequirePackage[export]{adjustbox}
\RequirePackage{multicol}
\RequirePackage{tabto}
\RequirePackage{blindtext}
\RequirePackage{verbatim}
\RequirePackage{letltxmacro}
\RequirePackage{float}
\RequirePackage{endnotes}

\RequirePackage{listings}
\RequirePackage{framed}
\RequirePackage[final]{pdfpages}

\RequirePackage{lipsum}
  
  



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% F E A T U R E    M A C R O S %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sections Maker Macros
%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makepreface}[1]{%
  \pagestyle{fancy}%
  \vspace{5mm}%
  {\hspace{-1mm} \huge \sffamily \textbf{Preface} \par}\vspace{11mm}%
  \addcontentsline{toc}{section}{Preface}%
  \input{#1}%
  \clearpage
}

\newcommand{\makesummary}[1]{%
  \vspace{5mm}%
  {\hspace{-1mm} \huge \sffamily \textbf{Summary} \par}\vspace{11mm}%
  \addcontentsline{toc}{section}{Summary}%
  \input{#1}%
  \clearpage
}

\newcommand{\printnomencl}{%
  {\renewcommand{\Huge}{\sffamily \huge}\printnomenclature[3.6cm]}%
  \clearpage
}

\newcommand{\makeintroduction}[1]{%
  \vspace{5mm}%
  {\hspace{-1mm} \huge \sffamily \textbf{Introduction} \par}\vspace{11mm}%
  \addcontentsline{toc}{section}{Introduction}%
  \input{#1}%
  \clearpage
}

\newcommand{\makeconclusion}[1]{%
  \vspace{5mm}%
  {\hspace{-1mm} \huge \sffamily \textbf{Conclusion} \par}\vspace{11mm}%
  \input{#1}%
  \clearpage
}

\newcommand{\makereferences}{%
  \addcontentsline{toc}{chapter}{List of References}%
  \bibliography{\listspath/\bibfile}%
}

\newcommand{\printinginfo}{%
  \textbf{--- This page is to be printed on the left side (as an even page, so on backside) if printing in duplex ---}
  
  \textbf{--- Please print in colour for best reading experience ---}\vspace{3mm}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tables Macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{multirow}
% Figure and picture environments and commands
\newenvironment{maketablebody}[2]
               {\ifstrequal{#1}{narrow}
			    {\FPeval{\myfactor}{\narrowwidth}}
	            {
	            \ifstrequal{#1}{normal}
		          {\FPeval{\myfactor}{\normalwidth}}
		          {
    	          \ifstrequal{#1}{wide}
    		        {\FPeval{\myfactor}{\widewidth}}
			        {
			        \ifstrequal{#1}{full}
        		      {\FPeval{\myfactor}{1}}
            	      {\FPeval{\myfactor}{#1}}
			        }
    	          }
                }
                \tabularx{\myfactor\linewidth}{#2}
               }
               {\endtabularx}
               
\newenvironment{maketable}
			   {
			   \begin{table}[!ht]
               \captionsetup{width=\capwidth \linewidth}
               \vspace{2mm}
               \centering
               }
               {\end{table}}
\renewcommand\theadalign{tl}
\newenvironment{maketwocoltable}
            {\begin{table*}[!ht]
            \captionsetup{width=\capwidthtwocol \textwidth}
            \centering}
            {\end{table*}}

% Enumerate environment for in tables
\newenvironment{enumeratetable}{\vspace{-6mm} \begin{enumerate}[wide, labelwidth=!, labelindent=0pt]}{\end{enumerate}}

            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figures Macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{makefigure}
               {\begin{figure}[H]
               \captionsetup{width=\capwidth \linewidth}
               \centering}
               {\end{figure}}
               
\newenvironment{maketwocolfigure}
            {\begin{figure*}
            \captionsetup{width=\capwidthtwocol \textwidth}
            \centering}
            {\vspace{3mm}\end{figure*}}
            
\newenvironment{makesubfigure}[1]
               {\FPeval{\myfactor}{0.97*#1}
               \begin{subfigure}[t]{\myfactor \linewidth}
               \captionsetup{width=\subcapwidth\linewidth}
               \centering}
               {\end{subfigure}\hfill}
               
\newcommand{\insertpicture}[2]
{
\ifstrequal{#1}{narrow}
	{\newcommand{\temporarywidth}{\narrowwidth\linewidth}}
	{
	\ifstrequal{#1}{normal}
		{\newcommand{\temporarywidth}{\normalwidth\linewidth}}
		{
    	\ifstrequal{#1}{wide}
    		{\newcommand{\temporarywidth}{\widewidth\linewidth}}
			{
			\ifstrequal{#1}{sub}
        		{\newcommand{\temporarywidth}{\textwidth}}
        		{
        		\ifstrequal{#1}{full}
        		    {\newcommand{\temporarywidth}{\linewidth}}
            	    {\newcommand{\temporarywidth}{#1\linewidth}}
            	}
			}
    	}
    }
\includegraphics[width=\temporarywidth]{#2}
}

         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Box Enviroments Macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{SideBar}[1]
               {\begin{leftbar}
               \noindent \textbf{#1:} }
               {\end{leftbar}}
\RequirePackage{tcolorbox}
\tcbuselibrary{skins}
\newenvironment{FancyBox}[1]
               {\vspace{5mm}
               \begin{tcolorbox}[standard jigsaw,title=#1,
                opacityback=1,]
                }
                {\end{tcolorbox}}

% Indent environment
\renewcommand{\tab}{\hspace*{15pt}}
\newenvironment{makeindent}
	{\setlength{\leftskip}{\indentleftskipdefault}\setlength{\parskip}{\indentparskipdefault}}
	{\vspace{3pt}\setlength{\leftskip}{\leftskipdefault}\setlength{\parskip}{\parskipdefault}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cross Reference Macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\refeq}[1]{equation (\ref{#1})}
\newcommand{\reftab}[1]{table \ref{#1}}
\newcommand{\reffig}[1]{figure \ref{#1}}
\newcommand{\refch}[1]{chapter \ref{#1}}
\newcommand{\refsec}[1]{section \ref{#1}}
\newcommand{\pagerefeq} [1]{equation (\ref{#1}) on page \pageref{#1}}
\newcommand{\pagereftab}[1]{table \ref{#1} on page \pageref{#1}}
\newcommand{\pagerefig}[1]{figure \ref{#1} on page \pageref{#1}}
\newcommand{\pagerefsec}[1]{section \ref{#1} on page \pageref{#1}}
\newcommand{\pagerefch}[1]{chapter \ref{#1} from page \pageref{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Symbols Macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\myvec}[1]{\bm{#1}}
\newcommand{\trademark}{\textsuperscript{\textregistered}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Other Macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate a warning to track issues and ToDos
\newcommand{\Warn}[1]{\PackageWarning{Editorial Note}{#1}} 










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% F O R M A T T E R   M A C R O S %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% reset headwidth for header size adaption on layout change
\makeatletter
    \newcommand{\resetHeadWidth}{\f@nch@setoffs}
\makeatother

% manually dictate side of new page to the left \cleartoleftpage, otherwise just use \clearpage or \cleardoublepage for new page on the right
\makeatletter
\newcommand*{\cleartoleftpage}{%
  \clearpage
    \if@twoside
    \ifodd\c@page
      \hbox{}\newpage
      \if@twocolumn
        \hbox{}\newpage
      \fi
    \fi
  \fi
}
\makeatother

\newcommand{\formatfortitlepage}{%
  \pagestyle{empty}%
  \newgeometry{top=40mm,bottom=30mm,left=\leftonecolumn,right=\rightonecolumn}%
  }
  
\newcommand{\formatforpreface}{%
  \pagestyle{empty}%
  }


\newcommand{\formatforfrontmatter}{%
  \pagestyle{fancy}%
  \newpage%
}

\newcommand{\formatforchapters}{%
  \pagestyle{fancy}%
}

\newcommand{\formatforbib}{%
  \pagestyle{fancy}%
  \addcontentsline{toc}{chapter}{\bibliographyheading}%
}

\newcommand{\formatforappendix}{%
  \pagestyle{fancy}%
  %% TOC and other FORMATTING
  \addcontentsline{toc}{chapter}{APPENDICES}%
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}%
  \titleformat{\chapter}[hang]%
      {\raggedright\sffamily\huge\bfseries}% global formatting (number and title)
      {Appendix\ \thechapter:}% label: number and its formatting
      {0.7em}% spacing between number and title
      {}% optional (content between number and title)
  \titlespacing*{\chapter}%
      {0pt}% left
      {-10pt}% before
      {1.2em}% after
  \renewcommand{\thesection}{\Alph{chapter}.\arabic{section}}%
  \renewcommand{\thesubsection}{\Alph{chapter}.\arabic{section}.\arabic{subsection}}%
  \renewcommand{\thesubsubsection}{\Alph{chapter}.\arabic{section}.\arabic{subsection} (\alph{subsubsection})}%
  % Sans fonts
  \allsectionsfont{\sffamily}%
  \chaptertitlefont{\sffamily}%
  \chapternumberfont{\sffamily}%
  
  
  
\appendix
}

\newcommand{\switchtotwocolumns}{%
  \newgeometry{top=\topmargindefault,bottom=\bottommargindefault,inner=\innermargindefault,outer=\outermargindefault,columnsep=\columnsepdefault}%
  \twocolumn%
  \resetHeadWidth%
}

\newcommand{\switchtoonecolumn}{%
  \newgeometry{top=\toponecolumn,bottom=\bottomonecolumn,inner=\inneronecolumn,outer=\outeronecolumn}%
  \onecolumn%
  \resetHeadWidth%
}


