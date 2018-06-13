\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eletter2}[2005/06/15 EEE letter style, ekvling@ntu.edu.sg]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions
\LoadClass{letter}

\RequirePackage[pdftex]{graphicx}
\RequirePackage{fancyhdr}

\lhead{\hspace{-2mm}\includegraphics[height=26mm]{encabezado.png}} 
\lfoot{\vspace{6mm}\ \\ \hspace{-2mm}\includegraphics[height=18mm]{PiePag.png}} 
\chead{} \rhead{} \cfoot{} \rfoot{}

\renewcommand{\opening}[1]{\ifx\@empty\fromaddress
    \thispagestyle{fancy}

    {\vspace*{4\parskip}\ \\
     \@date\par}%
    \vspace{2\parskip}%
  \else  % home address
    \thispagestyle{empty}%
    {\raggedleft\begin{tabular}{l@{}}\ignorespaces
      \fromaddress \\*[2\parskip]%
      \@date \end{tabular}\par}%
  \fi
  %\vspace{2\parskip}%
  {\raggedright \toname \\ \toaddress \par}%
  \vspace{2\parskip}%
  #1\par\nobreak}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\headsep 0mm

\setlength{\parindent}{0mm}
\setlength{\parskip}{5mm}
\setlength{\voffset}{-1in}
\setlength{\hoffset}{-1in}
\setlength{\textwidth}{155mm}
\setlength{\textheight}{235mm}
\setlength{\oddsidemargin}{25mm}
\setlength{\topmargin}{10mm}
