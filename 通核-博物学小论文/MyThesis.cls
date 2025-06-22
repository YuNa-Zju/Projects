\ProvidesClass{MyThesis}[2025/05/26 Custom Chinese Thesis Class v3]

% --- Load base class and options ---
\LoadClass[12pt, a4paper]{ctexart}

% --- Required LaTeX Packages ---
\RequirePackage{geometry}
\RequirePackage{xeCJK}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{indentfirst}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{zhnumber}
\RequirePackage{xeCJK}
\setCJKmainfont{SimSun}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{zhnumber}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{listings}
\RequirePackage{xcolor}
\RequirePackage{array}
\RequirePackage{mathtools}
\RequirePackage{float}
\RequirePackage{indentfirst}
\RequirePackage{multirow}
\RequirePackage{subfigure}
\RequirePackage{listings}
\RequirePackage{lmodern}
\RequirePackage{amssymb}
% --- Page Layout Configuration (geometry package) ---
\geometry{
  top=3cm,
  bottom=2.5cm,
  left=2.5cm,
  right=2.5cm,
  headheight=14.5pt,
  headsep=2.5cm,
  footskip=2cm,
  % bindingoffset=5mm,
}

% --- Font Configuration (xeCJK package) ---
% Main CJK font (Songti/SimSun), also becomes the \rmfamily CJK font.
\setCJKmainfont{SimSun}[AutoFakeBold = {1.1}]
% Sans-serif CJK font (Heiti/SimHei), becomes the \sffamily CJK font.
\setCJKsansfont{SimHei}
% Monospaced CJK font (FangSong/FangSong), becomes the \ttfamily CJK font.
\setCJKmonofont{FangSong}

% Corresponding English fonts
\setmainfont{Times New Roman}  % \rmfamily for English
\setsansfont{Arial}            % \sffamily for English
\setmonofont{Courier New}      % \ttfamily for English

% --- Paragraph Formatting ---
\setlength{\parindent}{2em} % em is provided by xeCJK
\setstretch{1.5}
\setlength{\parskip}{0pt}
\raggedbottom

% --- Section Title Formatting (titlesec package) ---
\newcommand{\thesis@fontsizethree}{16bp}
\newcommand{\thesis@fontsizesmallthree}{15bp}
\newcommand{\thesis@fontsizefour}{14bp}
\newcommand{\thesis@fontsizesmallfour}{12bp}

\newcommand{\thesis@section@indent}{2em}
\newcommand{\thesis@section@beforeskip}{0.5\baselineskip}
\newcommand{\thesis@section@afterskip}{0.5\baselineskip}
\newcommand{\thesis@heading@linespacingfactor}{1.5}

% 1. 一级标题格式 (黑体 - Sans Serif)
\renewcommand{\thesection}{\zhnum{section}、}
\titleformat{\section}
  {\normalfont\sffamily\fontsize{\thesis@fontsizethree}{\dimexpr \thesis@fontsizethree * \thesis@heading@linespacingfactor \relax}\selectfont} % Use \sffamily for 黑体
  {\thesection}
  {0.5em}
  {}
\titlespacing{\section}
  {\thesis@section@indent}
  {\thesis@section@beforeskip}
  {\thesis@section@afterskip}

% 2. 二级标题格式 (黑体 - Sans Serif)
\renewcommand{\thesubsection}{（\zhnum{subsection}）}
\titleformat{\subsection}
  {\normalfont\sffamily\fontsize{\thesis@fontsizesmallthree}{\dimexpr \thesis@fontsizesmallthree * \thesis@heading@linespacingfactor \relax}\selectfont} % Use \sffamily for 黑体
  {\thesubsection}
  {0.5em}
  {}
\titlespacing{\subsection}
  {\thesis@section@indent}
  {\thesis@section@beforeskip}
  {\thesis@section@afterskip}

% 3. 三级标题格式 (黑体 - Sans Serif)
\renewcommand{\thesubsubsection}{\arabic{subsubsection}、}
\titleformat{\subsubsection}
  {\normalfont\sffamily\fontsize{\thesis@fontsizefour}{\dimexpr \thesis@fontsizefour * \thesis@heading@linespacingfactor \relax}\selectfont} % Use \sffamily for 黑体
  {\thesubsubsection}
  {0.5em}
  {}
\titlespacing{\subsubsection}
  {\thesis@section@indent}
  {\thesis@section@beforeskip}
  {\thesis@section@afterskip}

% 4. 四级标题格式 (宋体加粗 - Main CJK font, bold)
\renewcommand{\theparagraph}{（\arabic{paragraph}）}
\titleformat{\paragraph}[display]
  {\normalfont\bfseries\fontsize{\thesis@fontsizesmallfour}{\dimexpr \thesis@fontsizesmallfour * \thesis@heading@linespacingfactor \relax}\selectfont} % \normalfont for 宋体, \bfseries for 加粗
  {\theparagraph}
  {0.5em}
  {}
\titlespacing{\paragraph}
  {\thesis@section@indent}
  {\thesis@section@beforeskip}
  {\thesis@section@afterskip}

% --- Numbering Depth ---
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

% 自定义信息参数传递
\newcommand\articletitle[1]{\def\@articletitle{#1}}		%标题
% \newcommand\major[1]{\def\@major{#1}}					%专业
% \newcommand\college[1]{\def\@college{#1}}				%学院
\newcommand\name[1]{\def\@name{#1}}						%姓名
\newcommand\stuid[1]{\def\@stuid{#1}}					%学号
% \renewcommand\date[1]{\def\@date{#1}}					%日期
% \newcommand\course[1]{\def\@course{#1}}					%课程
% \newcommand\instructor[1]{\def\@instructor{#1}} 		%导师
\newcommand\Abstract[1]{\def\@Abstract{#1}} 			%摘要
\newcommand\Keyword[1]{\def\@Keyword{#1}} 				%关键词
\newcommand\engarticletitle[1]{\def\@engarticletitle{#1}}		%英标题
\newcommand\engname[1]{\def\@engname{#1}}						%英姓名
\newcommand\engAbstract[1]{\def\@engAbstract{#1}} 			%英摘要
\newcommand\engKeyword[1]{\def\@engKeyword{#1}} 				%英关键词
%
% 头部
\newcommand{\makeheader}{
  %标题
  \begin{center}
    \bfseries\huge{\@articletitle}
  \end{center}
  %间距0.4cm
  \vspace{0.3cm}
  %个人信息
  \begin{center}
    {\Large\kaishu{\@name,\@stuid}}\par
    \vspace{0.2cm}
  \end{center}
  %摘要
  {\noindent\normalsize\textbf{摘要：}}
  {\normalsize\kaishu{\@Abstract}} \par
  %关键词
  {\noindent\normalsize\textbf{关键词：}}
  {\normalsize\kaishu{\@Keyword}}
  \vspace{0.2cm}
}

\newcommand{\makeengheader}{
  %标题
  \begin{center}
    \bfseries\large{\@engarticletitle}
  \end{center}
  %间距0.2cm
  \vspace{0.2cm}
  %个人信息
  \begin{center}
    {\large\kaishu{\@engname,\@stuid}}\par
  \end{center}
  %摘要
  {\noindent\normalsize\heiti{\textbf{Abstract:}}}
  {\normalsize\kaishu{\@engAbstract}} \par
  %关键词
  {\noindent\normalsize\heiti{\textbf{Key words:}}}
  {\normalsize\kaishu{\@engKeyword}}
  \vspace{0.2cm}
}
\newcommand{\maketitles}{
  \makeheader
  \makeengheader
}
%



\endinput