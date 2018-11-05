%% Start of file `academic-cv.cls'.
% Academic CV Class File
%
% This class is based on the Awesome CV class by posquit0:
% https://github.com/posquit0/Awesome-CV
%
% Author:
% Josá Sá <jose.cerq.sa@gmail.com>
% https://github.com/jose-a-sa/academic-cv
%
% Notes:
% 1) This class file defines the structure and layout of the template file (cv.tex, resume.tex).
% 2) It has been written in such a way that under most circumstances you
% should not need to edit it.
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%

\ProvidesClass{academic-cv}[Academic Curriculum Vitae]
\NeedsTeXFormat{LaTeX2e}

% Boolean value to switch color highlighting
\newif\ifcoloraccents
\coloraccentstrue
% Boolean value to switch header color
\newif\ifcolorheader
\colorheaderfalse
% Boolean value to switch between short and full cv
\newif\ifdetailed
\detailedfalse
% Boolean value to add a side panel
\newif\ifresume
\resumefalse
% Boolean value to add a side panel
\newif\ifletter
\letterfalse

\DeclareOption{resume}{\resumetrue}
\DeclareOption{detailed}{\detailedtrue}
\DeclareOption{fill}{\colorheadertrue}
\DeclareOption{noaccent}{\coloraccentsfalse\colorheaderfalse}
\DeclareOption{letter}{\lettertrue\detailedfalse}

\setlength\overfullrule{0pt}

% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%   MAIN PACKAGES
%-------------------------------------------------------------------------------

% Needed for drawing graphics
\RequirePackage{graphicx}
\RequirePackage{float}
%\RequirePackage{epstopdf}
\RequirePackage[export]{adjustbox} 

% Needed for drawing rectanles
\RequirePackage{tikz}
\usetikzlibrary{positioning,calc}
% Needed to make fixed length table
\RequirePackage{array, longtable}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr, lastpage}
% Needed to manage colors
\RequirePackage{xcolor, xcolor-material}
% Needed to manage strings
\RequirePackage{xstring}
% Needed to manage commands
\RequirePackage{xargs}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to use a toolbox of programming toolsv
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
%\RequirePackage{setspace}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Needed to manage math fonts
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\RequirePackage{fontawesome}
\RequirePackage{academicons}
\RequirePackage[default,opentype]{sourcesanspro}
% Needed for the photo ID
\RequirePackage[skins]{tcolorbox}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode]{hyperref}
\hypersetup{%
  % pdftitle={},
  pdfauthor={Academic CV class, by José A. Sá},
  % pdfsubject={},
  % pdfkeywords={},
  % pdfproducer={},
  % pdfcreator={}
}

% Needed to deal with lenght calculations
\RequirePackage{calc}
% Needed to deal with lenght calculations
\RequirePackage{datetime}
\ifletter%
  \renewcommand{\today}{\number\day\space
  \ifcase\month \or January\or February\or March\or April\or May\or June\or July%
  \or August\or September\or October\or November\or December\fi\space\number\year}%
\else%
  \renewcommand{\today}{\ifcase\month\or January\or February\or March\or April\or May%
  \or June\or July\or August\or September\or October\or November\or December\fi%
  \space\number\year}%
\fi%

%-------------------------------------------------------------------------------
%   SPACINGS & LAYOUT
%-------------------------------------------------------------------------------

% Document lengths
\global\parskip=0pt
\global\parindent=0pt
\global\baselineskip=12pt

% Document lengths
\newlength\headertextwidth
\newlength\headerphotowidth
\newlength\headerheight
\newlength\headerboxheight
\newlength\topspacing
\newlength\sidespacing
\newlength\bottomspacing
\newlength\footskipspacing
\newlength\befphotoskip
\newlength\befheadernameskip
\newlength\befsocialbarskip
\newlength\photoborderthickness
\newlength\afterheaderskip
\newlength\datecolumnwidth
\newlength\begincvsectionskip
\newlength\cvsectionskip
\newlength\cventryskip
\newlength\cventriesskip

\setlength\headerheight{35mm}
\setlength\befphotoskip{-18mm}
\setlength\befheadernameskip{-16mm}
\setlength\befsocialbarskip{1.2mm}
\setlength\photoborderthickness{0.6mm}
\setlength\afterheaderskip{3mm minus 2mm}
\setlength\datecolumnwidth{35mm}
\setlength\begincvsectionskip{7mm plus 1mm minus 3mm}
\setlength\cvsectionskip{8mm plus 1mm minus 1mm}
\setlength\cventryskip{2mm plus 0.5mm minus 1mm}
\setlength\cventriesskip{7mm plus 4mm minus 2mm}


\ifdetailed
  \setlength\topspacing{20mm}
  \setlength\sidespacing{20mm}
  \setlength\bottomspacing{23mm}
  \setlength\footskipspacing{10mm}
\else
  \setlength\topspacing{15mm}
  \setlength\sidespacing{16mm}
  \setlength\bottomspacing{23mm}
  \setlength\footskipspacing{10mm}
\fi
\setlength\headerboxheight{\dimexpr\headerheight+\topspacing\relax}
\addtolength{\headerboxheight}{0.25\befheadernameskip}

%% Geometry
\geometry{left=\sidespacing, top=\topspacing, right=\sidespacing, bottom=\bottomspacing, footskip=\footskipspacing}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


%-------------------------------------------------------------------------------
%   COLOR
%-------------------------------------------------------------------------------

% Accent color
\colorlet{accent}{MaterialBlue600}

% Text based colors
\colorlet{darktext}{MaterialGrey900}
\colorlet{text}{MaterialGrey800}
\colorlet{lighttext}{MaterialGrey700}
\colorlet{lightertext}{MaterialGrey600}
\colorlet{sectioncolor}{darktext}

% Header/Titlepage
\newcommand*{\titlepagecolor}{\ifcolorheader\pagecolor{accent}\else\pagecolor{white}\fi}
\newcommand*{\titletextcolor}[1]{\ifcolorheader{\color{white}#1}\else{\color{lightertext}#1}\fi}
\newcommand*{\firstnamecolor}[1]{\ifcolorheader{\color{white}#1}\else{\color{darktext}#1}\fi}
\newcommand*{\lastnamecolor}[1]{\ifcolorheader{\color{white}#1}\else{\color{text}#1}\fi}
\newcommand*{\positioncolor}[1]{\ifcolorheader{\color{white}#1}\else\ifcoloraccents{\color{accent}#1}\else{\color{black}#1}\fi\fi}
\newcommand*{\addresscolor}[1]{\ifcolorheader{\color{white}#1}\else{\color{lightertext}#1}\fi}
\newcommand*{\socialcolor}[1]{\ifcolorheader{\color{white}#1}\else{\color{text}#1}\fi}
\newcommand*{\photobordercolor}{\ifcolorheader white\else MaterialGrey400\fi}

% Section
\def\@sectionaccent#1#2#3{\ifcoloraccents{\color{accent}#1#2#3}\else{#1#2#3}\fi}

% CV entry
\newcommand*{\entrydatecolor}[1]{\ifcoloraccents{\color{accent}#1}\else{\color{sectioncolor}#1}\fi}


%-------------------------------------------------------------------------------
%   CONFIGURATION FOR FONTS
%-------------------------------------------------------------------------------

% Font directory
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir

% Set font for header (default is Google Sans)
\newfontfamily\roboto[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}
\newfontfamily\roboto[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}
\newfontfamily\googlesans[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{GoogleSans}
\newfontfamily\googlesanslight[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{GoogleSans}

% Set font for body & footer (default is Source Sans)
\newcommand*{\headerfont}{\googlesans}
\newcommand*{\headerfontlight}{\googlesanslight}
\newcommand*{\footerfont}{\sourcesanspro}
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}


%-------------------------------------------------------------------------------
%   UTILITIES
%-------------------------------------------------------------------------------

% Use to draw horizontal line with specific thickness
\def\vhrulefill#1{\color{sectioncolor}\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

\JustifyingParindent=0pt

% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{J}[1]{>{\justifying\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}

% Define columns
\newcolumntype{\cventryaligndateleft}[1]{R{#1}}
\newcolumntype{\cventryaligndateright}[1]{R{#1}}
\newcolumntype{\cvrowaligntitle}[1]{R{#1}}

% Social bar
\newcommand\headericonsep{\space}
\newcommand\headersocialsep{\kern.5em\textbar\kern.5em}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}

% Use to separate strings in the personal informantion section
\newcommand{\dotsep}{\kern.5em\textbullet\kern.5em}


%-------------------------------------------------------------------------------
%    FONT STYLES
%-------------------------------------------------------------------------------

\newcommand*{\textparagraphstyle}{\parindent=0pt\parskip=2pt\baselineskip=11pt}
\newcommand*{\letterparagraphstyle}{\parindent=0pt\parskip=4pt\baselineskip=13pt}

% TITLEPAGE
\newcommand*{\titlenamestyle}[2]{{\fontsize{48pt}{1em}\headerfontlight\firstnamecolor{#1}\space\headerfont\bfseries\lastnamecolor{#2}}}
\newcommand*{\titlepositionstyle}[1]{{\fontsize{14pt}{1em}\bodyfont\scshape\positioncolor{#1}}}
\newcommand*{\titletextstyle}[1]{{\fontsize{30pt}{1em}\headerfontlight\titletextcolor{#1}}}
\newcommand*{\titledatestyle}[1]{{\fontsize{20pt}{1em}\headerfontlight\titletextcolor{#1}}}

% HEADER/FOOTER
\newcommand*{\headernamestyle}[2]{{\fontsize{32pt}{1em}\headerfontlight\firstnamecolor{#1}\space\headerfont\bfseries\lastnamecolor{#2}}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{11pt}{1em}\bodyfont\scshape\positioncolor{#1}}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{8.5pt}{1em}\headerfont\itshape\addresscolor{#1}}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{8pt}{1em}\headerfont\socialcolor{#1}}}
\newcommand*{\footerstyle}[1]{{\fontsize{9pt}{1em}\footerfont\scshape\color{lighttext}#1}}

% SECTION
\newcommand*{\sectionstyle}[1]{{\fontsize{19pt}{1em}\headerfont\bfseries\color{sectioncolor}\@sectionaccent#1}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{18pt}{1em}\headerfont\bfseries\color{sectioncolor}\@sectionaccent#1}}

% ENTRIES
\newcommand*{\entrydatestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\slshape\entrydatecolor{#1}}}
\newcommand*{\entrytitlestyle}[1]{{\fontsize{10.5pt}{1em}\bodyfontlight\bfseries\color{text}#1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\scshape\color{lighttext}#1}}
\newcommand*{\entrymarkstyle}[1]{{\fontsize{9pt}{1em}\headerfont\color{darktext}#1}}
\newcommand*{\entrydescriptionstyle}[1]{{\fontsize{9.5pt}{1em}\bodyfontlight\upshape\color{text}#1}}

% ROWS
\newcommand*{\rowtitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\bfseries\scshape\color{text}{#1}}}
\newcommand*{\rowtextstyle}{\fontsize{9.5pt}{1em}\bodyfontlight\color{text}}

% COVER LETTER
\newcommand*{\lettersectionstyle}[1]{{\fontsize{14pt}{1em}\bodyfont\scshape\bfseries\color{sectioncolor}\@sectionaccent#1}}
\newcommand*{\recipientaddressstyle}[1]{{\fontsize{9.5pt}{1em}\headerfont\itshape\color{lighttext} #1}}
\newcommand*{\recipienttitlestyle}[1]{{\fontsize{9.5pt}{1em}\headerfont\bfseries\color{darktext} #1}}
\newcommand*{\lettertitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\bfseries\color{darktext} \underline{#1}}}
\newcommand*{\letterdatestyle}[1]{{\fontsize{10pt}{1em}\headerfont\slshape\color{accent} #1}}
\newcommand*{\lettertextstyle}{\fontsize{10pt}{1em}\bodyfontlight\upshape\color{text}}
\newcommand*{\letternamestyle}[1]{{\fontsize{10pt}{1em}\headerfont\bfseries\color{darktext} #1}}
\newcommand*{\letterenclosurestyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\slshape\color{lightertext} #1}}


%----------------------------------------------------------------0---------------
%                Commands for personal information
%-------------------------------------------------------------------------------

% Photo url command
\newcommand{\photo}[2][circle,edge,left]{%
  \def\@photo{#2}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{circle} \or \equal{\tmp}{rectangle}}%
      {\let\@photoshape\tmp}{}%
    \ifthenelse{\equal{\tmp}{edge} \or \equal{\tmp}{noedge}}%
      {\let\@photoedge\tmp}{}%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}%
      {\let\@photoalign\tmp}{}%
  }%
}
\def\@photoshape{circle}
\def\@photoedge{edge}
\def\@photoalign{left}

% Personal details
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\fullname}[1]{\def\@fullname{#1}}
\newcommand*{\birthdate}[1]{\def\@birthdate{#1}}
\newcommand*{\nationality}[1]{\def\@nationality{#1}}
\newcommand*{\address}[2]{\ifempty{#2}{\def\@address{#1}}{\def\@address{#1}\def\@addressother{#2}}}
\newcommand*{\position}[1]{\def\@position{#1}}
% Contacts
\newcommand*{\phone}[1]{\def\@phone{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\skype}[1]{\def\@skype{#1}}
% Personal pages, portfolios and repositories 
\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}
% Academic pages
\newcommand*{\academia}[2][Academia]{\def\@academialabel{#1}\def\@academia{#2}}
\newcommand*{\arxiv}[2][arXiv]{\def\@arxivlabel{#1}\def\@arxiv{#2}}
\newcommand*{\googlescholar}[2][Scholar]{\def\@gscholarlabel{#1}\def\@gscholar{#2}}
\newcommand*{\inspirehep}[1]{\def\@inspirehep{#1}}
\newcommand*{\orcid}[1]{\def\@orcid{#1}}
\newcommand*{\researchgate}[1]{\def\@researchgate{#1}}
% Other social
\newcommand*{\facebook}[1]{\def\@facebook{#1}}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}
\newcommand*{\stackoverflow}[1]{\def\@stackoverflowid{#1}}
% Cover letter
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\newcommand*{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand*{\recipientaddress}[1]{\def\@recipientaddress{#1}}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}
\newcommand*{\letteropening}[1]{\def\@letteropening{#1}}
\newcommand*{\letterclosing}[1]{\def\@letterclosing{#1}}
\newcommand*{\lettersignature}[2][25mm]{\def\@lettersignature{#2}\def\@signatureheight{#1}}
\newcommand*{\letterenclosure}[2][Enclosure]{%
  \ifthenelse{\equal{#1}{}}{}{\def\@letterenclname{#1}}
  \def\@letterenclosure{#2}
}


%-------------------------------------------------------------------------------
%   FOOTER
%-------------------------------------------------------------------------------

% Make footer using fancyhr
\newcommand*{\makefooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3/\pageref{LastPage}}}
}


%-------------------------------------------------------------------------------
%   HEADER (SHORT)
%-------------------------------------------------------------------------------

% Draw a photo with TikZ
\newcommand*{\drawphoto}{%
  \ifdefined\@photo
    \newlength{\photodim}
    \ifthenelse{\equal{\@photoshape}{circle}}%
      {\setlength{\photodim}{13mm}}%
      {\setlength{\photodim}{18mm}}%
    \ifthenelse{\equal{\@photoedge}{edge}}%
      {\def\@photoborder{\photobordercolor}}%
      {\def\@photoborder{none}}%
    \vspace*{\befphotoskip}%
    \begin{tikzpicture}%
      \node[\@photoshape, draw=\@photoborder, line width=\photoborderthickness, inner sep=\photodim, fill overzoom image=\@photo] () {};
    \end{tikzpicture}%
  \fi%
}

\newcommand*{\drawsignature}{%
  \ifdefined\@lettersignature
    \includegraphics[max height=\@signatureheight]{\@lettersignature}
  \fi%
}

% Use to separate things in the social bar
\newsavebox\SocialSepBox\sbox\SocialSepBox{\headersocialstyle{\headersocialsep}}%
\newcommand{\SocialSep}{\unskip%
  \hskip 3pt plus 1pt minus 2pt%
  \cleaders\copy\SocialSepBox\hskip\wd\SocialSepBox%
  \hskip 3pt plus 1pt minus 2pt%
  \ignorespaces
}%

% Parse social multiple entries
\newif\ifsocialstart%
\newcommand{\parsesocial}[3][]{%
  \foreach\id in #2{%
    \ifsocialstart\global\socialstartfalse\else\SocialSep\fi%
    \mbox{\ifempty{#1}{#3\headericonsep\id}{\href{#1\id}{#3\headericonsep\id}}}%
  }%
}%
\newcommand{\parsesociallabel}[3][]{%
  \foreach\id in #2{%
    \ifsocialstart\global\socialstartfalse\else\SocialSep\fi%
    \mbox{\href{#2}{#3\headericonsep#1}}%
  }%
}%

% Print out the social labels
\newcommand*{\drawsocialbar}[1][center]{%
  \def\@barsocialalign{center}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right} \or \equal{\tmp}{center}}%
      {\let\@barsocialalign\tmp}{}%
  }%
  \socialstarttrue%
  \parbox{\textwidth}{%
    \baselineskip=12pt
    \ifthenelse{\equal{\@barsocialalign}{left}}{\raggedright}{\ifthenelse{\equal{\@barsocialalign}{right}}{\raggedleft}{\centering}}%
    \headersocialstyle{%
      % Contacts
      \ifdefined\@phone\parsesocial{\@phone}{\faPhoneSquare}\fi
      \ifdefined\@email\parsesocial[mailto:]{\@email}{\faEnvelope}\fi%
      \ifdefined\@skype\parsesocial{\@skype}{\faSkype}\fi%
      % Personal pages, portfolios and repositories 
      \ifdefined\@homepage\parsesocial[http://]{\@homepage}{\faHome}\fi%
      \ifdefined\@linkedin\parsesocial[https://www.linkedin.com/in/]{\@linkedin}{\faLinkedinSquare}\fi%
			\ifdefined\@github\parsesocial[https://github.com/]{\@github}{\faGithub}\fi%
      \ifdefined\@gitlab\parsesocial[https://gitlab.com/]{\@gitlab}{\faGitlab}\fi%
      % Academic pages
      \ifdefined\@academia\parsesociallabel[\@academialabel]{\@academia}{\aiAcademia}\fi%
      \ifdefined\@arxiv\parsesociallabel[\@arxivlabel]{\@arxiv}{\aiarXiv}\fi%
      \ifdefined\@gscholar\parsesociallabel[\@gscholarlabel]{\@gscholar}{\aiGoogleScholar}\fi%
      \ifdefined\@inspirehep\parsesocial[https://inspirehep.net/author/profile/]{\@inspirehep}{\aiInspire}\fi%
      \ifdefined\@orcid\parsesocial[https://orcid.org/]{\@orcid}{\aiOrcid}\fi%
      \ifdefined\@researchgate\parsesocial[https://www.researchgate.net/profile/]{\@researchgate}{\aiResearchGate}\fi%
      %Other social
      \ifdefined\@facebook\parsesocial[https://facebook.com/]{\@facebook}{\faFacebookOfficial}\fi%
			\ifdefined\@twitter\parsesocial[https://twitter.com/]{\@twitter}{\faTwitter}\fi%
      \ifdefined\@reddit\parsesocial[https://www.reddit.com/user/]{\@reddit}{\faReddit}\fi%
      \ifdefined\@stackoverflowid\parsesocial[https://stackoverflow.com/users/]{\@stackoverflowid}{\faStackOverflow}\fi%
		}%
	}%
}%

% Draw the header with/without photo, name, position, ..., and social bar
\newcommand*{\makeheader}[1][center]{%
  \def\@cvheaderalign{center}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right} \or \equal{\tmp}{center}}%
      {\let\@cvheaderalign\tmp}{}%
  }%
  \ifdefined\@photo%
    \setlength{\headertextwidth}{0.76\textwidth}%
    \setlength{\headerphotowidth}{0.24\textwidth}%
  \else%
    \setlength{\headertextwidth}{0.87\textwidth}%
    \setlength{\headerphotowidth}{0mm}%
  \fi%
  \ifbool{colorheader}{%
    \begin{tikzpicture}[remember picture,overlay]
      \node[shape=rectangle, fill=accent, minimum height=\headerboxheight, minimum width=\paperwidth, anchor=north] at (current page.north){};
    \end{tikzpicture}%
  }{}%
  \ifthenelse{\equal{\@cvheaderalign}{left}}{\raggedright}{\ifthenelse{\equal{\@cvheaderalign}{right}}{\raggedleft}{\centering}}%
  \ifthenelse{\equal{\@photoalign}{left}}{%
    \begin{minipage}[c][\headerheight][c]{\headerphotowidth}%
      \raggedright\drawphoto%
    \end{minipage}%
  }{}%
  \begin{minipage}[c][\headerheight][c]{\headertextwidth}%
    \baselineskip=12pt
    \vspace*{\befheadernameskip}%
    \ifthenelse{\equal{\@cvheaderalign}{left}}{\raggedright}{\ifthenelse{\equal{\@cvheaderalign}{right}}{\raggedleft}{\centering}}%
    \headernamestyle{\@firstname}{\@lastname}\par%
    \ifdefined\@position\baselineskip=11pt\headerpositionstyle{\@position}\par\fi%
    \ifdefined\@address\headeraddressstyle{\@address}\par\fi%
    \ifdefined\@addressother\headeraddressstyle{\@addressother}\par\fi%
    \vspace*{\befsocialbarskip}%
    \drawsocialbar[\@cvheaderalign]%
  \end{minipage}%
  \ifthenelse{\equal{\@photoalign}{right}}{%
    \begin{minipage}[c][\headerheight][c]{\headerphotowidth}%
      \raggedleft\drawphoto%
    \end{minipage}%
  }{}%
  \vspace*{\afterheaderskip}%
}%


%-------------------------------------------------------------------------------
%   CV SECTIONS
%-------------------------------------------------------------------------------

% Renew the section to the new cvsection
\renewcommand{\section}[1]{%
  \sectionstyle{#1}%
  \phantomsection%
  \vhrulefill{1pt}%
  \par\color{text}%
  \vspace*{\begincvsectionskip}%
}%

% Clears section, adds a page break if the detailed flag is included
\newcommand{\clearsection}{%
  \ifdetailed\newpage\else\vspace*{\cvsectionskip}\fi%
}%


%-------------------------------------------------------------------------------
%   CV SKILLS
%-------------------------------------------------------------------------------

\newcommand{\cvrow}[2]{%
  \textparagraphstyle%
  \rowtitlestyle{#1} & \textparagraphstyle\rowtextstyle #2\\%
}

\newenvironment{cvrows}[1][J]{%
  \tabcolsep=5pt%
  \extrarowheight=5pt%
  \vspace*{-1.5\baselineskip}
  \begin{longtable}{@{\extracolsep{\fill}}\cventryaligndateleft{\datecolumnwidth}#1{\textwidth-\datecolumnwidth-3.5\tabcolsep}@{\extracolsep{\fill}}}%
}{%
  \end{longtable}%
}%


%-------------------------------------------------------------------------------
%   CV ENTRIES
%-------------------------------------------------------------------------------

\newif\ifdatecolumnleft
\datecolumnlefttrue

\newenvironment{cventries}[1][left]{%
  \def\@cvdatealign{left}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}%
      {\let\@cvdatealign\tmp}{}%
  }%
  \ifthenelse{\equal{\@cvdatealign}{left}}{\datecolumnlefttrue}{\datecolumnleftfalse}%
  \begin{center}
}{%
  \end{center}
  \vspace*{\cventriesskip}%
}%

\newcommand{\cventry}[5]{%
  \extrarowheight=-1pt%
  \tabcolsep=5pt%
  \ifdatecolumnleft%
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}\cventryaligndateleft{\datecolumnwidth}L{\textwidth-\datecolumnwidth-3.5\tabcolsep}@{\extracolsep{\fill}}}
      \baselineskip=8pt\entrydatestyle{#1} & \baselineskip=8pt\entrytitlestyle{#2} \\[-1pt]%
      & \baselineskip=8pt\entrylocationstyle{#3}%
      \ifempty{#4}{}{\\%
        & \baselineskip=8pt\entrymarkstyle{#4}%
      }%
      \ifempty{#5}{}{\\%
      & \textparagraphstyle\entrydescriptionstyle{#5}%
    }%
    \end{tabular*}%
  \else%
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}L{\textwidth-\datecolumnwidth-3.5\tabcolsep}\cventryaligndateright{\datecolumnwidth}@{\extracolsep{\fill}}}
      \baselineskip=8pt\entrytitlestyle{#2} & \baselineskip=8pt\entrydatestyle{#1} \\[-1pt]%
      \baselineskip=8pt\entrylocationstyle{#3} & %
      \ifempty{#4}{}{\\%
        \baselineskip=8pt\entrymarkstyle{#4} & %
      }%
      \ifempty{#5}{}{\\%
      \textparagraphstyle\entrydescriptionstyle{#5} & %
      }%
    \end{tabular*}%
  \fi%
  \vspace*{\cventryskip}%
  \linebreak
}%


%-------------------------------------------------------------------------------
%   CV ITEMS
%-------------------------------------------------------------------------------

\newenvironment{cvitems}{%
  \vspace*{-13pt}%
  \begin{justify}%
  \begin{itemize}[leftmargin=2ex, nosep, noitemsep, topsep=-13pt]%
    \textparagraphstyle
    \renewcommand{\labelitemi}{\bullet}%
}{%
  \end{itemize}%
  \end{justify}%
  \vspace*{-11pt}%
  \textparagraphstyle
}%


%-------------------------------------------------------------------------------
%   FRONT COVER (DETAILED)
%-------------------------------------------------------------------------------

\newcommand*{\maketitlepage}{%
  \thispagestyle{empty}
  \titlepagecolor%
  \vspace{\fill}%
  \begin{center}%
    \titletextstyle{Curriculum Vitae}\par\vspace{55mm}%
    \titlenamestyle{\@firstname}{\@lastname}\par\vspace{2mm}%
    \titlepositionstyle{\@position}\par\vspace{140mm}%
    \titledatestyle{\today}\par\vspace{15mm}%
  \end{center}%
  \vspace{\fill}%
  \newpage%
  \pagecolor{white}%
}%


%-------------------------------------------------------------------------------
%   PERSONAL SECTION (DETAILED)
%-------------------------------------------------------------------------------

\newcommand{\parsepersonal}[2][]{%
  \ifdetailed\renewcommand*{\dotsep}{\linebreak}\fi%
  \foreach\id in #2{%
    \ifempty{#1}{\id}{\href{#1\id}{\id}}\linebreak%
  }%
  \unpenalty\unskip\unpenalty%
}%

\newcommand{\makepersonaldetails}{%
  \section{Personal details}%
  \begin{cvrows}[L]%
    % All personal
    \ifdefined\@fullname\cvrow{Full name}{\parsepersonal{\@fullname}}\fi%
    \ifdefined\@nationality\cvrow{Nationality}{\parsepersonal{\@nationality}}\fi%
    \ifdefined\@birthdate\cvrow{Birthdate}{\parsepersonal{\@birthdate}}\fi%
    \ifdefined\@address\cvrow{Address}{\parsepersonal{\@address}%
        \ifdefined\@addressother\linebreak\parsepersonal{\@addressother}\fi%
      }\fi%
    % Contacts
    \ifdefined\@phone\cvrow{Cellphone}{\parsepersonal{\@phone}}\fi%
    \ifdefined\@email\cvrow{Email}{\parsepersonal[mailto:]{\@email}}\fi%
    \ifdefined\@skype\cvrow{Skype}{\parsepersonal{\@skype}}\fi%
    % Personal pages, portfolios and repositories
    \ifdefined\@homepage\cvrow{Homepage}{\parsepersonal[http://]{\@homepage}}\fi%
    \ifdefined\@linkedin\cvrow{LinkedIn}{\parsepersonal[https://www.linkedin.com/in/]{\@linkedin}}\fi%
    \ifdefined\@github\cvrow{GitHub}{\parsepersonal[https://github.com/]{\@github}}\fi%
    \ifdefined\@gitlab\cvrow{GitLab}{\parsepersonal[https://gitlab.com/]{\@gitlab}}\fi%
    % Academic pages
    \ifdefined\@academia\cvrow{Academia}{\href{\@academia}{\@academia}}\fi%
    \ifdefined\@arxiv\cvrow{arXiv}{\href{\@arxiv}{\@arxiv}}\fi%
    \ifdefined\@gscholar\cvrow{Google Scholar}{\href{\@gscholar}{\@gscholar}}\fi%
    \ifdefined\@inspirehep\cvrow{inSPIRE-HEP}{\parsepersonal[https://inspirehep.net/author/profile/]{\@inspirehep}}\fi%
    \ifdefined\@orcid\cvrow{Orcid}{\parsepersonal[https://orcid.org/]{\@orcid}}\fi%
    \ifdefined\@researchgate\cvrow{ResearchGate}{\parsepersonal[https://www.researchgate.net/profile/]{\@researchgate}}\fi%
    %Other social
    \ifdefined\@facebook\cvrow{Facebook}{\parsepersonal[https://facebook.com/]{\@facebook}}\fi%
    \ifdefined\@twitter\cvrow{Twitter}{\parsepersonal[https://twitter.com/]{\@twitter}}\fi%
    \ifdefined\@reddit\cvrow{Reddit}{\parsepersonal[https://www.reddit.com/user/]{\@reddit}}\fi%
    \ifdefined\@stackoverflowid\cvrow{Stack Overflow}{\parsepersonal[https://stackoverflow.com/users/]{\@stackoverflowid}}\fi%
  \end{cvrows}%
  \clearsection
}%


%-------------------------------------------------------------------------------
%   MAKE CV HEADER (SHORT) / FRONT+PERSONAL (DETAILED) 
%-------------------------------------------------------------------------------

\renewcommand*{\maketitle}[1][C]{
  \ifdetailed%
    \maketitlepage%
    \makepersonaldetails%
  \else%
    \makeheader[#1]
  \fi%
}%


%-------------------------------------------------------------------------------
%    COVER LETLTER
%-------------------------------------------------------------------------------

\newcommand{\lettersection}[1]{%
  \par\addvspace{7pt}%
  \lettersectionstyle{#1}%recipientname
  \phantomsection%
  \vhrulefill{0.9pt}
  \lettertextstyle%
  \letterparagraphstyle
  \par\nobreak\addvspace{1pt}%
}


\newcommand*{\makelettertitle}{%
  \raggedright%
  \tabcolsep=0pt%
  \extrarowheight=0pt%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \ifdefined\@recipientname\recipienttitlestyle{\@recipientname}\fi & \letterdatestyle{\@letterdate}
  \end{tabular*}
  \ifdefined\@recipientaddress\recipientaddressstyle{\@recipientaddress}\\\vspace{2.2\baselineskip}\else\\\vspace{3.0\baselineskip}\fi%
  \ifdefined\@lettertitle\lettertitlestyle{\@lettertitle}\\\vspace{1.5\baselineskip}\fi%
  \ifdefined\@letteropening\lettertextstyle{\@letteropening}\vspace{0.3\baselineskip}\fi%
}


\newcommand*{\makeletterclosing}{%
  \vspace{0.25\baselineskip}
  \raggedright
  \letterparagraphstyle
  \ifdefined\@letterclosing\vspace{0.5\baselineskip}\lettertextstyle{\@letterclosing}\vspace{2.0\baselineskip}\\\ifdefined\@lettersignature\drawsignature\else\letternamestyle{\@firstname\ \@lastname}\fi\\ \fi%
  \ifdefined\@letterenclosure\vspace{2.5\baselineskip}\letterenclosurestyle{\ifdefined\@letterenclname\underline{\@letterenclname}:\space\fi\@letterenclosure}\\ \fi%
}


\newenvironment{cvletter}{%
  \makelettertitle
  \justify
  \lettertextstyle
  \letterparagraphstyle
}{%
  \makeletterclosing
}
