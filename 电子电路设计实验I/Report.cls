% experimentreport.cls
% 最终修正版 - 严格按照用户提供的完整 .tex 代码
\ProvidesClass{experimentreport}[2025/11/16 Custom Class for Experiment Reports]
\LoadClass[12pt,a4paper]{article}

% --- 1. 宏包加载 (来自您的 .tex 文件) ---
\RequirePackage[UTF8]{ctex}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{ulem}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
\RequirePackage{multicol}
\RequirePackage[export]{adjustbox}
\RequirePackage{amsmath}
\RequirePackage[utf8]{inputenc}
\RequirePackage{CJKutf8}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
% \RequirePackage{ulem} % 已经加载过了
\RequirePackage{tabularx}
\RequirePackage{float} % 为了使用 [H] 位置参数
\RequirePackage{hyperref} % 为了更好地控制图表标题
\RequirePackage{cleveref} % 为了更好地控制图表标题
\RequirePackage{booktabs} % 为了更好地控制图表标题
% --- 2. 占位符定义 ---
\def\@StudentName{请填写姓名}
\def\@StudentID{请填写学号}
\def\@Major{请填写专业}
\def\@ReportDate{YYYY年MM月DD日}
\def\@ReportLocation{请填写地点}
\def\@CourseName{请填写课程名称}
\def\@TeacherName{请填写指导老师}
\def\@ExperimentName{请填写实验名称}
\def\@ExperimentType{请填写实验类型}
\def\@TeamMate{请填写同组学生}
\def\@ReportLogo{example-image-a}

\newcommand{\StudentName}[1]{\def\@StudentName{#1}}
\newcommand{\StudentID}[1]{\def\@StudentID{#1}}
\newcommand{\Major}[1]{\def\@Major{#1}}
\newcommand{\ReportDate}[1]{\def\@ReportDate{#1}}
\newcommand{\ReportLocation}[1]{\def\@ReportLocation{#1}}
\newcommand{\CourseName}[1]{\def\@CourseName{#1}}
\newcommand{\TeacherName}[1]{\def\@TeacherName{#1}}
\newcommand{\ExperimentName}[1]{\def\@ExperimentName{#1}}
\newcommand{\ExperimentType}[1]{\def\@ExperimentType{#1}}
\newcommand{\TeamMate}[1]{\def\@TeamMate{#1}}
\newcommand{\ReportLogo}[1]{\def\@ReportLogo{#1}}
\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefname{equation}{式}{式}
% \crefmultiformat{figure}{图~#1}{ 和~#1}{、#1}{ 和~#1}

% 更复杂的格式，例如想让引用显示为 “图 1-1”
% #1 是标签名, #2 是数字, #3 是备注
\crefformat{figure}{图~#2#1#3}
\crefformat{table}{表~#2#1#3}
\crefformat{equation}{式~(#2#1#3)}
% --- 3. 页眉页脚设置 (来自您的 .tex 文件, 已替换占位符) ---
\pagestyle{fancy}
\fancyhf{} % 清除所有页眉页脚
% 设置页眉内容
\fancyhead[C]{
    \makebox[4.5em][c]{实验名称：} \uline{\makebox[14em][c]{\@ExperimentName}}
    \makebox[2.5em][c]{姓名：} \uline{\makebox[4em][c]{\@StudentName}}
    \makebox[2.5em][c]{学号：} \uline{\makebox[5em][c]{\@StudentID}}
}
\fancyfoot[C]{第 \thepage\ 页，共 \pageref{LastPage} 页}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\setlength{\headheight}{50pt}
\fancypagestyle{plain}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot[C]{第 \thepage\ 页，共 \pageref{LastPage} 页}
}

% --- 4. 页面和字体 (来自您的 .tex 文件) ---
\geometry{left=2.54cm,right=1.5cm,top=2.54cm,bottom=2.54cm}
\renewcommand{\normalsize}{\fontsize{12pt}{18pt}\selectfont}

% 1. 强制设置 Section 编号为中文大写 "一"
\renewcommand{\thesection}{\chinese{section}、}
% 2. 强制设置 Subsection 编号为 "4.1" 格式 (Section部分使用阿拉伯数字，确保和后面的 4.1, 4.2 匹配)
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
% 3. 确保 LaTeX 自动编号深度至少到 subsection
\setcounter{secnumdepth}{2}

% --- 5. 章节格式 (来自您的 .tex 文件) ---
% (注意：您的 .tex 文件使用 \section* 手动编号, 所以这里只设置字体)
\titleformat{\section}{\fontsize{16pt}{24pt}\selectfont\bfseries}{\thesection}{0em}{}
% 次级标题格式：4.1 实验方案
\titleformat{\subsection}{\fontsize{15pt}{22.5pt}\selectfont\bfseries}{\thesubsection}{0em}{}
% --- 6. 封面生成命令 \makecover ---
% (此部分代码 *逐字* 拷贝自您的 .tex 文件, 仅替换占位符)
\newcommand{\makecover}{
    \thispagestyle{plain}%第一页使用 plain 样式
    % 标题部分 - 两栏布局
    \begin{multicols}{2}
        % 左栏：图片和实验报告标题
        \noindent
        ~\\ ~\\ ~\\ % 前三行
        \hphantom{占位}%
        \raisebox{-0.5\baselineskip}%
        {\includegraphics[width=1.85in,height=0.58in]{\@ReportLogo}}
        \hspace{.5em}%
        \raisebox{0pt}[\height][0pt]%
        {\textbf{\fontsize{26pt}{30pt}\selectfont 实验报告}}

        \columnbreak % 换到右栏

        % 右栏：个人信息
        \begin{flushright}
            \makebox[3em][l]{专业：} \uline{\makebox[9em][c]{\@Major}} \\
            \makebox[3em][l]{姓名：} \uline{\makebox[9em][c]{\@StudentName}} \\
            \makebox[3em][l]{学号：} \uline{\makebox[9em][c]{\@StudentID}} \\
            \makebox[3em][l]{日期：} \uline{\makebox[9em][c]{\@ReportDate}} \\
            \makebox[3em][l]{地点：} \uline{\makebox[9em][c]{\@ReportLocation}} \\
        \end{flushright}
    \end{multicols}

    % 课程名称等信息（单栏）
    % (!! 关键修正：完全使用您代码中的 \uline{...} 结构)
    \noindent
    课程名称： \uline{\@CourseName} \hfill 指导老师： \uline{\@TeacherName} \hfill 成绩： \uline{\hspace{3cm}} \\
    实验名称： \uline{\@ExperimentName} \hfill 实验类型： \uline{\@ExperimentType} \hfill 同组学生姓名： \uline{\@TeamMate}
}

% --- 设置列表格式 ---
\setlist[enumerate,1]{label={(\arabic*)}, ref={(\arabic*)}}