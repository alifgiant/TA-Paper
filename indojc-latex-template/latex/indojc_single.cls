\ProvidesClass{TSoCtran}[2012/12/27 V1.8 by Michael Shell from IEEEtran edited on 2016/02/29 by Gia]

\NeedsTeXFormat{LaTeX2e}


% TSoCtran.cls version numbers, provided as of V1.3
% These values serve as a way a .tex file can
% determine if the new features are provided.
% The version number of this TSoCtrans.cls can be obtained from 
% these values. i.e., V1.4
% KEEP THESE AS INTEGERS! i.e., NO {4a} or anything like that-
% (no need to enumerate "a" minor changes here)
\def\TSoCtransversionmajor{1}
\def\TSoCtransversionminor{8}

% These do nothing, but provide them like in article.cls
\newif\if@restonecol
\newif\if@titlepage


% class option conditionals
\newif\ifCLASSOPTIONonecolumn       \CLASSOPTIONonecolumntrue
\newif\ifCLASSOPTIONtwocolumn       \CLASSOPTIONtwocolumnfalse

\newif\ifCLASSOPTIONoneside         \CLASSOPTIONonesidetrue
\newif\ifCLASSOPTIONtwoside         \CLASSOPTIONtwosidetrue

\newif\ifCLASSOPTIONfinal           \CLASSOPTIONfinaltrue
\newif\ifCLASSOPTIONdraft           \CLASSOPTIONdraftfalse
\newif\ifCLASSOPTIONdraftcls        \CLASSOPTIONdraftclsfalse
\newif\ifCLASSOPTIONdraftclsnofoot  \CLASSOPTIONdraftclsnofootfalse

\newif\ifCLASSOPTIONpeerreview      \CLASSOPTIONpeerreviewfalse
\newif\ifCLASSOPTIONpeerreviewca    \CLASSOPTIONpeerreviewcafalse

\newif\ifCLASSOPTIONjournal         \CLASSOPTIONjournaltrue
\newif\ifCLASSOPTIONconference      \CLASSOPTIONconferencefalse
\newif\ifCLASSOPTIONtechnote        \CLASSOPTIONtechnotefalse

\newif\ifCLASSOPTIONnofonttune      \CLASSOPTIONnofonttunefalse

\newif\ifCLASSOPTIONcaptionsoff     \CLASSOPTIONcaptionsofffalse

\newif\ifCLASSOPTIONcompsoc         \CLASSOPTIONcompsocfalse
\newif\ifCLASSOPTIONtransmag        \CLASSOPTIONtransmagfalse

\newif\ifCLASSOPTIONromanappendices \CLASSOPTIONromanappendicesfalse


% class info conditionals

% indicates if pdf (via pdflatex) output
\newif\ifCLASSINFOpdf               \CLASSINFOpdffalse


% V1.6b internal flag to show if using a4paper
\newif\if@TSoCusingAfourpaper       \@TSoCusingAfourpaperfalse



% TSoCtran class scratch pad registers
% dimen
\newdimen\@TSoCtrantmpdimenA
\newdimen\@TSoCtrantmpdimenB
% count
\newcount\@TSoCtrantmpcountA
\newcount\@TSoCtrantmpcountB
% token list
\newtoks\@TSoCtrantmptoksA

% we use \CLASSOPTIONpt so that we can ID the point size (even for 9pt docs)
% as well as LaTeX's \@ptsize to retain some compatability with some
% external packages
\def\@ptsize{0}
% LaTeX does not support 9pt, so we set \@ptsize to 0 - same as that of 10pt
\DeclareOption{9pt}{\def\CLASSOPTIONpt{9}\def\@ptsize{0}}
\DeclareOption{10pt}{\def\CLASSOPTIONpt{10}\def\@ptsize{0}}
\DeclareOption{11pt}{\def\CLASSOPTIONpt{11}\def\@ptsize{1}}
\DeclareOption{12pt}{\def\CLASSOPTIONpt{12}\def\@ptsize{2}}



\DeclareOption{letterpaper}{\setlength{\paperheight}{11in}%
                            \setlength{\paperwidth}{8.5in}%
                            \@TSoCusingAfourpaperfalse
                            \def\CLASSOPTIONpaper{letter}%
                            \def\CLASSINFOpaperwidth{8.5in}%
                            \def\CLASSINFOpaperheight{11in}}


\DeclareOption{a4paper}{\setlength{\paperheight}{297mm}%
                        \setlength{\paperwidth}{210mm}%
                        \@TSoCusingAfourpapertrue
                        \def\CLASSOPTIONpaper{a4}%
                        \def\CLASSINFOpaperwidth{210mm}%
                        \def\CLASSINFOpaperheight{297mm}}
%if you want equal margin right and left, set \@mparswitchfalse
\DeclareOption{oneside}{\@twosidefalse\@mparswitchfalse
                        \CLASSOPTIONonesidetrue\CLASSOPTIONtwosidefalse}
\DeclareOption{twoside}{\@twosidetrue\@mparswitchfalse
                        \CLASSOPTIONtwosidetrue\CLASSOPTIONonesidefalse}

\DeclareOption{onecolumn}{\CLASSOPTIONonecolumntrue\CLASSOPTIONtwocolumnfalse}
\DeclareOption{twocolumn}{\CLASSOPTIONtwocolumntrue\CLASSOPTIONonecolumnfalse}

% If the user selects draft, then this class AND any packages
% will go into draft mode.
\DeclareOption{draft}{\CLASSOPTIONdrafttrue\CLASSOPTIONdraftclstrue
                      \CLASSOPTIONdraftclsnofootfalse} 
% draftcls is for a draft mode which will not affect any packages
% used by the document.
\DeclareOption{draftcls}{\CLASSOPTIONdraftfalse\CLASSOPTIONdraftclstrue
                         \CLASSOPTIONdraftclsnofootfalse} 
% draftclsnofoot is like draftcls, but without the footer.
\DeclareOption{draftclsnofoot}{\CLASSOPTIONdraftfalse\CLASSOPTIONdraftclstrue
                               \CLASSOPTIONdraftclsnofoottrue} 
\DeclareOption{final}{\CLASSOPTIONdraftfalse\CLASSOPTIONdraftclsfalse
                      \CLASSOPTIONdraftclsnofootfalse}

\DeclareOption{journal}{\CLASSOPTIONpeerreviewfalse\CLASSOPTIONpeerreviewcafalse
                        \CLASSOPTIONjournaltrue\CLASSOPTIONconferencefalse\CLASSOPTIONtechnotefalse}

\DeclareOption{conference}{\CLASSOPTIONpeerreviewfalse\CLASSOPTIONpeerreviewcafalse
                           \CLASSOPTIONjournalfalse\CLASSOPTIONconferencetrue\CLASSOPTIONtechnotefalse}

\DeclareOption{technote}{\CLASSOPTIONpeerreviewfalse\CLASSOPTIONpeerreviewcafalse
                         \CLASSOPTIONjournalfalse\CLASSOPTIONconferencefalse\CLASSOPTIONtechnotetrue}

\DeclareOption{peerreview}{\CLASSOPTIONpeerreviewtrue\CLASSOPTIONpeerreviewcafalse
                           \CLASSOPTIONjournalfalse\CLASSOPTIONconferencefalse\CLASSOPTIONtechnotefalse}

\DeclareOption{peerreviewca}{\CLASSOPTIONpeerreviewtrue\CLASSOPTIONpeerreviewcatrue
                             \CLASSOPTIONjournalfalse\CLASSOPTIONconferencefalse\CLASSOPTIONtechnotefalse}

\DeclareOption{nofonttune}{\CLASSOPTIONnofonttunetrue}

\DeclareOption{captionsoff}{\CLASSOPTIONcaptionsofftrue}

\DeclareOption{compsoc}{\CLASSOPTIONcompsoctrue\CLASSOPTIONtransmagfalse}

\DeclareOption{transmag}{\CLASSOPTIONtransmagtrue\CLASSOPTIONcompsocfalse}

\DeclareOption{romanappendices}{\CLASSOPTIONromanappendicestrue}


% default to A4 paper, 10pt, twocolumn, one sided, final, journal
\ExecuteOptions{a4paper,10pt,onecolumn,twoside,final,journal}
% overrride these defaults per user requests
\ProcessOptions



% Computer Society conditional execution command
\long\def\@TSoCcompsoconly#1{\relax\ifCLASSOPTIONcompsoc\relax#1\relax\fi\relax}
% inverse
\long\def\@TSoCnotcompsoconly#1{\relax\ifCLASSOPTIONcompsoc\else\relax#1\relax\fi\relax}
% compsoc conference
\long\def\@TSoCcompsocconfonly#1{\relax\ifCLASSOPTIONcompsoc\ifCLASSOPTIONconference\relax#1\relax\fi\fi\relax}
% compsoc not conference
\long\def\@TSoCcompsocnotconfonly#1{\relax\ifCLASSOPTIONcompsoc\ifCLASSOPTIONconference\else\relax#1\relax\fi\fi\relax}


% TSoC uses Times Roman font, so we'll default to Times.
% These three commands make up the entire times.sty package.
\renewcommand{\sfdefault}{phv}
\renewcommand{\rmdefault}{ptm}
\renewcommand{\ttdefault}{pcr}

\@TSoCcompsoconly{\typeout{-- Using TSoC Computer Society mode.}}

% V1.7 compsoc nonconference papers, use Palatino/Palladio as the main text font,
% not Times Roman.
\@TSoCcompsocnotconfonly{\renewcommand{\rmdefault}{ppl}}

% enable Times/Palatino main text font
\normalfont\selectfont





% V1.7 conference notice message hook
\def\@TSoCconsolenoticeconference{\typeout{}%
\typeout{** Conference Paper **}%
\typeout{Before submitting the final camera ready copy, remember to:}%
\typeout{}%
\typeout{ 1. Manually equalize the lengths of two columns on the last page}%
\typeout{ of your paper;}%
\typeout{}%
\typeout{ 2. Ensure that any PostScript and/or PDF output post-processing}%
\typeout{ uses only Type 1 fonts and that every step in the generation}%
\typeout{ process uses the appropriate paper size.}%
\typeout{}}


% we can send console reminder messages to the user here
\AtEndDocument{\ifCLASSOPTIONconference\@TSoCconsolenoticeconference\fi}


% warn about the use of single column other than for draft mode
\ifCLASSOPTIONtwocolumn\else%
  \ifCLASSOPTIONdraftcls\else%
   \typeout{** ATTENTION: Single column mode is not typically used with TSoC publications.}%
  \fi%
\fi


% V1.7 improved paper size setting code.
% Set pdfpage and dvips paper sizes. Conditional tests are similar to that
% of ifpdf.sty. Retain within {} to ensure tested macros are never altered,
% even if only effect is to set them to \relax.
% if \pdfoutput is undefined or equal to relax, output a dvips special
{\@ifundefined{pdfoutput}{\AtBeginDvi{\special{papersize=\CLASSINFOpaperwidth,\CLASSINFOpaperheight}}}{%
% pdfoutput is defined and not equal to \relax
% check for pdfpageheight existence just in case someone sets pdfoutput
% under non-pdflatex. If exists, set them regardless of value of \pdfoutput.
\@ifundefined{pdfpageheight}{\relax}{\global\pdfpagewidth\paperwidth
\global\pdfpageheight\paperheight}%
% if using \pdfoutput=0 under pdflatex, send dvips papersize special
\ifcase\pdfoutput
\AtBeginDvi{\special{papersize=\CLASSINFOpaperwidth,\CLASSINFOpaperheight}}%
\else
% we are using pdf output, set CLASSINFOpdf flag
\global\CLASSINFOpdftrue
\fi}}

% let the user know the selected papersize
\typeout{-- Using \CLASSINFOpaperwidth\space x \CLASSINFOpaperheight\space
(\CLASSOPTIONpaper)\space paper.}

\ifCLASSINFOpdf
\typeout{-- Using PDF output.}
\else
\typeout{-- Using DVI output.}
\fi


% The idea hinted here is for LaTeX to generate markleft{} and markright{}
% automatically for you after you enter \author{}, \journal{},
% \journaldate{}, journalvol{}, \journalnum{}, etc.
% However, there may be some backward compatibility issues here as
% well as some special applications for TSoCtran.cls and special issues
% that may require the flexible \markleft{}, \markright{} and/or \markboth{}.
% We'll leave this as an open future suggestion.
%\newcommand{\journal}[1]{\def\@journal{#1}}
%\def\@journal{}



% pointsize values
% used with ifx to determine the document's normal size
\def\@TSoCptsizenine{9}
\def\@TSoCptsizeten{10}
\def\@TSoCptsizeeleven{11}
\def\@TSoCptsizetwelve{12}



% FONT DEFINITIONS (No sizexx.clo file needed) 
% V1.6 revised font sizes, displayskip values and
%      revised normalsize baselineskip to reduce underfull vbox problems
%      on the 58pc = 696pt = 9.5in text height we want
%      normalsize     #lines/column  baselineskip (aka leading)
%             9pt     63             11.0476pt (truncated down)
%            10pt     58             12pt      (exact)
%            11pt     52             13.3846pt (truncated down)
%            12pt     50             13.92pt   (exact)
%

% we need to store the nominal baselineskip for the given font size
% in case baselinestretch ever changes.
% this is a dimen, so it will not hold stretch or shrink
\newdimen\@TSoCnormalsizeunitybaselineskip
\@TSoCnormalsizeunitybaselineskip\baselineskip

\ifx\CLASSOPTIONpt\@TSoCptsizenine
\typeout{-- This is a 9 point document.}
\def\normalsize{\@setfontsize{\normalsize}{9}{11.0476pt}}%
\setlength{\@TSoCnormalsizeunitybaselineskip}{11.0476pt}%
\normalsize
\abovedisplayskip 1.5ex plus3pt minus1pt%
\belowdisplayskip \abovedisplayskip%
\abovedisplayshortskip 0pt plus3pt%
\belowdisplayshortskip 1.5ex plus3pt minus1pt
\def\small{\@setfontsize{\small}{8.5}{10pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{8}{9pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{7}{8pt}}
\def\tiny{\@setfontsize{\tiny}{5}{6pt}}
% sublargesize is the same as large - 10pt
\def\sublargesize{\@setfontsize{\sublargesize}{10}{12pt}}
\def\large{\@setfontsize{\large}{10}{12pt}}
\def\Large{\@setfontsize{\Large}{12}{14pt}}
\def\LARGE{\@setfontsize{\LARGE}{14}{17pt}}
\def\huge{\@setfontsize{\huge}{17}{20pt}}
\def\Huge{\@setfontsize{\Huge}{20}{24pt}}
\fi


% Check if we have selected 10 points
\ifx\CLASSOPTIONpt\@TSoCptsizeten
\typeout{-- This is a 10 point document.}
\def\normalsize{\@setfontsize{\normalsize}{10}{12.00pt}}%
\setlength{\@TSoCnormalsizeunitybaselineskip}{12pt}%
\normalsize
\abovedisplayskip 1.5ex plus4pt minus2pt%
\belowdisplayskip \abovedisplayskip%
\abovedisplayshortskip 0pt plus4pt%
\belowdisplayshortskip 1.5ex plus4pt minus2pt
\def\small{\@setfontsize{\small}{9}{10pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{8}{9pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{7}{8pt}}
\def\tiny{\@setfontsize{\tiny}{5}{6pt}}
% sublargesize is a tad smaller than large - 11pt
\def\sublargesize{\@setfontsize{\sublargesize}{11}{13.4pt}}
\def\large{\@setfontsize{\large}{12}{14pt}}
\def\Large{\@setfontsize{\Large}{14}{17pt}}
\def\LARGE{\@setfontsize{\LARGE}{17}{20pt}}
\def\huge{\@setfontsize{\huge}{20}{24pt}}
\def\Huge{\@setfontsize{\Huge}{24}{28pt}}
\fi


% Check if we have selected 11 points
\ifx\CLASSOPTIONpt\@TSoCptsizeeleven
\typeout{-- This is an 11 point document.}
\def\normalsize{\@setfontsize{\normalsize}{11}{13.3846pt}}%
\setlength{\@TSoCnormalsizeunitybaselineskip}{13.3846pt}%
\normalsize
\abovedisplayskip 1.5ex plus5pt minus3pt%
\belowdisplayskip \abovedisplayskip%
\abovedisplayshortskip 0pt plus5pt%
\belowdisplayshortskip 1.5ex plus5pt minus3pt
\def\small{\@setfontsize{\small}{10}{12pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{9}{10.5pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{8}{9pt}}
\def\tiny{\@setfontsize{\tiny}{6}{7pt}}
% sublargesize is the same as large - 12pt
\def\sublargesize{\@setfontsize{\sublargesize}{12}{14pt}}
\def\large{\@setfontsize{\large}{12}{14pt}}
\def\Large{\@setfontsize{\Large}{14}{17pt}}
\def\LARGE{\@setfontsize{\LARGE}{17}{20pt}}
\def\huge{\@setfontsize{\huge}{20}{24pt}}
\def\Huge{\@setfontsize{\Huge}{24}{28pt}}
\fi


% Check if we have selected 12 points
\ifx\CLASSOPTIONpt\@TSoCptsizetwelve
\typeout{-- This is a 12 point document.}
\def\normalsize{\@setfontsize{\normalsize}{12}{13.92pt}}%
\setlength{\@TSoCnormalsizeunitybaselineskip}{13.92pt}%
\normalsize
\abovedisplayskip 1.5ex plus6pt minus4pt%
\belowdisplayskip \abovedisplayskip%
\abovedisplayshortskip 0pt plus6pt%
\belowdisplayshortskip 1.5ex plus6pt minus4pt
\def\small{\@setfontsize{\small}{10}{12pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{9}{10.5pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{8}{9pt}}
\def\tiny{\@setfontsize{\tiny}{6}{7pt}}
% sublargesize is the same as large - 14pt
\def\sublargesize{\@setfontsize{\sublargesize}{14}{17pt}}
\def\large{\@setfontsize{\large}{14}{17pt}}
\def\Large{\@setfontsize{\Large}{17}{20pt}}
\def\LARGE{\@setfontsize{\LARGE}{20}{24pt}}
\def\huge{\@setfontsize{\huge}{22}{26pt}}
\def\Huge{\@setfontsize{\Huge}{24}{28pt}}
\fi


% V1.6 The Computer Modern Fonts will issue a substitution warning for
% 24pt titles (24.88pt is used instead) increase the substitution
% tolerance to turn off this warning
\def\fontsubfuzz{.9pt}
% However, the default (and correct) Times font will scale exactly as needed.


% warn the user in case they forget to use the 9pt option with
% technote
\ifCLASSOPTIONtechnote%
 \ifx\CLASSOPTIONpt\@TSoCptsizenine\else%
  \typeout{** ATTENTION: Technotes are normally 9pt documents.}%
 \fi%
\fi


% V1.7
% Improved \textunderscore to provide a much better fake _ when used with
% OT1 encoding. Under OT1, detect use of pcr or cmtt \ttfamily and use
% available true _ glyph for those two typewriter fonts.
\def\@TSoCstringptm{ptm} % Times Roman family
\def\@TSoCstringppl{ppl} % Palatino Roman family
\def\@TSoCstringphv{phv} % Helvetica Sans Serif family
\def\@TSoCstringpcr{pcr} % Courier typewriter family
\def\@TSoCstringcmtt{cmtt} % Computer Modern typewriter family
\DeclareTextCommandDefault{\textunderscore}{\leavevmode
\ifx\f@family\@TSoCstringpcr\string_\else
\ifx\f@family\@TSoCstringcmtt\string_\else
\ifx\f@family\@TSoCstringptm\kern 0em\vbox{\hrule\@width 0.5em\@height 0.5pt\kern -0.3ex}\else
\ifx\f@family\@TSoCstringppl\kern 0em\vbox{\hrule\@width 0.5em\@height 0.5pt\kern -0.3ex}\else
\ifx\f@family\@TSoCstringphv\kern -0.03em\vbox{\hrule\@width 0.62em\@height 0.52pt\kern -0.33ex}\kern -0.03em\else
\kern 0.09em\vbox{\hrule\@width 0.6em\@height 0.44pt\kern -0.63pt\kern -0.42ex}\kern 0.09em\fi\fi\fi\fi\fi\relax}




% set the default \baselinestretch
\def\baselinestretch{1}
\ifCLASSOPTIONdraftcls
  \def\baselinestretch{1.5}% default baselinestretch for draft modes
\fi 


% process CLASSINPUT baselinestretch
\ifx\CLASSINPUTbaselinestretch\@TSoCundefined
\else
  \edef\baselinestretch{\CLASSINPUTbaselinestretch} % user CLASSINPUT override
  \typeout{** ATTENTION: Overriding \string\baselinestretch\space to
           \baselinestretch\space via \string\CLASSINPUT.}
\fi

\normalsize % make \baselinestretch take affect




% store the normalsize baselineskip
\newdimen\CLASSINFOnormalsizebaselineskip
\CLASSINFOnormalsizebaselineskip=\baselineskip\relax
% and the normalsize unity (baselinestretch=1) baselineskip
% we could save a register by giving the user access to
% \@TSoCnormalsizeunitybaselineskip. However, let's protect
% its read only internal status
\newdimen\CLASSINFOnormalsizeunitybaselineskip
\CLASSINFOnormalsizeunitybaselineskip=\@TSoCnormalsizeunitybaselineskip\relax
% store the nominal value of jot
\newdimen\TSoCnormaljot
\TSoCnormaljot=0.25\baselineskip\relax

% set \jot
\jot=\TSoCnormaljot\relax




% V1.6, we are now going to fine tune the interword spacing
% The default interword glue for Times under TeX appears to use a
% nominal interword spacing of 25% (relative to the font size, i.e., 1em)
% a maximum of 40% and a minimum of 19%.
% For example, 10pt text uses an interword glue of:
% 
% 2.5pt plus 1.49998pt minus 0.59998pt
% 
% However, TSoC allows for a more generous range which reduces the need
% for hyphenation, especially for two column text. Furthermore, TSoC
% tends to use a little bit more nominal space between the words.
% TSoC's interword spacing percentages appear to be:
% 35% nominal
% 23% minimum
% 50% maximum
% (They may even be using a tad more for the largest fonts such as 24pt.)
% 
% for bold text, TSoC increases the spacing a little more:
% 37.5% nominal
% 23% minimum
% 55% maximum

% here are the interword spacing ratios we'll use
% for medium (normal weight)
\def\@TSoCinterspaceratioM{0.35}
\def\@TSoCinterspaceMINratioM{0.23}
\def\@TSoCinterspaceMAXratioM{0.50}

% for bold
\def\@TSoCinterspaceratioB{0.375}
\def\@TSoCinterspaceMINratioB{0.23}
\def\@TSoCinterspaceMAXratioB{0.55}


% command to revise the interword spacing for the current font under TeX:
% \fontdimen2 = nominal interword space
% \fontdimen3 = interword stretch
% \fontdimen4 = interword shrink
% since all changes to the \fontdimen are global, we can enclose these commands
% in braces to confine any font attribute or length changes
\def\@@@TSoCsetfontdimens#1#2#3{{%
\setlength{\@TSoCtrantmpdimenB}{\f@size pt}% grab the font size in pt, could use 1em instead.
\setlength{\@TSoCtrantmpdimenA}{#1\@TSoCtrantmpdimenB}%
\fontdimen2\font=\@TSoCtrantmpdimenA\relax
\addtolength{\@TSoCtrantmpdimenA}{-#2\@TSoCtrantmpdimenB}%
\fontdimen3\font=-\@TSoCtrantmpdimenA\relax
\setlength{\@TSoCtrantmpdimenA}{#1\@TSoCtrantmpdimenB}%
\addtolength{\@TSoCtrantmpdimenA}{-#3\@TSoCtrantmpdimenB}%
\fontdimen4\font=\@TSoCtrantmpdimenA\relax}}

% revise the interword spacing for each font weight
\def\@@TSoCsetfontdimens{{%
\mdseries
\@@@TSoCsetfontdimens{\@TSoCinterspaceratioM}{\@TSoCinterspaceMAXratioM}{\@TSoCinterspaceMINratioM}%
\bfseries
\@@@TSoCsetfontdimens{\@TSoCinterspaceratioB}{\@TSoCinterspaceMAXratioB}{\@TSoCinterspaceMINratioB}%
}}

% revise the interword spacing for each font shape
% \slshape is not often used for TSoC work and is not altered here. The \scshape caps are
% already a tad too large in the free LaTeX fonts (as compared to what TSoC uses) so we
% won't alter these either.
\def\@TSoCsetfontdimens{{%
\normalfont
\@@TSoCsetfontdimens
\normalfont\itshape
\@@TSoCsetfontdimens
}}

% command to revise the interword spacing for each font size (and shape
% and weight). Only the \rmfamily is done here as \ttfamily uses a 
% fixed spacing and \sffamily is not used as the main text of TSoC papers.
\def\@TSoCtunefonts{{\selectfont\rmfamily
\tiny\@TSoCsetfontdimens
\scriptsize\@TSoCsetfontdimens
\footnotesize\@TSoCsetfontdimens
\small\@TSoCsetfontdimens
\normalsize\@TSoCsetfontdimens
\sublargesize\@TSoCsetfontdimens
\large\@TSoCsetfontdimens
\LARGE\@TSoCsetfontdimens
\huge\@TSoCsetfontdimens
\Huge\@TSoCsetfontdimens}}

% if the nofonttune class option is not given, revise the interword spacing
% now - in case TSoCtran makes any default length measurements, and make
% sure all the default fonts are loaded
\ifCLASSOPTIONnofonttune\else
\@TSoCtunefonts
\fi

% and again at the start of the document in case the user loaded different fonts
\AtBeginDocument{\ifCLASSOPTIONnofonttune\else\@TSoCtunefonts\fi}



% V1.6 
% LaTeX is a little to quick to use hyphenations
% So, we increase the penalty for their use and raise
% the badness level that triggers an underfull hbox
% warning. The author may still have to tweak things,
% but the appearance will be much better "right out
% of the box" than that under V1.5 and prior.
% TeX default is 50
\hyphenpenalty=750
% If we didn't adjust the interword spacing, 2200 might be better.
% The TeX default is 1000
\hbadness=1350
% TSoC does not use extra spacing after punctuation
\frenchspacing

% V1.7 increase this a tad to discourage equation breaks
\binoppenalty=1000 % default 700
\relpenalty=800     % default 500


% margin note stuff
\marginparsep      0pt
\marginparwidth    0pt
\marginparpush     0pt


% if things get too close, go ahead and let them touch
\lineskip            0pt
\normallineskip      0pt
\lineskiplimit       0pt
\normallineskiplimit 0pt

% The distance from the lower edge of the text body to the
% footline
\footskip 0.4in

% normally zero, should be relative to font height.
% put in a little rubber to help stop some bad breaks (underfull vboxes)
\parskip 0ex plus 0.2ex minus 0.1ex

\parindent    1.0em

\topmargin    30mm
\headheight   12pt
\headsep      0.25in

% use the normal font baselineskip
% so that \topskip is unaffected by changes in \baselinestretch
\topskip=\@TSoCnormalsizeunitybaselineskip
% V1.8 \maxdepth defaults to 4pt, but should be font size dependent
\maxdepth=0.5\@TSoCnormalsizeunitybaselineskip
\textheight       58pc  % 9.63in, 696pt
% Tweak textheight to a perfect integer number of lines/page.
% The normal baselineskip for each document point size is used 
% to determine these values.
\ifx\CLASSOPTIONpt\@TSoCptsizenine\textheight=63\@TSoCnormalsizeunitybaselineskip\fi      % 63 lines/page
\ifx\CLASSOPTIONpt\@TSoCptsizeten\textheight=58\@TSoCnormalsizeunitybaselineskip\fi       % 58 lines/page
\ifx\CLASSOPTIONpt\@TSoCptsizeeleven\textheight=52\@TSoCnormalsizeunitybaselineskip\fi    % 52 lines/page
\ifx\CLASSOPTIONpt\@TSoCptsizetwelve\textheight=50\@TSoCnormalsizeunitybaselineskip\fi    % 50 lines/page


\columnsep         1pc
\textwidth		150mm
%\textwidth        43pc   % 2 x 21pc + 1pc = 43pc
 

% the default side margins are equal
\if@TSoCusingAfourpaper 
\oddsidemargin        30mm
\evensidemargin       30mm
\else
\oddsidemargin        30mm
\evensidemargin       30mm
\fi
% compensate for LaTeX's 1in offset
\addtolength{\oddsidemargin}{0in}
\addtolength{\evensidemargin}{0in}



% adjust margins for conference mode
\ifCLASSOPTIONjournal
 \topmargin        30mm
 % we retain the reserved, but unused space for headers
 \addtolength{\topmargin}{-\headheight}
 \addtolength{\topmargin}{-\headsep}
 \textheight        237mm % The standard for conferences (668.4975pt)
 % Tweak textheight to a perfect integer number of lines/page.
 \ifx\CLASSOPTIONpt\@TSoCptsizenine\textheight=61\@TSoCnormalsizeunitybaselineskip\fi      % 61 lines/page
 \ifx\CLASSOPTIONpt\@TSoCptsizeten\textheight=56\@TSoCnormalsizeunitybaselineskip\fi       % 56 lines/page
 \ifx\CLASSOPTIONpt\@TSoCptsizeeleven\textheight=50\@TSoCnormalsizeunitybaselineskip\fi    % 50 lines/page
 \ifx\CLASSOPTIONpt\@TSoCptsizetwelve\textheight=48\@TSoCnormalsizeunitybaselineskip\fi    % 48 lines/page
\fi


% compsoc conference
\ifCLASSOPTIONcompsoc
\ifCLASSOPTIONjournal
 % compsoc conference use a larger value for columnsep
 \columnsep 0.375in
 % compsoc conferences want 1in top margin, 1.125in bottom margin
 \topmargin        30mm
 \addtolength{\topmargin}{-6pt}% we tweak this a tad to better comply with top of line stuff
 % we retain the reserved, but unused space for headers
 \addtolength{\topmargin}{-\headheight}
 \addtolength{\topmargin}{-\headsep}
 \textheight        237mm % (641.39625pt)
 % Tweak textheight to a perfect integer number of lines/page.
 \ifx\CLASSOPTIONpt\@TSoCptsizenine\textheight=58\@TSoCnormalsizeunitybaselineskip\fi      % 58 lines/page
 \ifx\CLASSOPTIONpt\@TSoCptsizeten\textheight=53\@TSoCnormalsizeunitybaselineskip\fi       % 53 lines/page
 \ifx\CLASSOPTIONpt\@TSoCptsizeeleven\textheight=48\@TSoCnormalsizeunitybaselineskip\fi    % 48 lines/page
 \ifx\CLASSOPTIONpt\@TSoCptsizetwelve\textheight=46\@TSoCnormalsizeunitybaselineskip\fi    % 46 lines/page 
 \textwidth 150mm
 % the default side margins are equal
 \if@TSoCusingAfourpaper 
  \oddsidemargin        30mm
  \evensidemargin       30mm
 \else
  \oddsidemargin        30mm
  \evensidemargin       30mm
 \fi
 % compensate for LaTeX's 1in offset
 \addtolength{\oddsidemargin}{0in}
 \addtolength{\evensidemargin}{0in}
\fi\fi



% draft mode settings override that of all other modes
% provides a nice 1in margin all around the paper and extra
% space between the lines for editor's comments
\ifCLASSOPTIONdraftcls 
  % want 1in from top of paper to text
  \setlength{\topmargin}{-\headsep}%
  \addtolength{\topmargin}{-\headheight}%
  % we want 1in side margins regardless of paper type
  \oddsidemargin      0in
  \evensidemargin     0in
  % set the text width
  \setlength{\textwidth}{\paperwidth}%
  \addtolength{\textwidth}{0in}%
  \setlength{\textheight}{\paperheight}%
  \addtolength{\textheight}{0in}%
  % digitize textheight to be an integer number of lines.
  % this may cause the bottom margin to be off a tad
  \addtolength{\textheight}{\topskip}%
  \divide\textheight  by \baselineskip%
  \multiply\textheight  by \baselineskip%
  \addtolength{\textheight}{\topskip}%
\fi



% process CLASSINPUT inner/outer margin
% if inner margin defined, but outer margin not, set outer to inner.
\ifx\CLASSINPUTinnersidemargin\@TSoCundefined
\else
  \ifx\CLASSINPUToutersidemargin\@TSoCundefined
    \edef\CLASSINPUToutersidemargin{\CLASSINPUTinnersidemargin}
  \fi
\fi

\ifx\CLASSINPUToutersidemargin\@TSoCundefined
\else
  % if outer margin defined, but inner margin not, set inner to outer.
  \ifx\CLASSINPUTinnersidemargin\@TSoCundefined
    \edef\CLASSINPUTinnersidemargin{\CLASSINPUToutersidemargin}
  \fi
  \setlength{\oddsidemargin}{\CLASSINPUTinnersidemargin}
  \ifCLASSOPTIONtwoside
    \setlength{\evensidemargin}{\CLASSINPUToutersidemargin}
  \else
    \setlength{\evensidemargin}{\CLASSINPUTinnersidemargin}
  \fi
  \addtolength{\oddsidemargin}{0in}
  \addtolength{\evensidemargin}{0in}
  \setlength{\textwidth}{\paperwidth}
  \addtolength{\textwidth}{\CLASSINPUTinnersidemargin}
  \addtolength{\textwidth}{\CLASSINPUToutersidemargin}
  \typeout{** ATTENTION: Overriding inner side margin to \CLASSINPUTinnersidemargin\space and 
           outer side margin to \CLASSINPUToutersidemargin\space via \string\CLASSINPUT.}
\fi



% process CLASSINPUT top/bottom text margin
% if toptext margin defined, but bottomtext margin not, set bottomtext to toptext margin
\ifx\CLASSINPUTtoptextmargin\@TSoCundefined
\else
  \ifx\CLASSINPUTbottomtextmargin\@TSoCundefined
    \edef\CLASSINPUTbottomtextmargin{\CLASSINPUTtoptextmargin}
  \fi
\fi

\ifx\CLASSINPUTbottomtextmargin\@TSoCundefined
\else
  % if bottomtext margin defined, but toptext margin not, set toptext to bottomtext margin
  \ifx\CLASSINPUTtoptextmargin\@TSoCundefined
    \edef\CLASSINPUTtoptextmargin{\CLASSINPUTbottomtextmargin}
  \fi
  \setlength{\topmargin}{\CLASSINPUTtoptextmargin}
  \addtolength{\topmargin}{-1in}
  \addtolength{\topmargin}{-\headheight}
  \addtolength{\topmargin}{-\headsep}
  \setlength{\textheight}{\paperheight}
  \addtolength{\textheight}{-\CLASSINPUTtoptextmargin}
  \addtolength{\textheight}{-\CLASSINPUTbottomtextmargin}
  % in the default format we use the normal baselineskip as topskip
  % we only need 0.7 of this to clear typical top text and we need
  % an extra 0.3 spacing at the bottom for descenders. This will
  % correct for both.
  \addtolength{\topmargin}{-0.3\@TSoCnormalsizeunitybaselineskip}
  \typeout{** ATTENTION: Overriding top text margin to \CLASSINPUTtoptextmargin\space and 
           bottom text margin to \CLASSINPUTbottomtextmargin\space via \string\CLASSINPUT.}
\fi







% LIST SPACING CONTROLS

% Controls the amount of EXTRA spacing
% above and below \trivlist 
% Both \list and IED lists override this.
% However, \trivlist will use this as will most
% things built from \trivlist like the \center
% environment.
\topsep           0.5\baselineskip

% Controls the additional spacing around lists preceded
% or followed by blank lines. TSoC does not increase
% spacing before or after paragraphs so it is set to zero.
% \z@ is the same as zero, but faster.
\partopsep          \z@

% Controls the spacing between paragraphs in lists. 
% TSoC does not increase spacing before or after paragraphs
% so this is also zero. 
% With TSoCtran.cls, global changes to
% this value DO affect lists (but not IED lists).
\parsep             \z@

% Controls the extra spacing between list items. 
% TSoC does not put extra spacing between items.
% With TSoCtran.cls, global changes to this value DO affect
% lists (but not IED lists).
\itemsep            \z@

% \itemindent is the amount to indent the FIRST line of a list
% item. It is auto set to zero within the \list environment. To alter
% it, you have to do so when you call the \list.
% However, TSoC uses this for the theorem environment
% There is an alternative value for this near \leftmargini below
\itemindent         -1em

% \leftmargin, the spacing from the left margin of the main text to
% the left of the main body of a list item is set by \list.
% Hence this statement does nothing for lists.
% But, quote and verse do use it for indention.
\leftmargin         2em

% we retain this stuff from the older TSoCtran.cls so that \list
% will work the same way as before. However, itemize, enumerate and
% description (IED) could care less about what these are as they
% all are overridden.
\leftmargini        2em
%\itemindent         2em  % Alternative values: sometimes used.
%\leftmargini        0em
\leftmarginii       1em
\leftmarginiii    1.5em
\leftmarginiv     1.5em
\leftmarginv      1.0em
\leftmarginvi     1.0em
\labelsep         0.5em 
\labelwidth         \z@


% The old TSoCtran.cls behavior of \list is retained.
% However, the new V1.3 IED list environments override all the
% @list stuff (\@listX is called within \list for the
% appropriate level just before the user's list_decl is called). 
% \topsep is now 2pt as TSoC puts a little extra space around
% lists - used by those non-IED macros that depend on \list.
% Note that \parsep and \itemsep are not redefined as in 
% the sizexx.clo \@listX (which article.cls uses) so global changes
% of these values DO affect \list
% 
\def\@listi{\leftmargin\leftmargini \topsep 2pt plus 1pt minus 1pt}
\let\@listI\@listi
\def\@listii{\leftmargin\leftmarginii\labelwidth\leftmarginii%
    \advance\labelwidth-\labelsep \topsep 2pt}
\def\@listiii{\leftmargin\leftmarginiii\labelwidth\leftmarginiii%
    \advance\labelwidth-\labelsep \topsep 2pt}
\def\@listiv{\leftmargin\leftmarginiv\labelwidth\leftmarginiv%
    \advance\labelwidth-\labelsep \topsep 2pt}
\def\@listv{\leftmargin\leftmarginv\labelwidth\leftmarginv%
    \advance\labelwidth-\labelsep \topsep 2pt}
\def\@listvi{\leftmargin\leftmarginvi\labelwidth\leftmarginvi%
    \advance\labelwidth-\labelsep \topsep 2pt}


% TSoC uses 5) not 5.
\def\labelenumi{\theenumi)}     \def\theenumi{\arabic{enumi}}

% TSoC uses a) not (a)
\def\labelenumii{\theenumii)}  \def\theenumii{\alph{enumii}}

% TSoC uses iii) not iii.
\def\labelenumiii{\theenumiii)} \def\theenumiii{\roman{enumiii}}

% TSoC uses A) not A.
\def\labelenumiv{\theenumiv)}   \def\theenumiv{\Alph{enumiv}}

% exactly the same as in article.cls
\def\p@enumii{\theenumi}
\def\p@enumiii{\theenumi(\theenumii)}
\def\p@enumiv{\p@enumiii\theenumiii}

% itemized list label styles
\def\labelitemi{$\scriptstyle\bullet$}
\def\labelitemii{\textbf{--}}
\def\labelitemiii{$\ast$}
\def\labelitemiv{$\cdot$}



% **** V1.3 ENHANCEMENTS ****
% Itemize, Enumerate and Description (IED) List Controls
% ***************************
% 
% 
% TSoC seems to use at least two different values by
% which ITEMIZED list labels are indented to the right
% For The Journal of Lightwave Technology (JLT) and The Journal
% on Selected Areas in Communications (JSAC), they tend to use
% an indention equal to \parindent. For Transactions on Communications
% they tend to indent ITEMIZED lists a little more--- 1.3\parindent.
% We'll provide both values here for you so that you can choose 
% which one you like in your document using a command such as:
% setlength{\TSoCilabelindent}{\TSoCilabelindentB}
\newdimen\TSoCilabelindentA
\TSoCilabelindentA \parindent

\newdimen\TSoCilabelindentB
\TSoCilabelindentB 1.3\parindent
% However, we'll default to using \parindent
% which makes more sense to me
\newdimen\TSoCilabelindent
\TSoCilabelindent \TSoCilabelindentA


% This controls the default amount the enumerated list labels
% are indented to the right.
% Normally, this is the same as the paragraph indention
\newdimen\TSoCelabelindent
\TSoCelabelindent \parindent

% This controls the default amount the description list labels
% are indented to the right.
% Normally, this is the same as the paragraph indention
\newdimen\TSoCdlabelindent
\TSoCdlabelindent \parindent

% This is the value actually used within the IED lists.
% The IED environments automatically set its value to
% one of the three values above, so global changes do 
% not have any effect
\newdimen\TSoClabelindent
\TSoClabelindent \parindent

% The actual amount labels will be indented is
% \TSoClabelindent multiplied by the factor below
% corresponding to the level of nesting depth
% This provides a means by which the user can
% alter the effective \TSoClabelindent for deeper
% levels
% There may not be such a thing as correct "standard TSoC"
% values. What TSoC actually does may depend on the specific
% circumstances.
% The first list level almost always has full indention.
% The second levels I've seen have only 75% of the normal indentation
% Three level or greater nestings are very rare. I am guessing
% that they don't use any indentation.
\def\TSoClabelindentfactori{1.0}   % almost always one
\def\TSoClabelindentfactorii{0.75} % 0.0 or 1.0 may be used in some cases
\def\TSoClabelindentfactoriii{0.0} % 0.75? 0.5? 0.0?
\def\TSoClabelindentfactoriv{0.0}
\def\TSoClabelindentfactorv{0.0}
\def\TSoClabelindentfactorvi{0.0}

% value actually used within IED lists, it is auto
% set to one of the 6 values above
% global changes here have no effect
\def\TSoClabelindentfactor{1.0}

% This controls the default spacing between the end of the IED
% list labels and the list text, when normal text is used for
% the labels.
\newdimen\TSoCiednormlabelsep
\TSoCiednormlabelsep 0.6em

% This controls the default spacing between the end of the IED
% list labels and the list text, when math symbols are used for
% the labels (nomenclature lists). TSoC usually increases the 
% spacing in these cases
\newdimen\TSoCiedmathlabelsep
\TSoCiedmathlabelsep 1.2em

% This controls the extra vertical separation put above and
% below each IED list. TSoC usually puts a little extra spacing
% around each list. However, this spacing is barely noticeable.
\newskip\TSoCiedtopsep
\TSoCiedtopsep 2pt plus 1pt minus 1pt


% This command is executed within each IED list environment
% at the beginning of the list. You can use this to set the 
% parameters for some/all your IED list(s) without disturbing 
% global parameters that affect things other than lists.
% i.e., renewcommand{\TSoCiedlistdecl}{\setlength{\labelsep}{5em}}
% will alter the \labelsep for the next list(s) until 
% \TSoCiedlistdecl is redefined. 
\def\TSoCiedlistdecl{\relax}

% This command provides an easy way to set \leftmargin based
% on the \labelwidth, \labelsep and the argument \TSoClabelindent
% Usage: \TSoCcalcleftmargin{width-to-indent-the-label}
% output is in the \leftmargin variable, i.e., effectively:
% \leftmargin = argument + \labelwidth + \labelsep
% Note controlled spacing here, shield end of lines with %
\def\TSoCcalcleftmargin#1{\setlength{\leftmargin}{#1}%
\addtolength{\leftmargin}{\labelwidth}%
\addtolength{\leftmargin}{\labelsep}}

% This command provides an easy way to set \labelwidth to the
% width of the given text. It is the same as
% \settowidth{\labelwidth}{label-text}
% and useful as a shorter alternative.
% Typically used to set \labelwidth to be the width
% of the longest label in the list
\def\TSoCsetlabelwidth#1{\settowidth{\labelwidth}{#1}}

% When this command is executed, IED lists will use the 
% TSoCiedmathlabelsep label separation rather than the normal
% spacing. To have an effect, this command must be executed via
% the \TSoCiedlistdecl or within the option of the IED list
% environments.
\def\TSoCusemathlabelsep{\setlength{\labelsep}{\TSoCiedmathlabelsep}}

% A flag which controls whether the IED lists automatically
% calculate \leftmargin from \TSoClabelindent, \labelwidth and \labelsep
% Useful if you want to specify your own \leftmargin
% This flag must be set (\TSoCnocalcleftmargintrue or \TSoCnocalcleftmarginfalse) 
% via the \TSoCiedlistdecl or within the option of the IED list
% environments to have an effect.
\newif\ifTSoCnocalcleftmargin
\TSoCnocalcleftmarginfalse

% A flag which controls whether \TSoClabelindent is multiplied by
% the \TSoClabelindentfactor for each list level.
% This flag must be set via the \TSoCiedlistdecl or within the option 
% of the IED list environments to have an effect.
\newif\ifTSoCnolabelindentfactor
\TSoCnolabelindentfactorfalse


% internal variable to indicate type of IED label
% justification
% 0 - left; 1 - center; 2 - right
\def\@TSoCiedjustify{0}


% commands to allow the user to control IED
% label justifications. Use these commands within
% the IED environment option or in the \TSoCiedlistdecl
% Note that changing the normal list justifications
% is nonstandard and TSoC may not like it if you do so!
% I include these commands as they may be helpful to
% those who are using these enhanced list controls for
% other non-TSoC related LaTeX work.
% itemize and enumerate automatically default to right
% justification, description defaults to left.
\def\TSoCiedlabeljustifyl{\def\@TSoCiedjustify{0}}%left
\def\TSoCiedlabeljustifyc{\def\@TSoCiedjustify{1}}%center
\def\TSoCiedlabeljustifyr{\def\@TSoCiedjustify{2}}%right




% commands to save to and restore from the list parameter copies
% this allows us to set all the list parameters within
% the list_decl and prevent \list (and its \@list) 
% from overriding any of our parameters
% V1.6 use \edefs instead of dimen's to conserve dimen registers
% Note controlled spacing here, shield end of lines with %
\def\@TSoCsavelistparams{\edef\@TSoCiedtopsep{\the\topsep}%
\edef\@TSoCiedlabelwidth{\the\labelwidth}%
\edef\@TSoCiedlabelsep{\the\labelsep}%
\edef\@TSoCiedleftmargin{\the\leftmargin}%
\edef\@TSoCiedpartopsep{\the\partopsep}%
\edef\@TSoCiedparsep{\the\parsep}%
\edef\@TSoCieditemsep{\the\itemsep}%
\edef\@TSoCiedrightmargin{\the\rightmargin}%
\edef\@TSoCiedlistparindent{\the\listparindent}%
\edef\@TSoCieditemindent{\the\itemindent}}

% Note controlled spacing here
\def\@TSoCrestorelistparams{\topsep\@TSoCiedtopsep\relax%
\labelwidth\@TSoCiedlabelwidth\relax%
\labelsep\@TSoCiedlabelsep\relax%
\leftmargin\@TSoCiedleftmargin\relax%
\partopsep\@TSoCiedpartopsep\relax%
\parsep\@TSoCiedparsep\relax%
\itemsep\@TSoCieditemsep\relax%
\rightmargin\@TSoCiedrightmargin\relax%
\listparindent\@TSoCiedlistparindent\relax%
\itemindent\@TSoCieditemindent\relax}


% v1.6b provide original LaTeX IED list environments
% note that latex.ltx defines \itemize and \enumerate, but not \description
% which must be created by the base classes
% save original LaTeX itemize and enumerate
\let\LaTeXitemize\itemize
\let\endLaTeXitemize\enditemize
\let\LaTeXenumerate\enumerate
\let\endLaTeXenumerate\endenumerate

% provide original LaTeX description environment from article.cls
\newenvironment{LaTeXdescription}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                 \normalfont\bfseries #1}


% override LaTeX's default IED lists
\def\itemize{\@TSoCitemize}
\def\enditemize{\@endTSoCitemize}
\def\enumerate{\@TSoCenumerate}
\def\endenumerate{\@endTSoCenumerate}
\def\description{\@TSoCdescription}
\def\enddescription{\@endTSoCdescription}

% provide the user with aliases - may help those using packages that
% override itemize, enumerate, or description
\def\TSoCitemize{\@TSoCitemize}
\def\endTSoCitemize{\@endTSoCitemize}
\def\TSoCenumerate{\@TSoCenumerate}
\def\endTSoCenumerate{\@endTSoCenumerate}
\def\TSoCdescription{\@TSoCdescription}
\def\endTSoCdescription{\@endTSoCdescription}


% V1.6 we want to keep the TSoCtran IED list definitions as our own internal
% commands so they are protected against redefinition
\def\@TSoCitemize{\@ifnextchar[{\@@TSoCitemize}{\@@TSoCitemize[\relax]}}
\def\@TSoCenumerate{\@ifnextchar[{\@@TSoCenumerate}{\@@TSoCenumerate[\relax]}}
\def\@TSoCdescription{\@ifnextchar[{\@@TSoCdescription}{\@@TSoCdescription[\relax]}}
\def\@endTSoCitemize{\endlist}
\def\@endTSoCenumerate{\endlist}
\def\@endTSoCdescription{\endlist}


% DO NOT ALLOW BLANK LINES TO BE IN THESE IED ENVIRONMENTS
% AS THIS WILL FORCE NEW PARAGRAPHS AFTER THE IED LISTS
% TSoCtran itemized list MDS 1/2001
% Note controlled spacing here, shield end of lines with %
\def\@@TSoCitemize[#1]{%
                \ifnum\@itemdepth>3\relax\@toodeep\else%
                \ifnum\@listdepth>5\relax\@toodeep\else%
                \advance\@itemdepth\@ne%
                \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
                % get the TSoClabelindentfactor for this level
                \advance\@listdepth\@ne% we need to know what the level WILL be
                \edef\TSoClabelindentfactor{\csname TSoClabelindentfactor\romannumeral\the\@listdepth\endcsname}%
                \advance\@listdepth-\@ne% undo our increment
                \def\@TSoCiedjustify{2}% right justified labels are default
                % set other defaults
                \TSoCnocalcleftmarginfalse%
                \TSoCnolabelindentfactorfalse%
                \topsep\TSoCiedtopsep%
                \TSoClabelindent\TSoCilabelindent%
                \labelsep\TSoCiednormlabelsep%
                \partopsep 0ex%
                \parsep 0ex%
                \itemsep 0ex%
                \rightmargin 0em%
                \listparindent 0em%
                \itemindent 0em%
                % calculate the label width
                % the user can override this later if
                % they specified a \labelwidth
                \settowidth{\labelwidth}{\csname labelitem\romannumeral\the\@itemdepth\endcsname}%
                \@TSoCsavelistparams% save our list parameters
                \list{\csname\@itemitem\endcsname}{%
                \@TSoCrestorelistparams% override any list{} changes
                                       % to our globals
                \let\makelabel\@TSoCiedmakelabel% v1.6b setup \makelabel
                \TSoCiedlistdecl% let user alter parameters
                #1\relax%
                % If the user has requested not to use the
                % TSoClabelindent factor, don't revise \TSoClabelindent
                \ifTSoCnolabelindentfactor\relax%
                \else\TSoClabelindent=\TSoClabelindentfactor\TSoClabelindent%
                \fi%
                % Unless the user has requested otherwise,
                % calculate our left margin based
                % on \TSoClabelindent, \labelwidth and
                % \labelsep
                \ifTSoCnocalcleftmargin\relax%
                \else\TSoCcalcleftmargin{\TSoClabelindent}%
                \fi}\fi\fi}%


% DO NOT ALLOW BLANK LINES TO BE IN THESE IED ENVIRONMENTS
% AS THIS WILL FORCE NEW PARAGRAPHS AFTER THE IED LISTS
% TSoCtran enumerate list MDS 1/2001
% Note controlled spacing here, shield end of lines with %
\def\@@TSoCenumerate[#1]{%
                \ifnum\@enumdepth>3\relax\@toodeep\else%
                \ifnum\@listdepth>5\relax\@toodeep\else%
                \advance\@enumdepth\@ne%
                \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
                % get the TSoClabelindentfactor for this level
                \advance\@listdepth\@ne% we need to know what the level WILL be
                \edef\TSoClabelindentfactor{\csname TSoClabelindentfactor\romannumeral\the\@listdepth\endcsname}%
                \advance\@listdepth-\@ne% undo our increment
                \def\@TSoCiedjustify{2}% right justified labels are default
                % set other defaults
                \TSoCnocalcleftmarginfalse%
                \TSoCnolabelindentfactorfalse%
                \topsep\TSoCiedtopsep%
                \TSoClabelindent\TSoCelabelindent%
                \labelsep\TSoCiednormlabelsep%
                \partopsep 0ex%
                \parsep 0ex%
                \itemsep 0ex%
                \rightmargin 0em%
                \listparindent 0em%
                \itemindent 0em%
                % calculate the label width
                % We'll set it to the width suitable for all labels using
                % normalfont 1) to 9)
                % The user can override this later
                \settowidth{\labelwidth}{9)}%
                \@TSoCsavelistparams% save our list parameters
                \list{\csname label\@enumctr\endcsname}{\usecounter{\@enumctr}%
                \@TSoCrestorelistparams% override any list{} changes
                                       % to our globals
                \let\makelabel\@TSoCiedmakelabel% v1.6b setup \makelabel
                \TSoCiedlistdecl% let user alter parameters 
                #1\relax%
                % If the user has requested not to use the
                % TSoClabelindent factor, don't revise \TSoClabelindent
                \ifTSoCnolabelindentfactor\relax%
                \else\TSoClabelindent=\TSoClabelindentfactor\TSoClabelindent%
                \fi%
                % Unless the user has requested otherwise,
                % calculate our left margin based
                % on \TSoClabelindent, \labelwidth and
                % \labelsep
                \ifTSoCnocalcleftmargin\relax%
                \else\TSoCcalcleftmargin{\TSoClabelindent}%
                \fi}\fi\fi}%


% DO NOT ALLOW BLANK LINES TO BE IN THESE IED ENVIRONMENTS
% AS THIS WILL FORCE NEW PARAGRAPHS AFTER THE IED LISTS
% TSoCtran description list MDS 1/2001
% Note controlled spacing here, shield end of lines with %
\def\@@TSoCdescription[#1]{%
                \ifnum\@listdepth>5\relax\@toodeep\else%
                % get the TSoClabelindentfactor for this level
                \advance\@listdepth\@ne% we need to know what the level WILL be
                \edef\TSoClabelindentfactor{\csname TSoClabelindentfactor\romannumeral\the\@listdepth\endcsname}%
                \advance\@listdepth-\@ne% undo our increment
                \def\@TSoCiedjustify{0}% left justified labels are default
                % set other defaults
                \TSoCnocalcleftmarginfalse%
                \TSoCnolabelindentfactorfalse%
                \topsep\TSoCiedtopsep% 
                \TSoClabelindent\TSoCdlabelindent%
                % assume normal labelsep
                \labelsep\TSoCiednormlabelsep%
                \partopsep 0ex%
                \parsep 0ex%
                \itemsep 0ex%
                \rightmargin 0em%
                \listparindent 0em%
                \itemindent 0em%
                % Bogus label width in case the user forgets
                % to set it.
                % TIP: If you want to see what a variable's width is you
                % can use the TeX command \showthe\width-variable to 
                % display it on the screen during compilation 
                % (This might be helpful to know when you need to find out
                % which label is the widest)
                \settowidth{\labelwidth}{Hello}%
                \@TSoCsavelistparams% save our list parameters
                \list{}{\@TSoCrestorelistparams% override any list{} changes
                                               % to our globals
                \let\makelabel\@TSoCiedmakelabel% v1.6b setup \makelabel
                \TSoCiedlistdecl% let user alter parameters 
                #1\relax%
                % If the user has requested not to use the
                % labelindent factor, don't revise \TSoClabelindent
                \ifTSoCnolabelindentfactor\relax%
                \else\TSoClabelindent=\TSoClabelindentfactor\TSoClabelindent%
                \fi%
                % Unless the user has requested otherwise,
                % calculate our left margin based
                % on \TSoClabelindent, \labelwidth and
                % \labelsep
                \ifTSoCnocalcleftmargin\relax%
                \else\TSoCcalcleftmargin{\TSoClabelindent}\relax%
                \fi}\fi}

% v1.6b we use one makelabel that does justification as needed.
\def\@TSoCiedmakelabel#1{\relax\if\@TSoCiedjustify 0\relax
\makebox[\labelwidth][l]{\normalfont #1}\else
\if\@TSoCiedjustify 1\relax
\makebox[\labelwidth][c]{\normalfont #1}\else
\makebox[\labelwidth][r]{\normalfont #1}\fi\fi}


% VERSE and QUOTE
% V1.7 define environments with newenvironment
\newenvironment{verse}{\let\\=\@centercr
    \list{}{\itemsep\z@ \itemindent -1.5em \listparindent \itemindent
    \rightmargin\leftmargin\advance\leftmargin 1.5em}\item\relax}
    {\endlist}
\newenvironment{quotation}{\list{}{\listparindent 1.5em \itemindent\listparindent
    \rightmargin\leftmargin \parsep 0pt plus 1pt}\item\relax}
    {\endlist}
\newenvironment{quote}{\list{}{\rightmargin\leftmargin}\item\relax}
    {\endlist}


% \titlepage
% provided only for backward compatibility. \maketitle is the correct
% way to create the title page. 
\newif\if@restonecol
\def\titlepage{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \else \newpage \fi \thispagestyle{empty}\c@page\z@}
\def\endtitlepage{\if@restonecol\twocolumn \else \newpage \fi}

% standard values from article.cls
\arraycolsep     5pt
\arrayrulewidth .4pt
\doublerulesep   2pt

\tabcolsep       6pt
\tabbingsep      0.5em


%% FOOTNOTES
%
%\skip\footins 10pt plus 4pt minus 2pt
% V1.6 respond to changes in font size
% space added above the footnotes (if present)
\skip\footins 0.9\baselineskip  plus 0.4\baselineskip  minus 0.2\baselineskip

% V1.6, we need to make \footnotesep responsive to changes
% in \baselineskip or strange spacings will result when in
% draft mode. Here is a little LaTeX secret - \footnotesep
% determines the height of an invisible strut that is placed
% *above* the baseline of footnotes after the first. Since
% LaTeX considers the space for characters to be 0.7\baselineskip
% above the baseline and 0.3\baselineskip below it, we need to
% use 0.7\baselineskip as a \footnotesep to maintain equal spacing
% between all the lines of the footnotes. TSoC often uses a tad
% more, so use 0.8\baselineskip. This slightly larger value also helps
% the text to clear the footnote marks. Note that \thanks in TSoCtran
% uses its own value of \footnotesep which is set in \maketitle.
{\footnotesize
\global\footnotesep 0.8\baselineskip}


\skip\@mpfootins = \skip\footins
\fboxsep = 3pt
\fboxrule = .4pt
% V1.6 use 1em, then use LaTeX2e's \@makefnmark
% Note that TSoC normally *left* aligns the footnote marks, so we don't need
% box resizing tricks here.
\long\def\@makefntext#1{\parindent 1em\indent\hbox{\@makefnmark}#1}% V1.6 use 1em
% V1.7 compsoc does not use superscipts for footnote marks
\ifCLASSOPTIONcompsoc
\def\@TSoCcompsocmakefnmark{\hbox{\normalfont\@thefnmark.\ }}
\long\def\@makefntext#1{\parindent 1em\indent\hbox{\@TSoCcompsocmakefnmark}#1}
\fi

% TSoC does not use footnote rules
\def\footnoterule{}

% V1.7 for compsoc, TSoC uses a footnote rule only for \thanks. We devise a "one-shot"
% system to implement this.
\newif\if@TSoCenableoneshotfootnoterule
\@TSoCenableoneshotfootnoterulefalse
\ifCLASSOPTIONcompsoc
\def\footnoterule{\relax\if@TSoCenableoneshotfootnoterule
\kern-5pt
\hbox to \columnwidth{\hfill\vrule width 0.5\columnwidth height 0.4pt\hfill}
\kern4.6pt
\global\@TSoCenableoneshotfootnoterulefalse
\else
\relax
\fi}
\fi

% V1.6 do not allow LaTeX to break a footnote across multiple pages
\interfootnotelinepenalty=10000

% V1.6 discourage breaks within equations
% Note that amsmath normally sets this to 10000,
% but LaTeX2e normally uses 100.
\interdisplaylinepenalty=2500

% default allows section depth up to /paragraph
\setcounter{secnumdepth}{4}

% technotes do not allow /paragraph
\ifCLASSOPTIONtechnote
   \setcounter{secnumdepth}{3}
\fi
% neither do compsoc conferences
\@TSoCcompsocconfonly{\setcounter{secnumdepth}{3}}


\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]

% used only by TSoCtran's TSoCeqnarray as other packages may
% have their own, different, implementations
\newcounter{TSoCsubequation}[equation]

% as shown when called by user from \ref, \label and in table of contents
\def\theequation{\arabic{equation}}                          % 1
\def\theTSoCsubequation{\theequation\alph{TSoCsubequation}}  % 1a (used only by TSoCtran's TSoCeqnarray)
\ifCLASSOPTIONcompsoc
% compsoc is all arabic
\def\thesection{\arabic{section}}                
\def\thesubsection{\thesection.\arabic{subsection}}
\def\thesubsubsection{\thesubsection.\arabic{subsubsection}}
\def\theparagraph{\thesubsubsection.\arabic{paragraph}}
\else
\def\thesection{\Roman{section}}                             % I
% V1.7, \mbox prevents breaks around - 
\def\thesubsection{\mbox{\thesection-\Alph{subsection}}}     % I-A
% V1.7 use I-A1 format used by TSoC rather than I-A.1
\def\thesubsubsection{\thesubsection\arabic{subsubsection}}  % I-A1
\def\theparagraph{\thesubsubsection\alph{paragraph}}         % I-A1a
\fi

% From Heiko Oberdiek. Because of the \mbox in \thesubsection, we need to
% tell hyperref to disable the \mbox command when making PDF bookmarks.
% This done already with hyperref.sty version 6.74o and later, but
% it will not hurt to do it here again for users of older versions.
\@ifundefined{pdfstringdefPreHook}{\let\pdfstringdefPreHook\@empty}{}%
\g@addto@macro\pdfstringdefPreHook{\let\mbox\relax}


% Main text forms (how shown in main text headings)
% V1.6, using \thesection in \thesectiondis allows changes
% in the former to automatically appear in the latter
\ifCLASSOPTIONcompsoc
  \ifCLASSOPTIONconference% compsoc conference
    \def\thesectiondis{\thesection.}
    \def\thesubsectiondis{\thesectiondis\arabic{subsection}.}
    \def\thesubsubsectiondis{\thesubsectiondis\arabic{subsubsection}.}
    \def\theparagraphdis{\thesubsubsectiondis\arabic{paragraph}.}
  \else% compsoc not conferencs
    \def\thesectiondis{\thesection}
    \def\thesubsectiondis{\thesectiondis.\arabic{subsection}}
    \def\thesubsubsectiondis{\thesubsectiondis.\arabic{subsubsection}}
    \def\theparagraphdis{\thesubsubsectiondis.\arabic{paragraph}}
  \fi
\else% not compsoc
  \def\thesectiondis{\thesection.}                   % I.
  \def\thesubsectiondis{\Alph{subsection}.}          % B.
  \def\thesubsubsectiondis{\arabic{subsubsection})}  % 3)
  \def\theparagraphdis{\alph{paragraph})}            % d)
\fi

% just like LaTeX2e's \@eqnnum
\def\theequationdis{{\normalfont \normalcolor (\theequation)}}% (1)
% TSoCsubequation used only by TSoCtran's TSoCeqnarray
\def\theTSoCsubequationdis{{\normalfont \normalcolor (\theTSoCsubequation)}}% (1a)
% redirect LaTeX2e's equation number display and all that depend on
% it, through TSoCtran's \theequationdis
\def\@eqnnum{\theequationdis}



% V1.7 provide string macros as article.cls does
\def\contentsname{Contents}
\def\listfigurename{List of Figures}
\def\listtablename{List of Tables}
\def\refname{References}
\def\indexname{Index}
\def\figurename{Fig.}
\def\tablename{TABLE}
\@TSoCcompsocconfonly{\def\figurename{Figure}\def\tablename{Table}}
\def\partname{Part}
\def\appendixname{Appendix}
\def\abstractname{Abstract}
% TSoC specific names
\def\keywordsname{Keywords}
\def\TSoCproofname{Proof}


% LIST OF FIGURES AND TABLES AND TABLE OF CONTENTS
%
\def\@pnumwidth{1.55em}
\def\@tocrmarg{2.55em}
\def\@dotsep{4.5}
\setcounter{tocdepth}{3}

% adjusted some spacings here so that section numbers will not easily 
% collide with the section titles. 
% VIII; VIII-A; and VIII-A.1 are usually the worst offenders.
% MDS 1/2001
\def\tableofcontents{\section*{\contentsname}\@starttoc{toc}}
\def\l@section#1#2{\addpenalty{\@secpenalty}\addvspace{1.0em plus 1pt}%
    \@tempdima 2.75em \begingroup \parindent \z@ \rightskip \@pnumwidth%
    \parfillskip-\@pnumwidth {\bfseries\leavevmode #1}\hfil\hbox to\@pnumwidth{\hss #2}\par%
    \endgroup}
% argument format #1:level, #2:labelindent,#3:labelsep
\def\l@subsection{\@dottedtocline{2}{2.75em}{3.75em}}
\def\l@subsubsection{\@dottedtocline{3}{6.5em}{4.5em}}
% must provide \l@ defs for ALL sublevels EVEN if tocdepth
% is such as they will not appear in the table of contents
% these defs are how TOC knows what level these things are!
\def\l@paragraph{\@dottedtocline{4}{6.5em}{5.5em}}
\def\l@subparagraph{\@dottedtocline{5}{6.5em}{6.5em}}
\def\listoffigures{\section*{\listfigurename}\@starttoc{lof}}
\def\l@figure{\@dottedtocline{1}{0em}{2.75em}}
\def\listoftables{\section*{\listtablename}\@starttoc{lot}}
\let\l@table\l@figure


% Definitions for floats
%
% Normal Floats
% V1.8 floatsep et al. revised down by 0.15\baselineskip
% to account for the sideeffects of \topskip compensation
\floatsep 0.85\baselineskip plus  0.2\baselineskip minus  0.2\baselineskip
\textfloatsep 1.55\baselineskip plus  0.2\baselineskip minus  0.4\baselineskip
\@fptop 0pt plus 1fil
\@fpsep 0.75\baselineskip plus 2fil 
\@fpbot 0pt plus 1fil
\def\topfraction{0.9}
\def\bottomfraction{0.4}
\def\floatpagefraction{0.8}
% V1.7, let top floats approach 90% of page
\def\textfraction{0.1}

% Double Column Floats
\dblfloatsep 0.85\baselineskip plus  0.2\baselineskip minus  0.2\baselineskip

\dbltextfloatsep 1.55\baselineskip plus  0.2\baselineskip minus  0.4\baselineskip
% Note that it would be nice if the rubber here actually worked in LaTeX2e.
% There is a long standing limitation in LaTeX, first discovered (to the best
% of my knowledge) by Alan Jeffrey in 1992. LaTeX ignores the stretchable
% portion of \dbltextfloatsep, and as a result, double column figures can and
% do result in an non-integer number of lines in the main text columns with
% underfull vbox errors as a consequence. A post to comp.text.tex
% by Donald Arseneau confirms that this had not yet been fixed in 1998.
% TSoCtran V1.6 will fix this problem for you in the titles, but it doesn't
% protect you from other double floats. Happy vspace'ing.

\@dblfptop 0pt plus 1fil
\@dblfpsep 0.75\baselineskip plus 2fil
\@dblfpbot 0pt plus 1fil
\def\dbltopfraction{0.8}
\def\dblfloatpagefraction{0.8}
\setcounter{dbltopnumber}{4}

\intextsep 0.85\baselineskip plus 0.2\baselineskip minus  0.2\baselineskip
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}



% article class provides these, we should too.
\newlength\abovecaptionskip
\newlength\belowcaptionskip
% but only \abovecaptionskip is used above figure captions and *below* table
% captions
\setlength\abovecaptionskip{0.5\baselineskip}
\setlength\belowcaptionskip{0pt}
% V1.6 create hooks in case the caption spacing ever needs to be
% overridden by a user
\def\@TSoCfigurecaptionsepspace{\vskip\abovecaptionskip\relax}%
\def\@TSoCtablecaptionsepspace{\vskip\abovecaptionskip\relax}%


% 1.6b revise caption system so that \@makecaption uses two arguments
% as with LaTeX2e. Otherwise, there will be problems when using hyperref.
\def\@TSoCtablestring{table}


% V1.8 compensate for \topskip so top of top figures align with tops of the first lines of main text
% here we calculate a space equal to the amount \topskip exceeds the main text height
% we hook in at \@floatboxreset
\def\@TSoCfiguretopskipspace{\ifdim\prevdepth=-1000pt\relax
\setlength{\@TSoCtrantmpdimenA}{1\topskip}\relax
\addtolength{\@TSoCtrantmpdimenA}{-0.7\@TSoCnormalsizeunitybaselineskip}\relax
\vspace*{\@TSoCtrantmpdimenA}\fi}
% V1.8 compensate for \topskip at the top of top tables so caption text is on main text baseline
% use a strut set on the caption baseline within \@makecaption
\def\@TSoCtabletopskipstrut{\ifdim\prevdepth=-1000pt\rule{0pt}{\topskip}\fi}
% the \ifdim\prevdepth checks are always expected to be true for TSoC style float caption ordering
% because top of figure content and top of captions in tables is the first thing on the vertical
% list of these floats
% thanks to Donald Arseneau for his 2000/11/11 post "Re: caption hacking" with info on this topic.


\ifCLASSOPTIONcompsoc
% V1.7 compsoc \@makecaption
\ifCLASSOPTIONconference% compsoc conference
\long\def\@makecaption#1#2{%
% test if is a for a figure or table
\ifx\@captype\@TSoCtablestring%
% if a table, do table caption
\normalsize\bgroup\par\centering\@TSoCtabletopskipstrut{\normalfont\sffamily\normalsize {#1.}\nobreakspace #2}\par\addvspace{0.5\baselineskip}\egroup%
\@TSoCtablecaptionsepspace
% if not a table, format it as a figure
\else
\@TSoCfigurecaptionsepspace
\setbox\@tempboxa\hbox{\normalfont\sffamily\normalsize {#1.}\nobreakspace #2}%
\ifdim \wd\@tempboxa >\hsize%
% if caption is longer than a line, let it wrap around
\setbox\@tempboxa\hbox{\normalfont\sffamily\normalsize {#1.}\nobreakspace}%
\parbox[t]{\hsize}{\normalfont\sffamily\normalsize \noindent\unhbox\@tempboxa#2}%
% if caption is shorter than a line, center
\else%
\hbox to\hsize{\normalfont\sffamily\normalsize\hfil\box\@tempboxa\hfil}%
\fi\fi}
%
\else% nonconference compsoc
\long\def\@makecaption#1#2{%
% test if is a for a figure or table
\ifx\@captype\@TSoCtablestring%
% if a table, do table caption
\normalsize\bgroup\par\centering\@TSoCtabletopskipstrut{\normalfont\sffamily\normalsize #1}\\{\normalfont\sffamily\normalsize #2}\par\addvspace{0.5\baselineskip}\egroup%
\@TSoCtablecaptionsepspace
% if not a table, format it as a figure
\else
\@TSoCfigurecaptionsepspace
\setbox\@tempboxa\hbox{\normalfont\sffamily\normalsize {#1.}\nobreakspace #2}%
\ifdim \wd\@tempboxa >\hsize%
% if caption is longer than a line, let it wrap around
\setbox\@tempboxa\hbox{\normalfont\sffamily\normalsize {#1.}\nobreakspace}%
\parbox[t]{\hsize}{\normalfont\sffamily\normalsize \noindent\unhbox\@tempboxa#2}%
% if caption is shorter than a line, left justify
\else%
\hbox to\hsize{\normalfont\sffamily\normalsize\box\@tempboxa\hfil}%
\fi\fi}
\fi
%
\else% traditional noncompsoc \@makecaption
\long\def\@makecaption#1#2{%
% test if is a for a figure or table
\ifx\@captype\@TSoCtablestring%
% if a table, do table caption
\footnotesize\bgroup\par\centering\@TSoCtabletopskipstrut{\normalfont\footnotesize #1}\\{\normalfont\footnotesize\scshape #2}\par\addvspace{0.5\baselineskip}\egroup%
\@TSoCtablecaptionsepspace
% if not a table, format it as a figure
\else
\@TSoCfigurecaptionsepspace
% 3/2001 use footnotesize, not small; use two nonbreaking spaces, not one
\setbox\@tempboxa\hbox{\normalfont\footnotesize {#1.}\nobreakspace\nobreakspace #2}%
\ifdim \wd\@tempboxa >\hsize%
% if caption is longer than a line, let it wrap around
\setbox\@tempboxa\hbox{\normalfont\footnotesize {#1.}\nobreakspace\nobreakspace}%
\parbox[t]{\hsize}{\normalfont\footnotesize\noindent\unhbox\@tempboxa#2}%
% if caption is shorter than a line, center if conference, left justify otherwise
\else%
\ifCLASSOPTIONjournal \hbox to\hsize{\normalfont\footnotesize\hfil\box\@tempboxa\hfil}%
\else \hbox to\hsize{\normalfont\footnotesize\box\@tempboxa\hfil}%
\fi\fi\fi}
\fi



% V1.7 disable captions class option, do so in a way that retains operation of \label
% within \caption
\ifCLASSOPTIONcaptionsoff
\long\def\@makecaption#1#2{\vspace*{2em}\footnotesize\bgroup\par\addvspace{0.5\baselineskip}\centering{\footnotesize #1}\par\addvspace{0.5\baselineskip}\egroup%
\let\@TSoCtemporiglabeldefsave\label
\let\@TSoCtemplabelargsave\relax
\def\label##1{\gdef\@TSoCtemplabelargsave{##1}}%
\setbox\@tempboxa\hbox{#2}%
\let\label\@TSoCtemporiglabeldefsave
\ifx\@TSoCtemplabelargsave\relax\else\label{\@TSoCtemplabelargsave}\fi}
\fi


% V1.7 define end environments with \def not \let so as to work OK with
% preview-latex
\newcounter{figure}
\def\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
% V1.8 within figures add \@TSoCfiguretopskipspace compensation to LaTeX2e's \@floatboxreset
\def\figure{\def\@floatboxreset{\reset@font\normalsize\@setminipage\@TSoCfiguretopskipspace}\@float{figure}}
\def\endfigure{\end@float}
% V1.8 also add \@TSoCfiguretopskipspace compensation to \figure*
\@namedef{figure*}{\def\@floatboxreset{\reset@font\normalsize\@setminipage\@TSoCfiguretopskipspace}\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat}

\newcounter{table}
\ifCLASSOPTIONcompsoc
\def\thetable{\arabic{table}}
\else
\def\thetable{\@Roman\c@table}
\fi
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
% V1.6 TSoC uses 8pt text for tables
% within tables alter LaTeX2e's \@floatboxreset to use \footnotesize
\def\table{\def\@floatboxreset{\reset@font\footnotesize\@setminipage}\@float{table}}
\def\endtable{\end@float}
% v1.6b double column tables need to default to footnotesize as well.
\@namedef{table*}{\def\@floatboxreset{\reset@font\footnotesize\@setminipage}\@dblfloat{table}}
\@namedef{endtable*}{\end@dblfloat}




%%
%% START OF TSoCeqnarray DEFINITIONS
%%
%% Inspired by the concepts, examples, and previous works of LaTeX 
%% coders and developers such as Donald Arseneau, Fred Bartlett, 
%% David Carlisle, Tony Liu, Frank Mittelbach, Piet van Oostrum, 
%% Roland Winkler and Mark Wooding.
%% I don't make the claim that my work here is even near their calibre. ;)


% hook to allow easy changeover to TSoCtran.cls/tools.sty error reporting
\def\@TSoCclspkgerror{\ClassError{TSoCtran}}

\newif\if@TSoCeqnarrayboxnojot% flag to indicate if the environment was called as the star form
\@TSoCeqnarrayboxnojotfalse

\newif\if@advanceTSoCeqncolcnt% tracks if the environment should advance the col counter
% allows a way to make an \TSoCeqnarraybox that can be used within an \TSoCeqnarray
% used by TSoCeqnarraymulticol so that it can work properly in both
\@advanceTSoCeqncolcnttrue

\newcount\@TSoCeqnnumcols % tracks how many TSoCeqnarray cols are defined
\newcount\@TSoCeqncolcnt  % tracks how many TSoCeqnarray cols the user actually used


% The default math style used by the columns
\def\TSoCeqnarraymathstyle{\displaystyle}
% The default text style used by the columns
% default to using the current font
\def\TSoCeqnarraytextstyle{\relax}

% like the iedlistdecl but for \TSoCeqnarray
\def\TSoCeqnarraydecl{\relax}
\def\TSoCeqnarrayboxdecl{\relax}



% V1.8 flags to indicate that equation numbering is to persist
\newif\if@TSoCeqnumpersist%
\@TSoCeqnumpersistfalse
\newif\if@TSoCsubeqnumpersist%
\@TSoCsubeqnumpersistfalse
%
% V1.8 flags to indicate if (sub)equation number of last line was preadvanced
\newif\if@TSoCeqnumpreadv%
\@TSoCeqnumpreadvfalse
\newif\if@TSoCsubeqnumpreadv%
\@TSoCsubeqnumpreadvfalse

\newcount\@TSoCsubeqnnumrollback% saves previous value of TSoCsubequation number in case we need to restore it

% \yesnumber is the opposite of \nonumber
% a novel concept with the same def as the equationarray package
% However, we give TSoC versions too since some LaTeX packages such as 
% the MDWtools mathenv.sty redefine \nonumber to something else.
% This command is intended for use in non-TSoCeqnarray math environments
\providecommand{\yesnumber}{\global\@eqnswtrue}


% TSoCyes/nonumber 
% V1.8 add persistant * forms
% These commands can alter the type of equation an TSoCeqnarray line is.
\def\TSoCyesnumber{\@ifstar{\global\@TSoCeqnumpersisttrue\global\@TSoCsubeqnumpersistfalse\@TSoCyesnumber}{\@TSoCyesnumber}}

\def\@TSoCyesnumber{\global\@eqnswtrue
\if@TSoCeqnarrayISinner% alter counters and label only inside an TSoCeqnarray
\ifnum\c@TSoCsubequation>0\relax
   \stepcounter{equation}\setcounter{TSoCsubequation}{0}\gdef\@currentlabel{\p@equation\theequation}\relax
   \gdef\@currentHref{\@TSoCtheHrefequation}% setup hyperref label
\fi
% even if we reached this eqn num via a preadv, it is legit now
\global\@TSoCeqnumpreadvfalse\global\@TSoCsubeqnumpreadvfalse
\fi}

\def\TSoCnonumber{\@ifstar{\global\@TSoCeqnumpersistfalse\global\@TSoCsubeqnumpersistfalse\global\@eqnswfalse}{\global\@eqnswfalse}}


\def\TSoCyessubnumber{\@ifstar{\global\@TSoCsubeqnumpersisttrue\@TSoCyessubnumber}{\@TSoCyessubnumber}}
%
\def\@TSoCyessubnumber{\if@TSoCeqnarrayISinner% alter counters and label only inside an TSoCeqnarray
  \ifnum\c@TSoCsubequation>0\relax% if it already is a subequation, we are good to go as-is
  \else% if we are a regular equation we have to watch out for two cases
    \if@TSoCeqnumpreadv% if this equation is the result of a preadvance, backout and bump the sub eqnnum
       \global\advance\c@equation\m@ne\global\c@TSoCsubequation=\@TSoCsubeqnnumrollback\addtocounter{TSoCsubequation}{1}\relax
    \else% non-preadvanced equations just need initialization of their sub eqnnum
       \setcounter{TSoCsubequation}{1}\relax
    \fi
  \fi% fi already is subequation
  \gdef\@currentlabel{\p@TSoCsubequation\theTSoCsubequation}\relax
  \gdef\@currentHref{\@TSoCtheHrefsubequation}% setup hyperref label
  \global\@TSoCeqnumpreadvfalse\global\@TSoCsubeqnumpreadvfalse% no longer a preadv anymore
  \global\@eqnswtrue
\fi}


\def\TSoCnosubnumber{\@ifstar{\global\@TSoCsubeqnumpersistfalse\@TSoCnosubnumber}{\@TSoCnosubnumber}}
%
\def\@TSoCnosubnumber{\if@TSoCeqnarrayISinner% alter counters and label only inside an TSoCeqnarray
  \if@eqnsw % we do nothing unless we know we will display because we play with the counters here
    % if it currently is a subequation, bump up to the next equation number and turn off the subequation
    \ifnum\c@TSoCsubequation>0\relax\addtocounter{equation}{1}\setcounter{TSoCsubequation}{0}\relax
    \fi
    \global\@TSoCeqnumpreadvfalse\global\@TSoCsubeqnumpreadvfalse% no longer a preadv anymore
    \gdef\@currentlabel{\p@equation\theequation}\relax
    \gdef\@currentHref{\@TSoCtheHrefequation}% setup hyperref label
  \fi
\fi}



% allows users to "push away" equations that get too close to the equation numbers
\def\TSoCeqnarraynumspace{\hphantom{\ifnum\c@TSoCsubequation>0\relax\theTSoCsubequationdis\else\theequationdis\fi}}

% provides a way to span multiple columns within TSoCeqnarray environments
% will consider \if@advanceTSoCeqncolcnt before globally advancing the
% column counter - so as to work within \TSoCeqnarraybox
% usage: \TSoCeqnarraymulticol{number cols. to span}{col type}{cell text}
\long\def\TSoCeqnarraymulticol#1#2#3{\multispan{#1}\relax
% check if column is defined for the precolumn definition
% We have to be careful here because TeX scans for & even within an \iffalse
% where it does not expand macros. So, if we used only one \ifx and a #3
% appeared in the false branch and the user inserted another alignment
% structure that uses & in the \TSoCeqnarraymulticol{}, TeX will not see that
% there is an inner alignment in the false branch yet still will see any &
% there and will think that they apply to the outer alignment resulting in an
% incomplete \ifx error.
% So, here we use separate checks for the pre and post parts in order to keep
% the #3 outside of all conditionals.
\relax\expandafter\ifx\csname @TSoCeqnarraycolDEF#2\endcsname\@TSoCeqnarraycolisdefined\relax
\csname @TSoCeqnarraycolPRE#2\endcsname
\else% if not, error and use default type
\@TSoCclspkgerror{Invalid column type "#2" in \string\TSoCeqnarraymulticol.\MessageBreak
Using a default centering column instead}%
{You must define TSoCeqnarray column types before use.}%
\csname @TSoCeqnarraycolPRE@TSoCdefault\endcsname
\fi
% The ten \relax are to help prevent misleading error messages in case a user
% accidently inserted a macro that tries to acquire additional arguments.
#3\relax\relax\relax\relax\relax\relax\relax\relax\relax\relax
% check if column is defined for the postcolumn definition
\expandafter\ifx\csname @TSoCeqnarraycolDEF#2\endcsname\@TSoCeqnarraycolisdefined\relax
\csname @TSoCeqnarraycolPOST#2\endcsname
\else% if not, use the default type
\csname @TSoCeqnarraycolPOST@TSoCdefault\endcsname
\fi
% advance column counter only if the TSoCeqnarray environment wants it
\if@advanceTSoCeqncolcnt\global\advance\@TSoCeqncolcnt by #1\relax\fi}

% like \omit, but maintains track of the column counter for \TSoCeqnarray
\def\TSoCeqnarrayomit{\omit\if@advanceTSoCeqncolcnt\global\advance\@TSoCeqncolcnt by 1\relax\fi}


% provides a way to define a letter referenced column type
% usage: \TSoCeqnarraydefcol{col. type letter/name}{pre insertion text}{post insertion text}
\def\TSoCeqnarraydefcol#1#2#3{\expandafter\def\csname @TSoCeqnarraycolPRE#1\endcsname{#2}%
\expandafter\def\csname @TSoCeqnarraycolPOST#1\endcsname{#3}%
\expandafter\def\csname @TSoCeqnarraycolDEF#1\endcsname{1}}


% provides a way to define a numerically referenced inter-column glue types
% usage: \TSoCeqnarraydefcolsep{col. glue number}{glue definition}
\def\TSoCeqnarraydefcolsep#1#2{\expandafter\def\csname @TSoCeqnarraycolSEP\romannumeral #1\endcsname{#2}%
\expandafter\def\csname @TSoCeqnarraycolSEPDEF\romannumeral #1\endcsname{1}}


\def\@TSoCeqnarraycolisdefined{1}% just a macro for 1, used for checking undefined column types


% expands and appends the given argument to the \@TSoCtrantmptoksA token list
% used to build up the \halign preamble
\def\@TSoCappendtoksA#1{\edef\@@TSoCappendtoksA{\@TSoCtrantmptoksA={\the\@TSoCtrantmptoksA #1}}%
\@@TSoCappendtoksA}

% also appends to \@TSoCtrantmptoksA, but does not expand the argument
% uses \toks8 as a scratchpad register
\def\@TSoCappendNOEXPANDtoksA#1{\toks8={#1}%
\edef\@@TSoCappendNOEXPANDtoksA{\@TSoCtrantmptoksA={\the\@TSoCtrantmptoksA\the\toks8}}%
\@@TSoCappendNOEXPANDtoksA}

% define some common column types for the user
% math
\TSoCeqnarraydefcol{l}{$\TSoCeqnarraymathstyle}{$\hfil}
\TSoCeqnarraydefcol{c}{\hfil$\TSoCeqnarraymathstyle}{$\hfil}
\TSoCeqnarraydefcol{r}{\hfil$\TSoCeqnarraymathstyle}{$}
\TSoCeqnarraydefcol{L}{$\TSoCeqnarraymathstyle{}}{{}$\hfil}
\TSoCeqnarraydefcol{C}{\hfil$\TSoCeqnarraymathstyle{}}{{}$\hfil}
\TSoCeqnarraydefcol{R}{\hfil$\TSoCeqnarraymathstyle{}}{{}$}
% text
\TSoCeqnarraydefcol{s}{\TSoCeqnarraytextstyle}{\hfil}
\TSoCeqnarraydefcol{t}{\hfil\TSoCeqnarraytextstyle}{\hfil}
\TSoCeqnarraydefcol{u}{\hfil\TSoCeqnarraytextstyle}{}

% vertical rules
\TSoCeqnarraydefcol{v}{}{\vrule width\arrayrulewidth}
\TSoCeqnarraydefcol{vv}{\vrule width\arrayrulewidth\hfil}{\hfil\vrule width\arrayrulewidth}
\TSoCeqnarraydefcol{V}{}{\vrule width\arrayrulewidth\hskip\doublerulesep\vrule width\arrayrulewidth}
\TSoCeqnarraydefcol{VV}{\vrule width\arrayrulewidth\hskip\doublerulesep\vrule width\arrayrulewidth\hfil}%
{\hfil\vrule width\arrayrulewidth\hskip\doublerulesep\vrule width\arrayrulewidth}

% horizontal rules
\TSoCeqnarraydefcol{h}{}{\leaders\hrule height\arrayrulewidth\hfil}
\TSoCeqnarraydefcol{H}{}{\leaders\vbox{\hrule width\arrayrulewidth\vskip\doublerulesep\hrule width\arrayrulewidth}\hfil}

% plain
\TSoCeqnarraydefcol{x}{}{}
\TSoCeqnarraydefcol{X}{$}{$}

% the default column type to use in the event a column type is not defined
\TSoCeqnarraydefcol{@TSoCdefault}{\hfil$\TSoCeqnarraymathstyle}{$\hfil}


% a zero tabskip (used for "-" col types)
\def\@TSoCeqnarraycolSEPzero{0pt plus 0pt minus 0pt}
% a centering tabskip (used for "+" col types)
\def\@TSoCeqnarraycolSEPcenter{1000pt plus 0pt minus 1000pt}

% top level default tabskip glues for the start, end, and inter-column
% may be reset within environments not always at the top level, e.g., \TSoCeqnarraybox
\edef\@TSoCeqnarraycolSEPdefaultstart{\@TSoCeqnarraycolSEPcenter}% default start glue
\edef\@TSoCeqnarraycolSEPdefaultend{\@TSoCeqnarraycolSEPcenter}% default end glue
\edef\@TSoCeqnarraycolSEPdefaultmid{\@TSoCeqnarraycolSEPzero}% default inter-column glue



% creates a vertical rule that extends from the bottom to the top a a cell
% Provided in case other packages redefine \vline some other way.
% usage: \TSoCeqnarrayvrule[rule thickness]
% If no argument is provided, \arrayrulewidth will be used for the rule thickness. 
\newcommand\TSoCeqnarrayvrule[1][\arrayrulewidth]{\vrule\@width#1\relax}

% creates a blank separator row
% usage: \TSoCeqnarrayseprow[separation length][font size commands]
% default is \TSoCeqnarrayseprow[0.25\normalbaselineskip][\relax]
% blank arguments inherit the default values
% uses \skip5 as a scratch register - calls \@TSoCeqnarraystrutsize which uses more scratch registers
\def\TSoCeqnarrayseprow{\relax\@ifnextchar[{\@TSoCeqnarrayseprow}{\@TSoCeqnarrayseprow[0.25\normalbaselineskip]}}
\def\@TSoCeqnarrayseprow[#1]{\relax\@ifnextchar[{\@@TSoCeqnarrayseprow[#1]}{\@@TSoCeqnarrayseprow[#1][\relax]}}
\def\@@TSoCeqnarrayseprow[#1][#2]{\def\@TSoCeqnarrayseprowARGONE{#1}%
\ifx\@TSoCeqnarrayseprowARGONE\@empty%
% get the skip value, based on the font commands
% use skip5 because \TSoCeqnarraystrutsize uses \skip0, \skip2, \skip3
% assign within a bogus box to confine the font changes
{\setbox0=\hbox{#2\relax\global\skip5=0.25\normalbaselineskip}}%
\else%
{\setbox0=\hbox{#2\relax\global\skip5=#1}}%
\fi%
\@TSoCeqnarrayhoptolastcolumn\TSoCeqnarraystrutsize{\skip5}{0pt}[\relax]\relax}

% creates a blank separator row, but omits all the column templates
% usage: \TSoCeqnarrayseprowcut[separation length][font size commands]
% default is \TSoCeqnarrayseprowcut[0.25\normalbaselineskip][\relax]
% blank arguments inherit the default values
% uses \skip5 as a scratch register - calls \@TSoCeqnarraystrutsize which uses more scratch registers
\def\TSoCeqnarrayseprowcut{\multispan{\@TSoCeqnnumcols}\relax% span all the cols
% advance column counter only if the TSoCeqnarray environment wants it
\if@advanceTSoCeqncolcnt\global\advance\@TSoCeqncolcnt by \@TSoCeqnnumcols\relax\fi%
\@ifnextchar[{\@TSoCeqnarrayseprowcut}{\@TSoCeqnarrayseprowcut[0.25\normalbaselineskip]}}
\def\@TSoCeqnarrayseprowcut[#1]{\relax\@ifnextchar[{\@@TSoCeqnarrayseprowcut[#1]}{\@@TSoCeqnarrayseprowcut[#1][\relax]}}
\def\@@TSoCeqnarrayseprowcut[#1][#2]{\def\@TSoCeqnarrayseprowARGONE{#1}%
\ifx\@TSoCeqnarrayseprowARGONE\@empty%
% get the skip value, based on the font commands
% use skip5 because \TSoCeqnarraystrutsize uses \skip0, \skip2, \skip3
% assign within a bogus box to confine the font changes
{\setbox0=\hbox{#2\relax\global\skip5=0.25\normalbaselineskip}}%
\else%
{\setbox0=\hbox{#2\relax\global\skip5=#1}}%
\fi%
\TSoCeqnarraystrutsize{\skip5}{0pt}[\relax]\relax}



% draws a single rule across all the columns optional
% argument determines the rule width, \arrayrulewidth is the default
% updates column counter as needed and turns off struts
% usage: \TSoCeqnarrayrulerow[rule line thickness]
\def\TSoCeqnarrayrulerow{\multispan{\@TSoCeqnnumcols}\relax% span all the cols
% advance column counter only if the TSoCeqnarray environment wants it
\if@advanceTSoCeqncolcnt\global\advance\@TSoCeqncolcnt by \@TSoCeqnnumcols\relax\fi%
\@ifnextchar[{\@TSoCeqnarrayrulerow}{\@TSoCeqnarrayrulerow[\arrayrulewidth]}}
\def\@TSoCeqnarrayrulerow[#1]{\leaders\hrule height#1\hfil\relax% put in our rule 
% turn off any struts
\TSoCeqnarraystrutsize{0pt}{0pt}[\relax]\relax}


% draws a double rule by using a single rule row, a separator row, and then
% another single rule row 
% first optional argument determines the rule thicknesses, \arrayrulewidth is the default
% second optional argument determines the rule spacing, \doublerulesep is the default
% usage: \TSoCeqnarraydblrulerow[rule line thickness][rule spacing]
\def\TSoCeqnarraydblrulerow{\multispan{\@TSoCeqnnumcols}\relax% span all the cols
% advance column counter only if the TSoCeqnarray environment wants it
\if@advanceTSoCeqncolcnt\global\advance\@TSoCeqncolcnt by \@TSoCeqnnumcols\relax\fi%
\@ifnextchar[{\@TSoCeqnarraydblrulerow}{\@TSoCeqnarraydblrulerow[\arrayrulewidth]}}
\def\@TSoCeqnarraydblrulerow[#1]{\relax\@ifnextchar[{\@@TSoCeqnarraydblrulerow[#1]}%
{\@@TSoCeqnarraydblrulerow[#1][\doublerulesep]}}
\def\@@TSoCeqnarraydblrulerow[#1][#2]{\def\@TSoCeqnarraydblrulerowARG{#1}%
% we allow the user to say \TSoCeqnarraydblrulerow[][]
\ifx\@TSoCeqnarraydblrulerowARG\@empty%
\@TSoCeqnarrayrulerow[\arrayrulewidth]%
\else%
\@TSoCeqnarrayrulerow[#1]\relax%
\fi%
\def\@TSoCeqnarraydblrulerowARG{#2}%
\ifx\@TSoCeqnarraydblrulerowARG\@empty%
\\\TSoCeqnarrayseprow[\doublerulesep][\relax]%
\else%
\\\TSoCeqnarrayseprow[#2][\relax]%
\fi%
\\\multispan{\@TSoCeqnnumcols}%
% advance column counter only if the TSoCeqnarray environment wants it
\if@advanceTSoCeqncolcnt\global\advance\@TSoCeqncolcnt by \@TSoCeqnnumcols\relax\fi%
\def\@TSoCeqnarraydblrulerowARG{#1}%
\ifx\@TSoCeqnarraydblrulerowARG\@empty%
\@TSoCeqnarrayrulerow[\arrayrulewidth]%
\else%
\@TSoCeqnarrayrulerow[#1]%
\fi%
}

% draws a double rule by using a single rule row, a separator (cutting) row, and then
% another single rule row 
% first optional argument determines the rule thicknesses, \arrayrulewidth is the default
% second optional argument determines the rule spacing, \doublerulesep is the default
% usage: \TSoCeqnarraydblrulerow[rule line thickness][rule spacing]
\def\TSoCeqnarraydblrulerowcut{\multispan{\@TSoCeqnnumcols}\relax% span all the cols
% advance column counter only if the TSoCeqnarray environment wants it
\if@advanceTSoCeqncolcnt\global\advance\@TSoCeqncolcnt by \@TSoCeqnnumcols\relax\fi%
\@ifnextchar[{\@TSoCeqnarraydblrulerowcut}{\@TSoCeqnarraydblrulerowcut[\arrayrulewidth]}}
\def\@TSoCeqnarraydblrulerowcut[#1]{\relax\@ifnextchar[{\@@TSoCeqnarraydblrulerowcut[#1]}%
{\@@TSoCeqnarraydblrulerowcut[#1][\doublerulesep]}}
\def\@@TSoCeqnarraydblrulerowcut[#1][#2]{\def\@TSoCeqnarraydblrulerowARG{#1}%
% we allow the user to say \TSoCeqnarraydblrulerow[][]
\ifx\@TSoCeqnarraydblrulerowARG\@empty%
\@TSoCeqnarrayrulerow[\arrayrulewidth]%
\else%
\@TSoCeqnarrayrulerow[#1]%
\fi%
\def\@TSoCeqnarraydblrulerowARG{#2}%
\ifx\@TSoCeqnarraydblrulerowARG\@empty%
\\\TSoCeqnarrayseprowcut[\doublerulesep][\relax]%
\else%
\\\TSoCeqnarrayseprowcut[#2][\relax]%
\fi%
\\\multispan{\@TSoCeqnnumcols}%
% advance column counter only if the TSoCeqnarray environment wants it
\if@advanceTSoCeqncolcnt\global\advance\@TSoCeqncolcnt by \@TSoCeqnnumcols\relax\fi%
\def\@TSoCeqnarraydblrulerowARG{#1}%
\ifx\@TSoCeqnarraydblrulerowARG\@empty%
\@TSoCeqnarrayrulerow[\arrayrulewidth]%
\else%
\@TSoCeqnarrayrulerow[#1]%
\fi%
}



% inserts a full row's worth of &'s
% relies on \@TSoCeqnnumcols to provide the correct number of columns
% uses \@TSoCtrantmptoksA, \count0 as scratch registers
\def\@TSoCeqnarrayhoptolastcolumn{\@TSoCtrantmptoksA={}\count0=1\relax%
\loop% add cols if the user did not use them all
\ifnum\count0<\@TSoCeqnnumcols\relax%
\@TSoCappendtoksA{&}%
\advance\count0 by 1\relax% update the col count
\repeat%
\the\@TSoCtrantmptoksA%execute the &'s
}



\newif\if@TSoCeqnarrayISinner % flag to indicate if we are within the lines
\@TSoCeqnarrayISinnerfalse    % of an TSoCeqnarray - after the TSoCeqnarraydecl

\edef\@TSoCeqnarrayTHEstrutheight{0pt} % height and depth of TSoCeqnarray struts
\edef\@TSoCeqnarrayTHEstrutdepth{0pt}

\edef\@TSoCeqnarrayTHEmasterstrutheight{0pt} % default height and depth of
\edef\@TSoCeqnarrayTHEmasterstrutdepth{0pt}  % struts within an TSoCeqnarray

\edef\@TSoCeqnarrayTHEmasterstrutHSAVE{0pt} % saved master strut height
\edef\@TSoCeqnarrayTHEmasterstrutDSAVE{0pt} % and depth

\newif\if@TSoCeqnarrayusemasterstrut % flag to indicate that the master strut value
\@TSoCeqnarrayusemasterstruttrue     % is to be used



% saves the strut height and depth of the master strut
\def\@TSoCeqnarraymasterstrutsave{\relax%
\expandafter\skip0=\@TSoCeqnarrayTHEmasterstrutheight\relax%
\expandafter\skip2=\@TSoCeqnarrayTHEmasterstrutdepth\relax%
% remove stretchability
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% save values
\edef\@TSoCeqnarrayTHEmasterstrutHSAVE{\the\dimen0}%
\edef\@TSoCeqnarrayTHEmasterstrutDSAVE{\the\dimen2}}

% restores the strut height and depth of the master strut
\def\@TSoCeqnarraymasterstrutrestore{\relax%
\expandafter\skip0=\@TSoCeqnarrayTHEmasterstrutHSAVE\relax%
\expandafter\skip2=\@TSoCeqnarrayTHEmasterstrutDSAVE\relax%
% remove stretchability
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% restore values
\edef\@TSoCeqnarrayTHEmasterstrutheight{\the\dimen0}%
\edef\@TSoCeqnarrayTHEmasterstrutdepth{\the\dimen2}}


% globally restores the strut height and depth to the 
% master values and sets the master strut flag to true
\def\@TSoCeqnarraystrutreset{\relax%
\expandafter\skip0=\@TSoCeqnarrayTHEmasterstrutheight\relax%
\expandafter\skip2=\@TSoCeqnarrayTHEmasterstrutdepth\relax%
% remove stretchability
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% restore values
\xdef\@TSoCeqnarrayTHEstrutheight{\the\dimen0}%
\xdef\@TSoCeqnarrayTHEstrutdepth{\the\dimen2}%
\global\@TSoCeqnarrayusemasterstruttrue}


% if the master strut is not to be used, make the current
% values of \@TSoCeqnarrayTHEstrutheight, \@TSoCeqnarrayTHEstrutdepth
% and the use master strut flag, global
% this allows user strut commands issued in the last column to be carried
% into the isolation/strut column
\def\@TSoCeqnarrayglobalizestrutstatus{\relax%
\if@TSoCeqnarrayusemasterstrut\else%
\xdef\@TSoCeqnarrayTHEstrutheight{\@TSoCeqnarrayTHEstrutheight}%
\xdef\@TSoCeqnarrayTHEstrutdepth{\@TSoCeqnarrayTHEstrutdepth}%
\global\@TSoCeqnarrayusemasterstrutfalse%
\fi}



% usage: \TSoCeqnarraystrutsize{height}{depth}[font size commands]
% If called outside the lines of an TSoCeqnarray, sets the height
% and depth of both the master and local struts. If called inside
% an TSoCeqnarray line, sets the height and depth of the local strut
% only and sets the flag to indicate the use of the local strut
% values. If the height or depth is left blank, 0.7\normalbaselineskip
% and 0.3\normalbaselineskip will be used, respectively.
% The optional argument can be used to evaluate the lengths under
% a different font size and styles. If none is specified, the current
% font is used.
% uses scratch registers \skip0, \skip2, \skip3, \dimen0, \dimen2
\def\TSoCeqnarraystrutsize#1#2{\relax\@ifnextchar[{\@TSoCeqnarraystrutsize{#1}{#2}}{\@TSoCeqnarraystrutsize{#1}{#2}[\relax]}}
\def\@TSoCeqnarraystrutsize#1#2[#3]{\def\@TSoCeqnarraystrutsizeARG{#1}%
\ifx\@TSoCeqnarraystrutsizeARG\@empty%
{\setbox0=\hbox{#3\relax\global\skip3=0.7\normalbaselineskip}}%
\skip0=\skip3\relax%
\else% arg one present
{\setbox0=\hbox{#3\relax\global\skip3=#1\relax}}%
\skip0=\skip3\relax%
\fi% if null arg
\def\@TSoCeqnarraystrutsizeARG{#2}%
\ifx\@TSoCeqnarraystrutsizeARG\@empty%
{\setbox0=\hbox{#3\relax\global\skip3=0.3\normalbaselineskip}}%
\skip2=\skip3\relax%
\else% arg two present
{\setbox0=\hbox{#3\relax\global\skip3=#2\relax}}%
\skip2=\skip3\relax%
\fi% if null arg
% remove stretchability, just to be safe
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% dimen0 = height, dimen2 = depth
\if@TSoCeqnarrayISinner% inner does not touch master strut size
\edef\@TSoCeqnarrayTHEstrutheight{\the\dimen0}%
\edef\@TSoCeqnarrayTHEstrutdepth{\the\dimen2}%
\@TSoCeqnarrayusemasterstrutfalse% do not use master
\else% outer, have to set master strut too
\edef\@TSoCeqnarrayTHEmasterstrutheight{\the\dimen0}%
\edef\@TSoCeqnarrayTHEmasterstrutdepth{\the\dimen2}%
\edef\@TSoCeqnarrayTHEstrutheight{\the\dimen0}%
\edef\@TSoCeqnarrayTHEstrutdepth{\the\dimen2}%
\@TSoCeqnarrayusemasterstruttrue% use master strut
\fi}


% usage: \TSoCeqnarraystrutsizeadd{added height}{added depth}[font size commands]
% If called outside the lines of an TSoCeqnarray, adds the given height
% and depth to both the master and local struts.
% If called inside an TSoCeqnarray line, adds the given height and depth
% to the local strut only and sets the flag to indicate the use 
% of the local strut values.
% In both cases, if a height or depth is left blank, 0pt is used instead.
% The optional argument can be used to evaluate the lengths under
% a different font size and styles. If none is specified, the current
% font is used.
% uses scratch registers \skip0, \skip2, \skip3, \dimen0, \dimen2
\def\TSoCeqnarraystrutsizeadd#1#2{\relax\@ifnextchar[{\@TSoCeqnarraystrutsizeadd{#1}{#2}}{\@TSoCeqnarraystrutsizeadd{#1}{#2}[\relax]}}
\def\@TSoCeqnarraystrutsizeadd#1#2[#3]{\def\@TSoCeqnarraystrutsizearg{#1}%
\ifx\@TSoCeqnarraystrutsizearg\@empty%
\skip0=0pt\relax%
\else% arg one present
{\setbox0=\hbox{#3\relax\global\skip3=#1}}%
\skip0=\skip3\relax%
\fi% if null arg
\def\@TSoCeqnarraystrutsizearg{#2}%
\ifx\@TSoCeqnarraystrutsizearg\@empty%
\skip2=0pt\relax%
\else% arg two present
{\setbox0=\hbox{#3\relax\global\skip3=#2}}%
\skip2=\skip3\relax%
\fi% if null arg
% remove stretchability, just to be safe
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% dimen0 = height, dimen2 = depth
\if@TSoCeqnarrayISinner% inner does not touch master strut size
% get local strut size
\expandafter\skip0=\@TSoCeqnarrayTHEstrutheight\relax%
\expandafter\skip2=\@TSoCeqnarrayTHEstrutdepth\relax%
% add it to the user supplied values
\advance\dimen0 by \skip0\relax%
\advance\dimen2 by \skip2\relax%
% update the local strut size
\edef\@TSoCeqnarrayTHEstrutheight{\the\dimen0}%
\edef\@TSoCeqnarrayTHEstrutdepth{\the\dimen2}%
\@TSoCeqnarrayusemasterstrutfalse% do not use master
\else% outer, have to set master strut too
% get master strut size
\expandafter\skip0=\@TSoCeqnarrayTHEmasterstrutheight\relax%
\expandafter\skip2=\@TSoCeqnarrayTHEmasterstrutdepth\relax%
% add it to the user supplied values
\advance\dimen0 by \skip0\relax%
\advance\dimen2 by \skip2\relax%
% update the local and master strut sizes
\edef\@TSoCeqnarrayTHEmasterstrutheight{\the\dimen0}%
\edef\@TSoCeqnarrayTHEmasterstrutdepth{\the\dimen2}%
\edef\@TSoCeqnarrayTHEstrutheight{\the\dimen0}%
\edef\@TSoCeqnarrayTHEstrutdepth{\the\dimen2}%
\@TSoCeqnarrayusemasterstruttrue% use master strut
\fi}


% allow user a way to see the struts
\newif\ifTSoCvisiblestruts
\TSoCvisiblestrutsfalse

% inserts an invisible strut using the master or local strut values
% uses scratch registers \skip0, \skip2, \dimen0, \dimen2
\def\@TSoCeqnarrayinsertstrut{\relax%
\if@TSoCeqnarrayusemasterstrut
% get master strut size
\expandafter\skip0=\@TSoCeqnarrayTHEmasterstrutheight\relax%
\expandafter\skip2=\@TSoCeqnarrayTHEmasterstrutdepth\relax%
\else%
% get local strut size
\expandafter\skip0=\@TSoCeqnarrayTHEstrutheight\relax%
\expandafter\skip2=\@TSoCeqnarrayTHEstrutdepth\relax%
\fi%
% remove stretchability, probably not needed
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% dimen0 = height, dimen2 = depth
% allow user to see struts if desired
\ifTSoCvisiblestruts%
\vrule width0.2pt height\dimen0 depth\dimen2\relax%
\else%
\vrule width0pt height\dimen0 depth\dimen2\relax\fi}


% creates an invisible strut, useable even outside \TSoCeqnarray
% if \TSoCvisiblestrutstrue, the strut will be visible and 0.2pt wide. 
% usage: \TSoCstrut[height][depth][font size commands]
% default is \TSoCstrut[0.7\normalbaselineskip][0.3\normalbaselineskip][\relax]
% blank arguments inherit the default values
% uses \dimen0, \dimen2, \skip0, \skip2
\def\TSoCstrut{\relax\@ifnextchar[{\@TSoCstrut}{\@TSoCstrut[0.7\normalbaselineskip]}}
\def\@TSoCstrut[#1]{\relax\@ifnextchar[{\@@TSoCstrut[#1]}{\@@TSoCstrut[#1][0.3\normalbaselineskip]}}
\def\@@TSoCstrut[#1][#2]{\relax\@ifnextchar[{\@@@TSoCstrut[#1][#2]}{\@@@TSoCstrut[#1][#2][\relax]}}
\def\@@@TSoCstrut[#1][#2][#3]{\mbox{#3\relax%
\def\@TSoCstrutARG{#1}%
\ifx\@TSoCstrutARG\@empty%
\skip0=0.7\normalbaselineskip\relax%
\else%
\skip0=#1\relax%
\fi%
\def\@TSoCstrutARG{#2}%
\ifx\@TSoCstrutARG\@empty%
\skip2=0.3\normalbaselineskip\relax%
\else%
\skip2=#2\relax%
\fi%
% remove stretchability, probably not needed
\dimen0\skip0\relax%
\dimen2\skip2\relax%
\ifTSoCvisiblestruts%
\vrule width0.2pt height\dimen0 depth\dimen2\relax%
\else%
\vrule width0.0pt height\dimen0 depth\dimen2\relax\fi}}


% enables strut mode by setting a default strut size and then zeroing the
% \baselineskip, \lineskip, \lineskiplimit and \jot
\def\TSoCeqnarraystrutmode{\TSoCeqnarraystrutsize{0.7\normalbaselineskip}{0.3\normalbaselineskip}[\relax]%
\baselineskip=0pt\lineskip=0pt\lineskiplimit=0pt\jot=0pt}


% equation and subequation forms to use to setup hyperref's \@currentHref
\def\@TSoCtheHrefequation{equation.\theHequation}
\def\@TSoCtheHrefsubequation{equation.\theHequation\alph{TSoCsubequation}}


\def\TSoCeqnarray{\@TSoCeqnumpersisttrue\@TSoCsubeqnumpersistfalse\@TSoCeqnarray}
\def\endTSoCeqnarray{\end@TSoCeqnarray}

\@namedef{TSoCeqnarray*}{\@TSoCeqnumpersistfalse\@TSoCsubeqnumpersistfalse\@TSoCeqnarray}
\@namedef{endTSoCeqnarray*}{\end@TSoCeqnarray}


% \TSoCeqnarray is an enhanced \eqnarray. 
% The star form defaults to not putting equation numbers at the end of each row.
% usage: \TSoCeqnarray[decl]{cols}
\def\@TSoCeqnarray{\relax\@ifnextchar[{\@@TSoCeqnarray}{\@@TSoCeqnarray[\relax]}}
\def\@@TSoCeqnarray[#1]#2{%
   % default to showing the equation number or not based on whether or not
   % the star form was involked
   \if@TSoCeqnumpersist\global\@eqnswtrue
   \else% not the star form
   \global\@eqnswfalse
   \fi% if star form
   % provide a basic hyperref \theHequation if this has not already been setup (hyperref not loaded, or no section counter)
   \@ifundefined{theHequation}{\def\theHequation{\arabic{equation}}}{}\relax
   % provide dummy hyperref commands in case hyperref is not loaded
   \providecommand{\Hy@raisedlink}[1]{}\relax
   \providecommand{\hyper@anchorstart}[1]{}\relax
   \providecommand{\hyper@anchorend}{}\relax
   \providecommand{\@currentHref}{}\relax
   \@TSoCeqnumpreadvfalse% reset eqnpreadv flag
   \@TSoCsubeqnumpreadvfalse% reset subeqnpreadv flag
   \@TSoCeqnarrayISinnerfalse% not yet within the lines of the halign
   \@TSoCeqnarraystrutsize{0pt}{0pt}[\relax]% turn off struts by default
   \@TSoCeqnarrayusemasterstruttrue% use master strut till user asks otherwise
   \TSoCvisiblestrutsfalse% diagnostic mode defaults to off
   % no extra space unless the user specifically requests it
   \lineskip=0pt\relax
   \lineskiplimit=0pt\relax
   \baselineskip=\normalbaselineskip\relax%
   \jot=\TSoCnormaljot\relax%
   \mathsurround\z@\relax% no extra spacing around math
   \@advanceTSoCeqncolcnttrue% advance the col counter for each col the user uses, 
                             % used in \TSoCeqnarraymulticol and in the preamble build
   %V1.8 Here we preadvance to the next equation number.
   % If the user later wants a continued subequation, we can roll back.
   \global\@TSoCsubeqnnumrollback=\c@TSoCsubequation%
   \stepcounter{equation}\@TSoCeqnumpreadvtrue% advance equation counter before first line
   \setcounter{TSoCsubequation}{0}% no subequation yet
   \let\@TSoCcurrentlabelsave\@currentlabel% save current label as we later change it globally
   \let\@TSoCcurrentHrefsave\@currentHref% save current href label as we later change it globally
   \def\@currentlabel{\p@equation\theequation}% redefine the ref label
   \def\@currentHref{\@TSoCtheHrefequation}% setup hyperref label
   \TSoCeqnarraydecl\relax% allow a way for the user to make global overrides
   #1\relax% allow user to override defaults
   \let\\\@TSoCeqnarraycr% replace newline with one that can put in eqn. numbers
   \global\@TSoCeqncolcnt\z@% col. count = 0 for first line
   \@TSoCbuildpreamble #2\end\relax% build the preamble and put it into \@TSoCtrantmptoksA 
   % put in the column for the equation number
   \ifnum\@TSoCeqnnumcols>0\relax\@TSoCappendtoksA{&}\fi% col separator for those after the first
   \toks0={##}%
   % advance the \@TSoCeqncolcnt for the isolation col, this helps with error checking
   \@TSoCappendtoksA{\global\advance\@TSoCeqncolcnt by 1\relax}%
   % add the isolation column
   \@TSoCappendtoksA{\tabskip\z@skip\bgroup\the\toks0\egroup}%
   % advance the \@TSoCeqncolcnt for the equation number col, this helps with error checking
   \@TSoCappendtoksA{&\global\advance\@TSoCeqncolcnt by 1\relax}%
   % add the equation number col to the preamble
   \@TSoCappendtoksA{\tabskip\z@skip\hb@xt@\z@\bgroup\hss\the\toks0\egroup}%
   % note \@TSoCeqnnumcols does not count the equation col or isolation col
   % set the starting tabskip glue as determined by the preamble build
   \tabskip=\@TSoCBPstartglue\relax
   % begin the display alignment
   \@TSoCeqnarrayISinnertrue% commands are now within the lines
   $$\everycr{}\halign to\displaywidth\bgroup
   % "exspand" the preamble
   \span\the\@TSoCtrantmptoksA\cr}

% enter isolation/strut column (or the next column if the user did not use
% every column), record the strut status, complete the columns, do the strut if needed,
% restore counters (to backout any equation setup for a next line that was never used)
% to their correct values and exit
\def\end@TSoCeqnarray{\@TSoCeqnarrayglobalizestrutstatus&\@@TSoCeqnarraycr\egroup
\if@TSoCsubeqnumpreadv\global\advance\c@TSoCsubequation\m@ne\fi
\if@TSoCeqnumpreadv\global\advance\c@equation\m@ne\global\c@TSoCsubequation=\@TSoCsubeqnnumrollback\fi
\global\let\@currentlabel\@TSoCcurrentlabelsave% restore current label
\global\let\@currentHref\@TSoCcurrentHrefsave% restore current href label
$$\@ignoretrue}


% TSoCeqnarray uses a modifed \\ instead of the plain \cr to
% end rows. This allows for things like \\*[vskip amount]
% These "cr" macros are modified versions of those for LaTeX2e's eqnarray
% the {\ifnum0=`} braces must be kept away from the last column to avoid
% altering spacing of its math, so we use & to advance to the next column
% as there is an isolation/strut column after the user's columns
\def\@TSoCeqnarraycr{\@TSoCeqnarrayglobalizestrutstatus&% save strut status and advance to next column
   {\ifnum0=`}\fi
   \@ifstar{%
      \global\@eqpen\@M\@TSoCeqnarrayYCR
   }{%
      \global\@eqpen\interdisplaylinepenalty \@TSoCeqnarrayYCR
   }%
}

\def\@TSoCeqnarrayYCR{\@testopt\@TSoCeqnarrayXCR\z@skip}

\def\@TSoCeqnarrayXCR[#1]{%
   \ifnum0=`{\fi}%
   \@@TSoCeqnarraycr
   \noalign{\penalty\@eqpen\vskip\jot\vskip #1\relax}}%

\def\@@TSoCeqnarraycr{\@TSoCtrantmptoksA={}% clear token register
    \advance\@TSoCeqncolcnt by -1\relax% adjust col count because of the isolation column
    \ifnum\@TSoCeqncolcnt>\@TSoCeqnnumcols\relax
    \@TSoCclspkgerror{Too many columns within the TSoCeqnarray\MessageBreak
                          environment}%
    {Use fewer \string &'s or put more columns in the TSoCeqnarray column\MessageBreak 
     specifications.}\relax%
    \else
    \loop% add cols if the user did not use them all
    \ifnum\@TSoCeqncolcnt<\@TSoCeqnnumcols\relax
    \@TSoCappendtoksA{&}%
    \advance\@TSoCeqncolcnt by 1\relax% update the col count
    \repeat
    % this number of &'s will take us the the isolation column
    \fi
    % execute the &'s
    \the\@TSoCtrantmptoksA%
    % handle the strut/isolation column
    \@TSoCeqnarrayinsertstrut% do the strut if needed
    \@TSoCeqnarraystrutreset% reset the strut system for next line or TSoCeqnarray
    &% and enter the equation number column
    \if@eqnsw% only if we display something
      \Hy@raisedlink{\hyper@anchorstart{\@currentHref}}% start a hyperref anchor
      \global\@TSoCeqnumpreadvfalse\relax% displaying an equation number means
      \global\@TSoCsubeqnumpreadvfalse\relax% the equation counters point to valid equations
      % V1.8 Here we setup the counters, currentlabel and status for what would be the *next*
      % equation line as would be the case under the current settings. However, there are two problems.
      % One problem is that there might not ever be a next line. The second problem is that the user
      % may later alter the meaning of a line with commands such as \TSoCyessubnumber. So, to handle
      % these cases we have to record the current values of the (sub)equation counters and revert back
      % to them if the next line is changed or never comes. The \if@TSoCeqnumpreadv, \if@TSoCsubeqnumpreadv
      % and \@TSoCsubeqnnumrollback stuff tracks this.
      % The logic to handle all this is surprisingly complex, but a nice feature of the approach here is
      % that the equation counters and labels remain valid for what the line would be unless a
      % \TSoCyessubnumber et al. later changes it. So, any hyperref links are always correct.
      \ifnum\c@TSoCsubequation>0\relax% handle subequation
         \theTSoCsubequationdis\relax
         \if@TSoCsubeqnumpersist% setup for default type of next line
            \stepcounter{TSoCsubequation}\global\@TSoCsubeqnumpreadvtrue\relax
            \gdef\@currentlabel{\p@TSoCsubequation\theTSoCsubequation}\relax
            \gdef\@currentHref{\@TSoCtheHrefsubequation}% setup hyperref label
         \else
             % if no subeqnum persist, go ahead and setup for a new equation number
             \global\@TSoCsubeqnnumrollback=\c@TSoCsubequation
             \stepcounter{equation}\global\@TSoCeqnumpreadvtrue\relax
             \setcounter{TSoCsubequation}{0}\gdef\@currentlabel{\p@equation\theequation}\relax
             \gdef\@currentHref{\@TSoCtheHrefequation}% setup hyperref label
         \fi
      \else% display a standard equation number
        \theequationdis\relax
        \setcounter{TSoCsubequation}{0}\relax% not really needed
        \if@TSoCsubeqnumpersist% setup for default type of next line
           % subequations that follow plain equations carry the same equation number e.g, 5, 5a rather than 5, 6a
           \stepcounter{TSoCsubequation}\global\@TSoCsubeqnumpreadvtrue\relax
           \gdef\@currentlabel{\p@TSoCsubequation\theTSoCsubequation}\relax
           \gdef\@currentHref{\@TSoCtheHrefsubequation}% setup hyperref label
         \else
             % if no subeqnum persist, go ahead and setup for a new equation number
             \global\@TSoCsubeqnnumrollback=\c@TSoCsubequation
             \stepcounter{equation}\global\@TSoCeqnumpreadvtrue\relax
             \setcounter{TSoCsubequation}{0}\gdef\@currentlabel{\p@equation\theequation}\relax
             \gdef\@currentHref{\@TSoCtheHrefequation}% setup hyperref label
         \fi
      \fi%
      \Hy@raisedlink{\hyper@anchorend}% end hyperref anchor
    \fi% fi only if we display something
    % reset the flags to indicate the default preferences of the display of equation numbers
    \if@TSoCeqnumpersist\global\@eqnswtrue\else\global\@eqnswfalse\fi
    \if@TSoCsubeqnumpersist\global\@eqnswtrue\fi% ditto for the subequation flag
    % reset the number of columns the user actually used
    \global\@TSoCeqncolcnt\z@\relax
    % the real end of the line
    \cr}





% \TSoCeqnarraybox is like \TSoCeqnarray except the box form puts everything
% inside a vtop, vbox, or vcenter box depending on the letter in the second
% optional argument (t,b,c). Vbox is the default. Unlike \TSoCeqnarray,
% equation numbers are not displayed and \TSoCeqnarraybox can be nested.
% \TSoCeqnarrayboxm is for math mode (like \array) and does not put the vbox
% within an hbox.
% \TSoCeqnarrayboxt is for text mode (like \tabular) and puts the vbox within
% a \hbox{$ $} construct.
% \TSoCeqnarraybox will auto detect whether to use \TSoCeqnarrayboxm or 
% \TSoCeqnarrayboxt depending on the math mode.
% The third optional argument specifies the width this box is to be set to -
% natural width is the default.
% The * forms do not add \jot line spacing
% usage: \TSoCeqnarraybox[decl][pos][width]{cols}
\def\TSoCeqnarrayboxm{\@TSoCeqnarrayboxnojotfalse\@TSoCeqnarrayboxHBOXSWfalse\@TSoCeqnarraybox}
\def\endTSoCeqnarrayboxm{\end@TSoCeqnarraybox}
\@namedef{TSoCeqnarrayboxm*}{\@TSoCeqnarrayboxnojottrue\@TSoCeqnarrayboxHBOXSWfalse\@TSoCeqnarraybox}
\@namedef{endTSoCeqnarrayboxm*}{\end@TSoCeqnarraybox}

\def\TSoCeqnarrayboxt{\@TSoCeqnarrayboxnojotfalse\@TSoCeqnarrayboxHBOXSWtrue\@TSoCeqnarraybox}
\def\endTSoCeqnarrayboxt{\end@TSoCeqnarraybox}
\@namedef{TSoCeqnarrayboxt*}{\@TSoCeqnarrayboxnojottrue\@TSoCeqnarrayboxHBOXSWtrue\@TSoCeqnarraybox}
\@namedef{endTSoCeqnarrayboxt*}{\end@TSoCeqnarraybox}

\def\TSoCeqnarraybox{\@TSoCeqnarrayboxnojotfalse\ifmmode\@TSoCeqnarrayboxHBOXSWfalse\else\@TSoCeqnarrayboxHBOXSWtrue\fi%
\@TSoCeqnarraybox}
\def\endTSoCeqnarraybox{\end@TSoCeqnarraybox}

\@namedef{TSoCeqnarraybox*}{\@TSoCeqnarrayboxnojottrue\ifmmode\@TSoCeqnarrayboxHBOXSWfalse\else\@TSoCeqnarrayboxHBOXSWtrue\fi%
\@TSoCeqnarraybox}
\@namedef{endTSoCeqnarraybox*}{\end@TSoCeqnarraybox}

% flag to indicate if the \TSoCeqnarraybox needs to put things into an hbox{$ $} 
% for \vcenter in non-math mode
\newif\if@TSoCeqnarrayboxHBOXSW%
\@TSoCeqnarrayboxHBOXSWfalse

\def\@TSoCeqnarraybox{\relax\@ifnextchar[{\@@TSoCeqnarraybox}{\@@TSoCeqnarraybox[\relax]}}
\def\@@TSoCeqnarraybox[#1]{\relax\@ifnextchar[{\@@@TSoCeqnarraybox[#1]}{\@@@TSoCeqnarraybox[#1][b]}}
\def\@@@TSoCeqnarraybox[#1][#2]{\relax\@ifnextchar[{\@@@@TSoCeqnarraybox[#1][#2]}{\@@@@TSoCeqnarraybox[#1][#2][\relax]}}

% #1 = decl; #2 = t,b,c; #3 = width, #4 = col specs
\def\@@@@TSoCeqnarraybox[#1][#2][#3]#4{\@TSoCeqnarrayISinnerfalse % not yet within the lines of the halign
   \@TSoCeqnarraymasterstrutsave% save current master strut values
   \@TSoCeqnarraystrutsize{0pt}{0pt}[\relax]% turn off struts by default
   \@TSoCeqnarrayusemasterstruttrue% use master strut till user asks otherwise
   \TSoCvisiblestrutsfalse% diagnostic mode defaults to off
   % no extra space unless the user specifically requests it
   \lineskip=0pt\relax%
   \lineskiplimit=0pt\relax%
   \baselineskip=\normalbaselineskip\relax%
   \jot=\TSoCnormaljot\relax%
   \mathsurround\z@\relax% no extra spacing around math
   % the default end glues are zero for an \TSoCeqnarraybox
   \edef\@TSoCeqnarraycolSEPdefaultstart{\@TSoCeqnarraycolSEPzero}% default start glue
   \edef\@TSoCeqnarraycolSEPdefaultend{\@TSoCeqnarraycolSEPzero}% default end glue
   \edef\@TSoCeqnarraycolSEPdefaultmid{\@TSoCeqnarraycolSEPzero}% default inter-column glue
   \@advanceTSoCeqncolcntfalse% do not advance the col counter for each col the user uses, 
                              % used in \TSoCeqnarraymulticol and in the preamble build
   \TSoCeqnarrayboxdecl\relax% allow a way for the user to make global overrides
   #1\relax% allow user to override defaults
   \let\\\@TSoCeqnarrayboxcr% replace newline with one that allows optional spacing
   \@TSoCbuildpreamble #4\end\relax% build the preamble and put it into \@TSoCtrantmptoksA
   % add an isolation column to the preamble to stop \\'s {} from getting into the last col
   \ifnum\@TSoCeqnnumcols>0\relax\@TSoCappendtoksA{&}\fi% col separator for those after the first
   \toks0={##}%
   % add the isolation column to the preamble
   \@TSoCappendtoksA{\tabskip\z@skip\bgroup\the\toks0\egroup}% 
   % set the starting tabskip glue as determined by the preamble build
   \tabskip=\@TSoCBPstartglue\relax
   % begin the alignment
   \everycr{}%
   % use only the very first token to determine the positioning
   % this stops some problems when the user uses more than one letter,
   % but is probably not worth the effort
   % \noindent is used as a delimiter
   \def\@TSoCgrabfirstoken##1##2\noindent{\let\@TSoCgrabbedfirstoken=##1}%
   \@TSoCgrabfirstoken#2\relax\relax\noindent
   % \@TSoCgrabbedfirstoken has the first token, the rest are discarded
   % if we need to put things into and hbox and go into math mode, do so now
   \if@TSoCeqnarrayboxHBOXSW \leavevmode \hbox \bgroup $\fi%
   % use the appropriate vbox type
   \if\@TSoCgrabbedfirstoken t\relax\vtop\else\if\@TSoCgrabbedfirstoken c\relax%
   \vcenter\else\vbox\fi\fi\bgroup%
   \@TSoCeqnarrayISinnertrue% commands are now within the lines
   \ifx#3\relax\halign\else\halign to #3\relax\fi%
   \bgroup
   % "exspand" the preamble
   \span\the\@TSoCtrantmptoksA\cr}

% carry strut status and enter the isolation/strut column, 
% exit from math mode if needed, and exit
\def\end@TSoCeqnarraybox{\@TSoCeqnarrayglobalizestrutstatus% carry strut status
&% enter isolation/strut column
\@TSoCeqnarrayinsertstrut% do strut if needed
\@TSoCeqnarraymasterstrutrestore% restore the previous master strut values
% reset the strut system for next TSoCeqnarray
% (sets local strut values back to previous master strut values)
\@TSoCeqnarraystrutreset%
% ensure last line, exit from halign, close vbox
\crcr\egroup\egroup%
% exit from math mode and close hbox if needed
\if@TSoCeqnarrayboxHBOXSW $\egroup\fi}



% TSoCeqnarraybox uses a modifed \\ instead of the plain \cr to
% end rows. This allows for things like \\[vskip amount]
% This "cr" macros are modified versions those for LaTeX2e's eqnarray
% For TSoCeqnarraybox, \\* is the same as \\
% the {\ifnum0=`} braces must be kept away from the last column to avoid
% altering spacing of its math, so we use & to advance to the isolation/strut column
% carry strut status into isolation/strut column
\def\@TSoCeqnarrayboxcr{\@TSoCeqnarrayglobalizestrutstatus% carry strut status
&% enter isolation/strut column
\@TSoCeqnarrayinsertstrut% do strut if needed
% reset the strut system for next line or TSoCeqnarray
\@TSoCeqnarraystrutreset%
{\ifnum0=`}\fi%
\@ifstar{\@TSoCeqnarrayboxYCR}{\@TSoCeqnarrayboxYCR}}

% test and setup the optional argument to \\[]
\def\@TSoCeqnarrayboxYCR{\@testopt\@TSoCeqnarrayboxXCR\z@skip}

% TSoCeqnarraybox does not automatically increase line spacing by \jot
\def\@TSoCeqnarrayboxXCR[#1]{\ifnum0=`{\fi}%
\cr\noalign{\if@TSoCeqnarrayboxnojot\else\vskip\jot\fi\vskip#1\relax}}



% starts the halign preamble build
\def\@TSoCbuildpreamble{\@TSoCtrantmptoksA={}% clear token register
\let\@TSoCBPcurtype=u%current column type is not yet known
\let\@TSoCBPprevtype=s%the previous column type was the start
\let\@TSoCBPnexttype=u%next column type is not yet known
% ensure these are valid
\def\@TSoCBPcurglue={0pt plus 0pt minus 0pt}%
\def\@TSoCBPcurcolname{@TSoCdefault}% name of current column definition
% currently acquired numerically referenced glue
% use a name that is easier to remember
\let\@TSoCBPcurnum=\@TSoCtrantmpcountA%
\@TSoCBPcurnum=0%
% tracks number of columns in the preamble
\@TSoCeqnnumcols=0%
% record the default end glues
\edef\@TSoCBPstartglue{\@TSoCeqnarraycolSEPdefaultstart}%
\edef\@TSoCBPendglue{\@TSoCeqnarraycolSEPdefaultend}%
% now parse the user's column specifications
\@@TSoCbuildpreamble}


% parses and builds the halign preamble
\def\@@TSoCbuildpreamble#1#2{\let\@@nextTSoCbuildpreamble=\@@TSoCbuildpreamble%
% use only the very first token to check the end
% \noindent is used as a delimiter as \end can be present here
\def\@TSoCgrabfirstoken##1##2\noindent{\let\@TSoCgrabbedfirstoken=##1}%
\@TSoCgrabfirstoken#1\relax\relax\noindent
\ifx\@TSoCgrabbedfirstoken\end\let\@@nextTSoCbuildpreamble=\@@TSoCfinishpreamble\else%
% identify current and next token type
\@TSoCgetcoltype{#1}{\@TSoCBPcurtype}{1}% current, error on invalid
\@TSoCgetcoltype{#2}{\@TSoCBPnexttype}{0}% next, no error on invalid next
% if curtype is a glue, get the glue def
\if\@TSoCBPcurtype g\@TSoCgetcurglue{#1}{\@TSoCBPcurglue}\fi%
% if curtype is a column, get the column def and set the current column name
\if\@TSoCBPcurtype c\@TSoCgetcurcol{#1}\fi%
% if curtype is a numeral, acquire the user defined glue
\if\@TSoCBPcurtype n\@TSoCprocessNcol{#1}\fi%
% process the acquired glue 
\if\@TSoCBPcurtype g\@TSoCprocessGcol\fi%
% process the acquired col 
\if\@TSoCBPcurtype c\@TSoCprocessCcol\fi%
% ready prevtype for next col spec.
\let\@TSoCBPprevtype=\@TSoCBPcurtype%
% be sure and put back the future token(s) as a group
\fi\@@nextTSoCbuildpreamble{#2}}


% executed just after preamble build is completed
% warn about zero cols, and if prevtype type = u, put in end tabskip glue
\def\@@TSoCfinishpreamble#1{\ifnum\@TSoCeqnnumcols<1\relax
\@TSoCclspkgerror{No column specifiers declared for TSoCeqnarray}%
{At least one column type must be declared for each TSoCeqnarray.}%
\fi%num cols less than 1
%if last type undefined, set default end tabskip glue
\if\@TSoCBPprevtype u\@TSoCappendtoksA{\tabskip=\@TSoCBPendglue}\fi}


% Identify and return the column specifier's type code
\def\@TSoCgetcoltype#1#2#3{%
% use only the very first token to determine the type
% \noindent is used as a delimiter as \end can be present here
\def\@TSoCgrabfirstoken##1##2\noindent{\let\@TSoCgrabbedfirstoken=##1}%
\@TSoCgrabfirstoken#1\relax\relax\noindent
% \@TSoCgrabfirstoken has the first token, the rest are discarded
% n = number
% g = glue (any other char in catagory 12)
% c = letter
% e = \end
% u = undefined
% third argument: 0 = no error message, 1 = error on invalid char
\let#2=u\relax% assume invalid until know otherwise
\ifx\@TSoCgrabbedfirstoken\end\let#2=e\else
\ifcat\@TSoCgrabbedfirstoken\relax\else% screen out control sequences
\if0\@TSoCgrabbedfirstoken\let#2=n\else
\if1\@TSoCgrabbedfirstoken\let#2=n\else
\if2\@TSoCgrabbedfirstoken\let#2=n\else
\if3\@TSoCgrabbedfirstoken\let#2=n\else
\if4\@TSoCgrabbedfirstoken\let#2=n\else
\if5\@TSoCgrabbedfirstoken\let#2=n\else
\if6\@TSoCgrabbedfirstoken\let#2=n\else
\if7\@TSoCgrabbedfirstoken\let#2=n\else
\if8\@TSoCgrabbedfirstoken\let#2=n\else
\if9\@TSoCgrabbedfirstoken\let#2=n\else
\ifcat,\@TSoCgrabbedfirstoken\let#2=g\relax
\else\ifcat a\@TSoCgrabbedfirstoken\let#2=c\relax\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
\if#2u\relax
\if0\noexpand#3\relax\else\@TSoCclspkgerror{Invalid character in column specifications}%
{Only letters, numerals and certain other symbols are allowed \MessageBreak
as TSoCeqnarray column specifiers.}\fi\fi}


% identify the current letter referenced column
% if invalid, use a default column
\def\@TSoCgetcurcol#1{\expandafter\ifx\csname @TSoCeqnarraycolDEF#1\endcsname\@TSoCeqnarraycolisdefined%
\def\@TSoCBPcurcolname{#1}\else% invalid column name
\@TSoCclspkgerror{Invalid column type "#1" in column specifications.\MessageBreak
Using a default centering column instead}%
{You must define TSoCeqnarray column types before use.}%
\def\@TSoCBPcurcolname{@TSoCdefault}\fi}


% identify and return the predefined (punctuation) glue value
\def\@TSoCgetcurglue#1#2{%
% ! = \! (neg small)  -0.16667em (-3/18 em)
% , = \, (small)       0.16667em ( 3/18 em)
% : = \: (med)         0.22222em ( 4/18 em)
% ; = \; (large)       0.27778em ( 5/18 em)
% ' = \quad            1em
% " = \qquad           2em
% . = 0.5\arraycolsep
% / = \arraycolsep
% ? = 2\arraycolsep
% * = 1fil
% + = \@TSoCeqnarraycolSEPcenter
% - = \@TSoCeqnarraycolSEPzero
% Note that all em values are referenced to the math font (textfont2) fontdimen6
% value for 1em.
% 
% use only the very first token to determine the type
% this prevents errant tokens from getting in the main text
% \noindent is used as a delimiter here
\def\@TSoCgrabfirstoken##1##2\noindent{\let\@TSoCgrabbedfirstoken=##1}%
\@TSoCgrabfirstoken#1\relax\relax\noindent
% get the math font 1em value
% LaTeX2e's NFSS2 does not preload the fonts, but \TSoCeqnarray needs
% to gain access to the math (\textfont2) font's spacing parameters.
% So we create a bogus box here that uses the math font to ensure
% that \textfont2 is loaded and ready. If this is not done,
% the \textfont2 stuff here may not work.
% Thanks to Bernd Raichle for his 1997 post on this topic.
{\setbox0=\hbox{$\displaystyle\relax$}}%
% fontdimen6 has the width of 1em (a quad).
\@TSoCtrantmpdimenA=\fontdimen6\textfont2\relax%
% identify the glue value based on the first token
% we discard anything after the first
\if!\@TSoCgrabbedfirstoken\@TSoCtrantmpdimenA=-0.16667\@TSoCtrantmpdimenA\edef#2{\the\@TSoCtrantmpdimenA}\else
\if,\@TSoCgrabbedfirstoken\@TSoCtrantmpdimenA=0.16667\@TSoCtrantmpdimenA\edef#2{\the\@TSoCtrantmpdimenA}\else
\if:\@TSoCgrabbedfirstoken\@TSoCtrantmpdimenA=0.22222\@TSoCtrantmpdimenA\edef#2{\the\@TSoCtrantmpdimenA}\else
\if;\@TSoCgrabbedfirstoken\@TSoCtrantmpdimenA=0.27778\@TSoCtrantmpdimenA\edef#2{\the\@TSoCtrantmpdimenA}\else
\if'\@TSoCgrabbedfirstoken\@TSoCtrantmpdimenA=1\@TSoCtrantmpdimenA\edef#2{\the\@TSoCtrantmpdimenA}\else
\if"\@TSoCgrabbedfirstoken\@TSoCtrantmpdimenA=2\@TSoCtrantmpdimenA\edef#2{\the\@TSoCtrantmpdimenA}\else
\if.\@TSoCgrabbedfirstoken\@TSoCtrantmpdimenA=0.5\arraycolsep\edef#2{\the\@TSoCtrantmpdimenA}\else
\if/\@TSoCgrabbedfirstoken\edef#2{\the\arraycolsep}\else
\if?\@TSoCgrabbedfirstoken\@TSoCtrantmpdimenA=2\arraycolsep\edef#2{\the\@TSoCtrantmpdimenA}\else
\if *\@TSoCgrabbedfirstoken\edef#2{0pt plus 1fil minus 0pt}\else
\if+\@TSoCgrabbedfirstoken\edef#2{\@TSoCeqnarraycolSEPcenter}\else
\if-\@TSoCgrabbedfirstoken\edef#2{\@TSoCeqnarraycolSEPzero}\else
\edef#2{\@TSoCeqnarraycolSEPzero}%
\@TSoCclspkgerror{Invalid predefined inter-column glue type "#1" in\MessageBreak
column specifications. Using a default value of\MessageBreak
0pt instead}%
{Only !,:;'"./?*+ and - are valid predefined glue types in the\MessageBreak 
TSoCeqnarray column specifications.}\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi}



% process a numerical digit from the column specification
% and look up the corresponding user defined glue value
% can transform current type from n to g or a as the user defined glue is acquired
\def\@TSoCprocessNcol#1{\if\@TSoCBPprevtype g%
\@TSoCclspkgerror{Back-to-back inter-column glue specifiers in column\MessageBreak
specifications. Ignoring consecutive glue specifiers\MessageBreak
after the first}%
{You cannot have two or more glue types next to each other\MessageBreak 
in the TSoCeqnarray column specifications.}%
\let\@TSoCBPcurtype=a% abort this glue, future digits will be discarded
\@TSoCBPcurnum=0\relax%
\else% if we previously aborted a glue
\if\@TSoCBPprevtype a\@TSoCBPcurnum=0\let\@TSoCBPcurtype=a%maintain digit abortion
\else%acquire this number
% save the previous type before the numerical digits started
\if\@TSoCBPprevtype n\else\let\@TSoCBPprevsavedtype=\@TSoCBPprevtype\fi%
\multiply\@TSoCBPcurnum by 10\relax%
\advance\@TSoCBPcurnum by #1\relax% add in number, \relax is needed to stop TeX's number scan
\if\@TSoCBPnexttype n\else%close acquisition
\expandafter\ifx\csname @TSoCeqnarraycolSEPDEF\expandafter\romannumeral\number\@TSoCBPcurnum\endcsname\@TSoCeqnarraycolisdefined%
\edef\@TSoCBPcurglue{\csname @TSoCeqnarraycolSEP\expandafter\romannumeral\number\@TSoCBPcurnum\endcsname}%
\else%user glue not defined
\@TSoCclspkgerror{Invalid user defined inter-column glue type "\number\@TSoCBPcurnum" in\MessageBreak
column specifications. Using a default value of\MessageBreak
0pt instead}%
{You must define all TSoCeqnarray numerical inter-column glue types via\MessageBreak
\string\TSoCeqnarraydefcolsep \space before they are used in column specifications.}%
\edef\@TSoCBPcurglue{\@TSoCeqnarraycolSEPzero}%
\fi% glue defined or not
\let\@TSoCBPcurtype=g% change the type to reflect the acquired glue
\let\@TSoCBPprevtype=\@TSoCBPprevsavedtype% restore the prev type before this number glue
\@TSoCBPcurnum=0\relax%ready for next acquisition
\fi%close acquisition, get glue
\fi%discard or acquire number
\fi%prevtype glue or not
}


% process an acquired glue
% add any acquired column/glue pair to the preamble
\def\@TSoCprocessGcol{\if\@TSoCBPprevtype a\let\@TSoCBPcurtype=a%maintain previous glue abortions
\else
% if this is the start glue, save it, but do nothing else 
% as this is not used in the preamble, but before
\if\@TSoCBPprevtype s\edef\@TSoCBPstartglue{\@TSoCBPcurglue}%
\else%not the start glue
\if\@TSoCBPprevtype g%ignore if back to back glues
\@TSoCclspkgerror{Back-to-back inter-column glue specifiers in column\MessageBreak
specifications. Ignoring consecutive glue specifiers\MessageBreak
after the first}%
{You cannot have two or more glue types next to each other\MessageBreak 
in the TSoCeqnarray column specifications.}%
\let\@TSoCBPcurtype=a% abort this glue
\else% not a back to back glue
\if\@TSoCBPprevtype c\relax% if the previoustype was a col, add column/glue pair to preamble
\ifnum\@TSoCeqnnumcols>0\relax\@TSoCappendtoksA{&}\fi
\toks0={##}%
% make preamble advance col counter if this environment needs this
\if@advanceTSoCeqncolcnt\@TSoCappendtoksA{\global\advance\@TSoCeqncolcnt by 1\relax}\fi
% insert the column defintion into the preamble, being careful not to expand
% the column definition
\@TSoCappendtoksA{\tabskip=\@TSoCBPcurglue}%
\@TSoCappendNOEXPANDtoksA{\begingroup\csname @TSoCeqnarraycolPRE}%
\@TSoCappendtoksA{\@TSoCBPcurcolname}%
\@TSoCappendNOEXPANDtoksA{\endcsname}%
\@TSoCappendtoksA{\the\toks0}%
\@TSoCappendNOEXPANDtoksA{\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\csname @TSoCeqnarraycolPOST}%
\@TSoCappendtoksA{\@TSoCBPcurcolname}%
\@TSoCappendNOEXPANDtoksA{\endcsname\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\endgroup}%
\advance\@TSoCeqnnumcols by 1\relax%one more column in the preamble
\else% error: non-start glue with no pending column
\@TSoCclspkgerror{Inter-column glue specifier without a prior column\MessageBreak
type in the column specifications. Ignoring this glue\MessageBreak 
specifier}%
{Except for the first and last positions, glue can be placed only\MessageBreak
between column types.}%
\let\@TSoCBPcurtype=a% abort this glue
\fi% previous was a column
\fi% back-to-back glues
\fi% is start column glue
\fi% prev type not a
}


% process an acquired letter referenced column and, if necessary, add it to the preamble
\def\@TSoCprocessCcol{\if\@TSoCBPnexttype g\else
\if\@TSoCBPnexttype n\else
% we have a column followed by something other than a glue (or numeral glue)
% so we must add this column to the preamble now
\ifnum\@TSoCeqnnumcols>0\relax\@TSoCappendtoksA{&}\fi%col separator for those after the first
\if\@TSoCBPnexttype e\@TSoCappendtoksA{\tabskip=\@TSoCBPendglue\relax}\else%put in end glue
\@TSoCappendtoksA{\tabskip=\@TSoCeqnarraycolSEPdefaultmid\relax}\fi% or default mid glue
\toks0={##}%
% make preamble advance col counter if this environment needs this
\if@advanceTSoCeqncolcnt\@TSoCappendtoksA{\global\advance\@TSoCeqncolcnt by 1\relax}\fi
% insert the column definition into the preamble, being careful not to expand
% the column definition
\@TSoCappendNOEXPANDtoksA{\begingroup\csname @TSoCeqnarraycolPRE}%
\@TSoCappendtoksA{\@TSoCBPcurcolname}%
\@TSoCappendNOEXPANDtoksA{\endcsname}%
\@TSoCappendtoksA{\the\toks0}%
\@TSoCappendNOEXPANDtoksA{\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\csname @TSoCeqnarraycolPOST}%
\@TSoCappendtoksA{\@TSoCBPcurcolname}%
\@TSoCappendNOEXPANDtoksA{\endcsname\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\endgroup}%
\advance\@TSoCeqnnumcols by 1\relax%one more column in the preamble
\fi%next type not numeral
\fi%next type not glue
}


%%
%% END OF TSoCeqnarray DEFINITIONS
%%




% set up the running headings, this complex because of all the different
% modes TSoCtran supports
\if@twoside
 \ifCLASSOPTIONtechnote
   \def\ps@headings{%
       \def\@oddhead{\hbox{}\scriptsize\leftmark \hfil \thepage}
       \def\@evenhead{\scriptsize\thepage \hfil \leftmark\hbox{}}
       \ifCLASSOPTIONdraftcls
            \ifCLASSOPTIONdraftclsnofoot
               \def\@oddfoot{}\def\@evenfoot{}%
            \else
               \def\@oddfoot{\scriptsize\@date\hfil DRAFT}
               \def\@evenfoot{\scriptsize DRAFT\hfil\@date}
            \fi
       \else
            \def\@oddfoot{}\def\@evenfoot{}
       \fi}
 \else % not a technote
   \def\ps@headings{%
       \ifCLASSOPTIONconference
        \def\@oddhead{}
        \def\@evenhead{}
       \else
        \def\@oddhead{\hbox{}\scriptsize\rightmark \hfil \thepage}
        \def\@evenhead{\scriptsize\thepage \hfil \leftmark\hbox{}}
       \fi
       \ifCLASSOPTIONdraftcls
            \def\@oddhead{\hbox{}\scriptsize\rightmark \hfil \thepage}
            \def\@evenhead{\scriptsize\thepage \hfil \leftmark\hbox{}}
            \ifCLASSOPTIONdraftclsnofoot
               \def\@oddfoot{}\def\@evenfoot{}%
            \else
               \def\@oddfoot{\scriptsize\@date\hfil DRAFT}
               \def\@evenfoot{\scriptsize DRAFT\hfil\@date}
            \fi
       \else
            \def\@oddfoot{}\def\@evenfoot{}%
       \fi}
 \fi
\else % single side
\def\ps@headings{%
    \ifCLASSOPTIONconference
     \def\@oddhead{}
     \def\@evenhead{}
    \else
     \def\@oddhead{\hbox{}\scriptsize\leftmark \hfil \thepage}
     \def\@evenhead{}
    \fi
    \ifCLASSOPTIONdraftcls
          \def\@oddhead{\hbox{}\scriptsize\leftmark \hfil \thepage}
          \def\@evenhead{}
          \ifCLASSOPTIONdraftclsnofoot
             \def\@oddfoot{}
          \else
             \def\@oddfoot{\scriptsize \@date \hfil DRAFT}
          \fi
    \else
         \def\@oddfoot{}
    \fi
    \def\@evenfoot{}}
\fi


% title page style
\def\ps@TSoCtitlepagestyle{\def\@oddfoot{}\def\@evenfoot{}%
\ifCLASSOPTIONconference
   \def\@oddhead{}%
   \def\@evenhead{}%
\else
   \def\@oddhead{\hbox{}\scriptsize\leftmark \hfil \thepage}%
   \def\@evenhead{\scriptsize\thepage \hfil \leftmark\hbox{}}%
\fi
\ifCLASSOPTIONdraftcls
   \def\@oddhead{\hbox{}\scriptsize\leftmark \hfil \thepage}%
   \def\@evenhead{\scriptsize\thepage \hfil \leftmark\hbox{}}%
   \ifCLASSOPTIONdraftclsnofoot\else
      \def\@oddfoot{\scriptsize \@date\hfil DRAFT}%
      \def\@evenfoot{\scriptsize DRAFT\hfil \@date}%
   \fi
\else
   % all non-draft mode footers
   \if@TSoCusingpubid
      % for title pages that are using a pubid
      % do not repeat pubid if using peer review option
      \ifCLASSOPTIONpeerreview
      \else
         \footskip 0pt%
         \ifCLASSOPTIONcompsoc
           \def\@oddfoot{\hss\normalfont\scriptsize\raisebox{-1.5\@TSoCnormalsizeunitybaselineskip}[0ex][0ex]{\@TSoCpubid}\hss}%
           \def\@evenfoot{\hss\normalfont\scriptsize\raisebox{-1.5\@TSoCnormalsizeunitybaselineskip}[0ex][0ex]{\@TSoCpubid}\hss}%
         \else
           \def\@oddfoot{\hss\normalfont\footnotesize\raisebox{1.5ex}[1.5ex]{\@TSoCpubid}\hss}%
           \def\@evenfoot{\hss\normalfont\footnotesize\raisebox{1.5ex}[1.5ex]{\@TSoCpubid}\hss}%
         \fi
      \fi
   \fi
\fi}


% peer review cover page style
\def\ps@TSoCpeerreviewcoverpagestyle{%
\def\@oddhead{}\def\@evenhead{}%
\def\@oddfoot{}\def\@evenfoot{}%
\ifCLASSOPTIONdraftcls
   \ifCLASSOPTIONdraftclsnofoot\else
      \def\@oddfoot{\scriptsize \@date\hfil DRAFT}%
      \def\@evenfoot{\scriptsize DRAFT\hfil \@date}%
   \fi
\else
   % non-draft mode footers
   \if@TSoCusingpubid
      \footskip 0pt%
      \ifCLASSOPTIONcompsoc
        \def\@oddfoot{\hss\normalfont\scriptsize\raisebox{-1.5\@TSoCnormalsizeunitybaselineskip}[0ex][0ex]{\@TSoCpubid}\hss}%
        \def\@evenfoot{\hss\normalfont\scriptsize\raisebox{-1.5\@TSoCnormalsizeunitybaselineskip}[0ex][0ex]{\@TSoCpubid}\hss}%
      \else
        \def\@oddfoot{\hss\normalfont\footnotesize\raisebox{1.5ex}[1.5ex]{\@TSoCpubid}\hss}%
        \def\@evenfoot{\hss\normalfont\footnotesize\raisebox{1.5ex}[1.5ex]{\@TSoCpubid}\hss}%
      \fi
   \fi
\fi}


% start with empty headings
\def\rightmark{}\def\leftmark{}

\newcommand{\MONTH}{%
  \ifcase\the\month
  \or March% 1
  \or March% 2
  \or March% 3
  \or September% 4
  \or September% 5
  \or September% 6
  \or September% 7
  \or September% 8
  \or September% 9
  \or March% 10
  \or March% 11
  \or March% 12
  \fi}

%% Defines the command for putting the header. \footernote{TEXT} is the same
%% as \markboth{TEXT}{TEXT}. 
%% Note that all the text is forced into uppercase, if you have some text
%% that needs to be in lower case, for instance et. al., then either manually
%% set \leftmark and \rightmark or use \MakeLowercase{et. al.} within the
%% arguments to \markboth.
%% V1.7b add \protect to work with Babel
\def\markboth#1#2{\def\leftmark{\@TSoCcompsoconly{\sffamily}\textsc{\Author \MakeLowercase{\textit{} }: \Title} #1}%
\def\leftmark{\@TSoCcompsoconly{\sffamily}\textsc{Ind. Journal on Computing~Vol.~XX, No.~XX, \MONTH~\the\year #2}}}
\def\footernote#1{\markboth{#1}{#1}}

\def\today{\ifcase\month\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December\fi
    \space\number\day, \number\year}




%% CITATION AND BIBLIOGRAPHY COMMANDS
%% 
%% V1.6 no longer supports the older, nonstandard \shortcite and \citename setup stuff
% 
% 
% Modify Latex2e \@citex to separate citations with "], ["
\def\@citex[#1]#2{%
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{], [}%
     \edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
     \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
     \@ifundefined{b@\@citeb}{\mbox{\reset@font\bfseries ?}%
       \G@refundefinedtrue
       \@latex@warning
         {Citation `\@citeb' on page \thepage \space undefined}}%
       {\hbox{\csname b@\@citeb\endcsname}}}}{#1}}

% V1.6 we create hooks for the optional use of Donald Arseneau's
% cite.sty package. cite.sty is "smart" and will notice that the
% following format controls are already defined and will not
% redefine them. The result will be the proper sorting of the
% citation numbers and auto detection of 3 or more entry "ranges" -
% all in TSoC style:  [1], [2], [5]--[7], [12]
% This also allows for an optional note, i.e., \cite[mynote]{..}.
% If the \cite with note has more than one reference, the note will
% be applied to the last of the listed references. It is generally
% desired that if a note is given, only one reference is listed in
% that \cite.
% Thanks to Mr. Arseneau for providing the required format arguments
% to produce the TSoC style.
\def\citepunct{], [}
\def\citedash{]--[}

% V1.7 default to using same font for urls made by url.sty
\AtBeginDocument{\csname url@samestyle\endcsname}

% V1.6 class files should always provide these
\def\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty


% Provide support for the control entries of TSoCtran.bst V1.00 and later.
% V1.7 optional argument allows for a different aux file to be specified in
% order to handle multiple bibliographies. For example, with multibib.sty:
% \newcites{sec}{Secondary Literature}
% \bstctlcite[@auxoutsec]{BSTcontrolhak}
\def\bstctlcite{\@ifnextchar[{\@bstctlcite}{\@bstctlcite[@auxout]}}
\def\@bstctlcite[#1]#2{\@bsphack
  \@for\@citeb:=#2\do{%
    \edef\@citeb{\expandafter\@firstofone\@citeb}%
    \if@filesw\immediate\write\csname #1\endcsname{\string\citation{\@citeb}}\fi}%
  \@esphack}

% V1.6 provide a way for a user to execute a command just before 
% a given reference number - used to insert a \newpage to balance
% the columns on the last page
\edef\@TSoCtriggerrefnum{0}   % the default of zero means that
                              % the command is not executed
\def\@TSoCtriggercmd{\newpage}

% allow the user to alter the triggered command
\long\def\TSoCtriggercmd#1{\long\def\@TSoCtriggercmd{#1}}

% allow user a way to specify the reference number just before the
% command is executed
\def\TSoCtriggeratref#1{\@TSoCtrantmpcountA=#1%
\edef\@TSoCtriggerrefnum{\the\@TSoCtrantmpcountA}}%

% trigger command at the given reference
\def\@TSoCbibitemprefix{\@TSoCtrantmpcountA=\@TSoCtriggerrefnum\relax%
\advance\@TSoCtrantmpcountA by -1\relax%
\ifnum\c@enumiv=\@TSoCtrantmpcountA\relax\@TSoCtriggercmd\relax\fi}


\def\@biblabel#1{[#1]}

% compsoc journals left align the reference numbers
\@TSoCcompsocnotconfonly{\def\@biblabel#1{[#1]\hfill}}

% controls bib item spacing
\def\TSoCbibitemsep{0pt plus .5pt}

\@TSoCcompsocconfonly{\def\TSoCbibitemsep{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}}


\def\thebibliography#1{\section*{\refname}%
    \addcontentsline{toc}{section}{\refname}%
    % V1.6 add some rubber space here and provide a command trigger
    \footnotesize\@TSoCcompsocconfonly{\small}\vskip 0.3\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip%
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep\relax
    \itemsep \TSoCbibitemsep\relax
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \let\@TSoClatexbibitem\bibitem%
    \def\bibitem{\@TSoCbibitemprefix\@TSoClatexbibitem}%
\def\newblock{\hskip .11em plus .33em minus .07em}%
% originally:
%   \sloppy\clubpenalty4000\widowpenalty4000%
% by adding the \interlinepenalty here, we make it more
% difficult, but not impossible, for LaTeX to break within a reference.
% TSoC almost never breaks a reference (but they do it more often with
% technotes). You may get an underfull vbox warning around the bibliography, 
% but the final result will be much more like what TSoC will publish. 
% MDS 11/2000
\ifCLASSOPTIONtechnote\sloppy\clubpenalty4000\widowpenalty4000\interlinepenalty100%
\else\sloppy\clubpenalty4000\widowpenalty4000\interlinepenalty500\fi%
    \sfcode`\.=1000\relax}
\let\endthebibliography=\endlist




% TITLE PAGE COMMANDS
% 
% 
% \TSoCmembership is used to produce the sublargesize italic font used to indicate author 
% TSoC membership. compsoc uses a large size sans slant font
\def\TSoCmembership#1{{\@TSoCnotcompsoconly{\sublargesize}\normalfont\@TSoCcompsoconly{\sffamily}\textit{#1}}}
 

% \TSoCauthorrefmark{} produces a footnote type symbol to indicate author affiliation.
% When given an argument of 1 to 9, \TSoCauthorrefmark{} follows the standard LaTeX footnote
% symbol sequence convention. However, for arguments 10 and above, \TSoCauthorrefmark{} 
% reverts to using lower case roman numerals, so it cannot overflow. Do note that you 
% cannot use \footnotemark[] in place of \TSoCauthorrefmark{} within \author as the footnote
% symbols will have been turned off to prevent \thanks from creating footnote marks.
% \TSoCauthorrefmark{} produces a symbol that appears to LaTeX as having zero vertical
% height - this allows for a more compact line packing, but the user must ensure that
% the interline spacing is large enough to prevent \TSoCauthorrefmark{} from colliding
% with the text above.
% V1.7 make this a robust command
% V1.8 transmag uses an arabic author affiliation symbol
\ifCLASSOPTIONtransmag
\DeclareRobustCommand*{\TSoCauthorrefmark}[1]{\raisebox{0pt}[0pt][0pt]{\textsuperscript{\footnotesize #1}}}
\else
\DeclareRobustCommand*{\TSoCauthorrefmark}[1]{\raisebox{0pt}[0pt][0pt]{\textsuperscript{\footnotesize\ensuremath{\ifcase#1\or *\or \dagger\or \ddagger\or%
    \mathsection\or \mathparagraph\or \|\or **\or \dagger\dagger%
    \or \ddagger\ddagger \else\textsuperscript{\expandafter\romannumeral#1}\fi}}}}
\fi


% FONT CONTROLS AND SPACINGS FOR CONFERENCE MODE AUTHOR NAME AND AFFILIATION BLOCKS
% 
% The default font styles for the author name and affiliation blocks (confmode)
\def\@TSoCauthorblockNstyle{\normalfont\@TSoCcompsocnotconfonly{\sffamily}\sublargesize\@TSoCcompsocconfonly{\large}}
\def\@TSoCauthorblockAstyle{\normalfont\@TSoCcompsocnotconfonly{\sffamily}\@TSoCcompsocconfonly{\itshape}\normalsize\@TSoCcompsocconfonly{\large}}
% The default if the user does not use an author block
\def\@TSoCauthordefaulttextstyle{\normalfont\@TSoCcompsocnotconfonly{\sffamily}\sublargesize}

% adjustment spacing from title (or special paper notice) to author name blocks (confmode)
% can be negative
\def\@TSoCauthorblockconfadjspace{-0.25em}
% compsoc conferences need more space here
\@TSoCcompsocconfonly{\def\@TSoCauthorblockconfadjspace{0.75\@TSoCnormalsizeunitybaselineskip}}

% spacing between name and affiliation blocks (confmode)
% This can be negative.
% TSoC doesn't want any added spacing here, but I will leave these
% controls in place in case they ever change their mind.
% Personally, I like 0.75ex.
%\def\@TSoCauthorblockNtopspace{0.75ex}
%\def\@TSoCauthorblockAtopspace{0.75ex}
\def\@TSoCauthorblockNtopspace{0.0ex}
\def\@TSoCauthorblockAtopspace{0.0ex}
\ifCLASSOPTIONtransmag
% transmag uses one line of space above first affiliation block
\def\@TSoCauthorblockAtopspace{1\@TSoCnormalsizeunitybaselineskip}
\fi

% baseline spacing within name and affiliation blocks (confmode)
% must be positive, spacings below certain values will make 
% the position of line of text sensitive to the contents of the
% line above it i.e., whether or not the prior line has descenders, 
% subscripts, etc. For this reason it is a good idea to keep
% these above 2.6ex
\def\@TSoCauthorblockNinterlinespace{2.6ex}
\def\@TSoCauthorblockAinterlinespace{2.75ex}

% This tracks the required strut size.
% See the \@TSoCauthorhalign command for the actual default value used.
\def\@TSoCauthorblockXinterlinespace{2.7ex}

% variables to retain font size and style across groups
% values given here have no effect as they will be overwritten later
\gdef\@TSoCSAVESTATEfontsize{10}
\gdef\@TSoCSAVESTATEfontbaselineskip{12}
\gdef\@TSoCSAVESTATEfontencoding{OT1}
\gdef\@TSoCSAVESTATEfontfamily{ptm}
\gdef\@TSoCSAVESTATEfontseries{m}
\gdef\@TSoCSAVESTATEfontshape{n}

% saves the current font attributes
\def\@TSoCcurfontSAVE{\global\let\@TSoCSAVESTATEfontsize\f@size%
\global\let\@TSoCSAVESTATEfontbaselineskip\f@baselineskip%
\global\let\@TSoCSAVESTATEfontencoding\f@encoding%
\global\let\@TSoCSAVESTATEfontfamily\f@family%
\global\let\@TSoCSAVESTATEfontseries\f@series%
\global\let\@TSoCSAVESTATEfontshape\f@shape}

% restores the saved font attributes
\def\@TSoCcurfontRESTORE{\fontsize{\@TSoCSAVESTATEfontsize}{\@TSoCSAVESTATEfontbaselineskip}%
\fontencoding{\@TSoCSAVESTATEfontencoding}%
\fontfamily{\@TSoCSAVESTATEfontfamily}%
\fontseries{\@TSoCSAVESTATEfontseries}%
\fontshape{\@TSoCSAVESTATEfontshape}%
\selectfont}


% variable to indicate if the current block is the first block in the column
\newif\if@TSoCprevauthorblockincol   \@TSoCprevauthorblockincolfalse


% the command places a strut with height and depth = \@TSoCauthorblockXinterlinespace
% we use this technique to have complete manual control over the spacing of the lines
% within the halign environment.
% We set the below baseline portion at 30%, the above
% baseline portion at 70% of the total length.
% Responds to changes in the document's \baselinestretch
\def\@TSoCauthorstrutrule{\@TSoCtrantmpdimenA\@TSoCauthorblockXinterlinespace%
\@TSoCtrantmpdimenA=\baselinestretch\@TSoCtrantmpdimenA%
\rule[-0.3\@TSoCtrantmpdimenA]{0pt}{\@TSoCtrantmpdimenA}}


% blocks to hold the authors' names and affilations. 
% Makes formatting easy for conferences
%
% use real definitions in conference mode
% name block
\def\TSoCauthorblockN#1{\relax\@TSoCauthorblockNstyle% set the default text style
\gdef\@TSoCauthorblockXinterlinespace{0pt}% disable strut for spacer row
% the \expandafter hides the \cr in conditional tex, see the array.sty docs
% for details, probably not needed here as the \cr is in a macro
% do a spacer row if needed
\if@TSoCprevauthorblockincol\expandafter\@TSoCauthorblockNtopspaceline\fi
\global\@TSoCprevauthorblockincoltrue% we now have a block in this column
%restore the correct strut value
\gdef\@TSoCauthorblockXinterlinespace{\@TSoCauthorblockNinterlinespace}%
% input the author names
#1%
% end the row if the user did not already
\crcr}
% spacer row for names
\def\@TSoCauthorblockNtopspaceline{\cr\noalign{\vskip\@TSoCauthorblockNtopspace}}
%
% affiliation block
\def\TSoCauthorblockA#1{\relax\@TSoCauthorblockAstyle% set the default text style
\gdef\@TSoCauthorblockXinterlinespace{0pt}%disable strut for spacer row
% the \expandafter hides the \cr in conditional tex, see the array.sty docs
% for details, probably not needed here as the \cr is in a macro
% do a spacer row if needed
\if@TSoCprevauthorblockincol\expandafter\@TSoCauthorblockAtopspaceline\fi
\global\@TSoCprevauthorblockincoltrue% we now have a block in this column
%restore the correct strut value
\gdef\@TSoCauthorblockXinterlinespace{\@TSoCauthorblockAinterlinespace}%
% input the author affiliations
#1%
% end the row if the user did not already
\crcr
% V1.8 transmag does not use any additional affiliation spacing after the first author
\ifCLASSOPTIONtransmag\gdef\@TSoCauthorblockAtopspace{0pt}\fi}

% spacer row for affiliations
\def\@TSoCauthorblockAtopspaceline{\cr\noalign{\vskip\@TSoCauthorblockAtopspace}}


% allow papers to compile even if author blocks are used in modes other
% than conference or peerreviewca. For such cases, we provide dummy blocks.
\ifCLASSOPTIONconference
\else
   \ifCLASSOPTIONpeerreviewca\else
      % not conference, peerreviewca or transmag mode
      \ifCLASSOPTIONtransmag\else
         \def\TSoCauthorblockN#1{#1}%
         \def\TSoCauthorblockA#1{#1}%
      \fi
   \fi
\fi



% we provide our own halign so as not to have to depend on tabular
\def\@TSoCauthorhalign{\@TSoCauthordefaulttextstyle% default text style
   \lineskip=0pt\relax% disable line spacing
   \lineskiplimit=0pt\relax%
   \baselineskip=0pt\relax%
   \@TSoCcurfontSAVE% save the current font
   \mathsurround\z@\relax% no extra spacing around math
   \let\\\@TSoCauthorhaligncr% replace newline with halign friendly one
   \tabskip=0pt\relax% no column spacing
   \everycr{}% ensure no problems here
   \@TSoCprevauthorblockincolfalse% no author blocks yet
   \def\@TSoCauthorblockXinterlinespace{2.7ex}% default interline space
   \vtop\bgroup%vtop box
   \halign\bgroup&\relax\hfil\@TSoCcurfontRESTORE\relax ##\relax
   \hfil\@TSoCcurfontSAVE\@TSoCauthorstrutrule\cr}

% ensure last line, exit from halign, close vbox
\def\end@TSoCauthorhalign{\crcr\egroup\egroup}

% handle bogus star form
\def\@TSoCauthorhaligncr{{\ifnum0=`}\fi\@ifstar{\@@TSoCauthorhaligncr}{\@@TSoCauthorhaligncr}}

% test and setup the optional argument to \\[]
\def\@@TSoCauthorhaligncr{\@testopt\@@@TSoCauthorhaligncr\z@skip}

% end the line and do the optional spacer
\def\@@@TSoCauthorhaligncr[#1]{\ifnum0=`{\fi}\cr\noalign{\vskip#1\relax}}



% flag to prevent multiple \and warning messages
\newif\if@TSoCWARNand
\@TSoCWARNandtrue

% if in conference or peerreviewca modes, we support the use of \and as \author is a
% tabular environment, otherwise we warn the user that \and is invalid
% outside of conference or peerreviewca modes.
\def\and{\relax} % provide a bogus \and that we will then override

\renewcommand{\and}[1][\relax]{\if@TSoCWARNand\typeout{** WARNING: \noexpand\and is valid only
                               when in conference or peerreviewca}\typeout{modes (line \the\inputlineno).}\fi\global\@TSoCWARNandfalse}

\ifCLASSOPTIONconference%
\renewcommand{\and}[1][\hfill]{\end{@TSoCauthorhalign}#1\begin{@TSoCauthorhalign}}%
\fi
\ifCLASSOPTIONpeerreviewca
\renewcommand{\and}[1][\hfill]{\end{@TSoCauthorhalign}#1\begin{@TSoCauthorhalign}}%
\fi
% V1.8 transmag uses conference author format
\ifCLASSOPTIONtransmag
\renewcommand{\and}[1][\hfill]{\end{@TSoCauthorhalign}#1\begin{@TSoCauthorhalign}}%
\fi

% page clearing command
% based on LaTeX2e's \cleardoublepage, but allows different page styles
% for the inserted blank pages
\def\@TSoCcleardoublepage#1{\clearpage\if@twoside\ifodd\c@page\else
\hbox{}\thispagestyle{#1}\newpage\if@twocolumn\hbox{}\thispagestyle{#1}\newpage\fi\fi\fi}


% user command to invoke the title page
\def\maketitle{\par%
  \begingroup%
  \normalfont%
  \def\thefootnote{}%  the \thanks{} mark type is empty
  \def\footnotemark{}% and kill space from \thanks within author
  \let\@makefnmark\relax% V1.7, must *really* kill footnotemark to remove all \textsuperscript spacing as well.
  \footnotesize%       equal spacing between thanks lines
  \footnotesep 0.7\baselineskip%see global setting of \footnotesep for more info
  % V1.7 disable \thanks note indention for compsoc
  \@TSoCcompsoconly{\long\def\@makefntext##1{\parindent 1em\noindent\hbox{\@makefnmark}##1}}%
  \normalsize%
  \ifCLASSOPTIONpeerreview
     \newpage\global\@topnum\z@ \@maketitle\@TSoCstatictitlevskip\@TSoCaftertitletext%
     \thispagestyle{TSoCpeerreviewcoverpagestyle}\@thanks%
  \else
     \if@twocolumn%
        \ifCLASSOPTIONtechnote%
           \newpage\global\@topnum\z@ \@maketitle\@TSoCstatictitlevskip\@TSoCaftertitletext%
        \else
           \twocolumn[\@maketitle\@TSoCdynamictitlevspace\@TSoCaftertitletext]%
        \fi
     \else
        \newpage\global\@topnum\z@ \@maketitle\@TSoCstatictitlevskip\@TSoCaftertitletext%
     \fi
     \thispagestyle{TSoCtitlepagestyle}\@thanks%
  \fi
  % pullup page for pubid if used.
  \if@TSoCusingpubid
     \enlargethispage{-\@TSoCpubidpullup}%
  \fi 
  \endgroup
  \setcounter{footnote}{0}\let\maketitle\relax\let\@maketitle\relax
  \gdef\@thanks{}%
  % v1.6b do not clear these as we will need the title again for peer review papers
  % \gdef\@author{}\gdef\@title{}%
  \let\thanks\relax}



% V1.8 parbox to format \@TSoCtitleabstractindextext
\long\def\@TSoCtitleabstractindextextbox#1{\parbox{200mm}{#1}}
% V1.8 compsoc is partial width
%\ifCLASSOPTIONcompsoc
%\ifCLASSOPTIONjournal
%\long\def\@TSoCtitleabstractindextextbox#1{\parbox{100mm}{#1}}
%fi
%\fi

% formats the Title, authors names, affiliations and special paper notice
% THIS IS A CONTROLLED SPACING COMMAND! Do not allow blank lines or unintentional
% spaces to enter the definition - use % at the end of each line
\def\@maketitle{\newpage
\bgroup\par\addvspace{0.5\baselineskip}\centering%
\ifCLASSOPTIONtechnote% technotes
   {\bfseries\large\@TSoCcompsoconly{\sffamily}\@title\par}\vskip 1.3em{\lineskip .5em\@TSoCcompsoconly{\sffamily}\@author
   \@TSoCspecialpapernotice\par{\@TSoCcompsoconly{\vskip 1.5em\relax
   \@TSoCtitleabstractindextextbox{\@TSoCtitleabstractindextext}\par
   \hfill\@TSoCcompsocdiamondline\hfill\hbox{}\par}}}\relax
\else% not a technote
   \vskip0.2em{\Huge\ifCLASSOPTIONtransmag\bfseries\LARGE\fi\@TSoCcompsoconly{\sffamily}\@TSoCcompsocconfonly{\normalfont\normalsize\vskip 2\@TSoCnormalsizeunitybaselineskip
   \bfseries\Large}\@title\par}\vskip1.0em\par%
   % V1.6 handle \author differently if in conference mode
   \ifCLASSOPTIONconference%
      {\@TSoCspecialpapernotice\mbox{}\vskip\@TSoCauthorblockconfadjspace%
       \mbox{}\hfill\begin{@TSoCauthorhalign}\@author\end{@TSoCauthorhalign}\hfill\mbox{}\par}\relax
   \else% peerreviewca, peerreview or journal
      \ifCLASSOPTIONpeerreviewca
         % peerreviewca handles author names just like conference mode
         {\@TSoCcompsoconly{\sffamily}\@TSoCspecialpapernotice\mbox{}\vskip\@TSoCauthorblockconfadjspace%
          \mbox{}\hfill\begin{@TSoCauthorhalign}\@author\end{@TSoCauthorhalign}\hfill\mbox{}\par
          {\@TSoCcompsoconly{\vskip 1.5em\relax
           \@TSoCtitleabstractindextextbox{\@TSoCtitleabstractindextext}\par\hfill
           \@TSoCcompsocdiamondline\hfill\hbox{}\par}}}\relax
      \else% journal, peerreview or transmag
         \ifCLASSOPTIONtransmag
            % transmag also handles author names just like conference mode
            % it also uses \@TSoCtitleabstractindextex, but with one line less
            % space above, and one more below
           {\@TSoCspecialpapernotice\mbox{}\vskip\@TSoCauthorblockconfadjspace%
            \mbox{}\hfill\begin{@TSoCauthorhalign}\@author\end{@TSoCauthorhalign}\hfill\mbox{}\par
           {\vspace{0.5\baselineskip}\relax\@TSoCtitleabstractindextextbox{\@TSoCtitleabstractindextext}\vspace{-1\baselineskip}\par}}\relax
         \else% journal or peerreview
           {\lineskip.5em\@TSoCcompsoconly{\sffamily}\sublargesize\@author\@TSoCspecialpapernotice\par
           {\@TSoCcompsoconly{\vskip 1.5em\relax
            \@TSoCtitleabstractindextextbox{\@TSoCtitleabstractindextext}\par\hfill
            \@TSoCcompsocdiamondline\hfill\hbox{}\par}}}\relax
         \fi
      \fi
   \fi
\fi\par\addvspace{0.5\baselineskip}\egroup}



% V1.7 Computer Society "diamond line" which follows index terms for nonconference papers
\def\@TSoCcompsocdiamondline{\vrule depth 0pt height 0.5pt width 4cm\hspace{7.5pt}%
\raisebox{-3.5pt}{\fontfamily{pzd}\fontencoding{U}\fontseries{m}\fontshape{n}\fontsize{11}{12}\selectfont\char70}%
\hspace{7.5pt}\vrule depth 0pt height 0.5pt width 4cm\relax}

% V1.7 standard LateX2e \thanks, but with \itshape under compsoc. Also make it a \long\def
% We also need to trigger the one-shot footnote rule
\def\@TSoCtriggeroneshotfootnoterule{\global\@TSoCenableoneshotfootnoteruletrue}


\long\def\thanks#1{\footnotemark
    \protected@xdef\@thanks{\@thanks
        \protect\footnotetext[\the\c@footnote]{\@TSoCcompsoconly{\itshape
        \protect\@TSoCtriggeroneshotfootnoterule\relax}\ignorespaces#1}}}
\let\@thanks\@empty

% V1.7 allow \author to contain \par's. This is needed to allow \thanks to contain \par.
\long\def\author#1{\gdef\@author{#1}}


% in addition to setting up TSoCitemize, we need to remove a baselineskip space above and
% below it because \list's \pars introduce blank lines because of the footnote struts.
\def\@TSoCsetupcompsocitemizelist{\def\labelitemi{$\bullet$}%
\setlength{\TSoClabelindent}{0pt}\setlength{\parskip}{0pt}%
\setlength{\partopsep}{0pt}\setlength{\topsep}{0.5\baselineskip}\vspace{-1\baselineskip}\relax}


% flag for fake non-compsoc \TSoCcompsocthanksitem - prevents line break on very first item
\newif\if@TSoCbreakcompsocthanksitem \@TSoCbreakcompsocthanksitemfalse

\ifCLASSOPTIONcompsoc
% V1.7 compsoc bullet item \thanks
% also, we need to redefine this to destroy the argument in \@TSoCdynamictitlevspace
\long\def\TSoCcompsocitemizethanks#1{\relax\@TSoCbreakcompsocthanksitemfalse\footnotemark
    \protected@xdef\@thanks{\@thanks
        \protect\footnotetext[\the\c@footnote]{\itshape\protect\@TSoCtriggeroneshotfootnoterule
        {\let\TSoCiedlistdecl\relax\protect\begin{TSoCitemize}[\protect\@TSoCsetupcompsocitemizelist]\ignorespaces#1\relax
        \protect\end{TSoCitemize}}\protect\vspace{-1\baselineskip}}}}
\DeclareRobustCommand*{\TSoCcompsocthanksitem}{\item}
\else
% non-compsoc, allow for dual compilation via rerouting to normal \thanks
\long\def\TSoCcompsocitemizethanks#1{\thanks{#1}}
% redirect to "pseudo-par" \hfil\break\indent after swallowing [] from \TSoCcompsocthanksitem[]
\DeclareRobustCommand{\TSoCcompsocthanksitem}{\@ifnextchar [{\@TSoCthanksswallowoptionalarg}%
{\@TSoCthanksswallowoptionalarg[\relax]}}
% be sure and break only after first item, be sure and ignore spaces after optional argument
\def\@TSoCthanksswallowoptionalarg[#1]{\relax\if@TSoCbreakcompsocthanksitem\hfil\break
\indent\fi\@TSoCbreakcompsocthanksitemtrue\ignorespaces}
\fi


% V1.6b define the \TSoCpeerreviewmaketitle as needed
\ifCLASSOPTIONpeerreview
\def\TSoCpeerreviewmaketitle{\@TSoCcleardoublepage{empty}%
\ifCLASSOPTIONtwocolumn
\twocolumn[\@TSoCpeerreviewmaketitle\@TSoCdynamictitlevspace]
\else
\newpage\@TSoCpeerreviewmaketitle\@TSoCstatictitlevskip
\fi
\thispagestyle{TSoCtitlepagestyle}}
\else
% \TSoCpeerreviewmaketitle does nothing if peer review option has not been selected
\def\TSoCpeerreviewmaketitle{\relax}
\fi

% peerreview formats the repeated title like the title in journal papers.
\def\@TSoCpeerreviewmaketitle{\bgroup\par\addvspace{0.5\baselineskip}\centering\@TSoCcompsoconly{\sffamily}%
\normalfont\normalsize\vskip0.2em{\Huge\@title\par}\vskip1.0em\par
\par\addvspace{0.5\baselineskip}\egroup}



% V1.6 
% this is a static rubber spacer between the title/authors and the main text
% used for single column text, or when the title appears in the first column
% of two column text (technotes). 
\def\@TSoCstatictitlevskip{{\normalfont\normalsize
% adjust spacing to next text
% v1.6b handle peer review papers
\ifCLASSOPTIONpeerreview
% for peer review papers, the same value is used for both title pages
% regardless of the other paper modes
   \vskip 1\baselineskip plus 0.375\baselineskip minus 0.1875\baselineskip
\else
   \ifCLASSOPTIONconference% conference
      \vskip 1\baselineskip plus 0.375\baselineskip minus 0.1875\baselineskip%
   \else%
      \ifCLASSOPTIONtechnote% technote
         \vskip 1\baselineskip plus 0.375\baselineskip minus 0.1875\baselineskip%
      \else% journal uses more space
         \vskip 2.5\baselineskip plus 0.75\baselineskip minus 0.375\baselineskip%
      \fi
   \fi
\fi}}


% V1.6
% This is a dynamically determined rigid spacer between the title/authors 
% and the main text. This is used only for single column titles over two 
% column text (most common)
% This is bit tricky because we have to ensure that the textheight of the
% main text is an integer multiple of \baselineskip
% otherwise underfull vbox problems may develop in the second column of the
% text on the titlepage
% The possible use of \TSoCpubid must also be taken into account.
\def\@TSoCdynamictitlevspace{{%
    % we run within a group so that all the macros can be forgotten when we are done
    \long\def\thanks##1{\relax}%don't allow \thanks to run when we evaluate the vbox height
    \long\def\TSoCcompsocitemizethanks##1{\relax}%don't allow \TSoCcompsocitemizethanks to run when we evaluate the vbox height
    \normalfont\normalsize% we declare more descriptive variable names
    \let\@TSoCmaintextheight=\@TSoCtrantmpdimenA%height of the main text columns
    \let\@TSoCINTmaintextheight=\@TSoCtrantmpdimenB%height of the main text columns with integer # lines
    % set the nominal and minimum values for the title spacer
    % the dynamic algorithm will not allow the spacer size to
    % become less than \@TSoCMINtitlevspace - instead it will be
    % lengthened
    % default to journal values
    \def\@TSoCNORMtitlevspace{2.5\baselineskip}%
    \def\@TSoCMINtitlevspace{2\baselineskip}%
    % conferences and technotes need tighter spacing
    \ifCLASSOPTIONconference%conference
     \def\@TSoCNORMtitlevspace{1\baselineskip}%
     \def\@TSoCMINtitlevspace{0.75\baselineskip}%
    \fi
    \ifCLASSOPTIONtechnote%technote
      \def\@TSoCNORMtitlevspace{1\baselineskip}%
      \def\@TSoCMINtitlevspace{0.75\baselineskip}%
    \fi%
    % get the height that the title will take up
    \ifCLASSOPTIONpeerreview
       \settoheight{\@TSoCmaintextheight}{\vbox{\hsize\textwidth \@TSoCpeerreviewmaketitle}}%
    \else
       \settoheight{\@TSoCmaintextheight}{\vbox{\hsize\textwidth \@maketitle}}%
    \fi
    \@TSoCmaintextheight=-\@TSoCmaintextheight% title takes away from maintext, so reverse sign
    % add the height of the page textheight
    \advance\@TSoCmaintextheight by \textheight%
    % correct for title pages using pubid
    \ifCLASSOPTIONpeerreview\else
       % peerreview papers use the pubid on the cover page only.
       % And the cover page uses a static spacer.
       \if@TSoCusingpubid\advance\@TSoCmaintextheight by -\@TSoCpubidpullup\fi
    \fi%
    % subtract off the nominal value of the title bottom spacer
    \advance\@TSoCmaintextheight by -\@TSoCNORMtitlevspace%
    % \topskip takes away some too
    \advance\@TSoCmaintextheight by -\topskip%
    % calculate the column height of the main text for lines
    % now we calculate the main text height as if holding
    % an integer number of \normalsize lines after the first
    % and discard any excess fractional remainder
    % we subtracted the first line, because the first line
    % is placed \topskip into the maintext, not \baselineskip like the
    % rest of the lines.
    \@TSoCINTmaintextheight=\@TSoCmaintextheight%
    \divide\@TSoCINTmaintextheight  by \baselineskip%
    \multiply\@TSoCINTmaintextheight  by \baselineskip%
    % now we calculate how much the title spacer height will
    % have to be reduced from nominal (\@TSoCREDUCEmaintextheight is always
    % a positive value) so that the maintext area will contain an integer
    % number of normal size lines
    % we change variable names here (to avoid confusion) as we no longer
    % need \@TSoCINTmaintextheight and can reuse its dimen register
    \let\@TSoCREDUCEmaintextheight=\@TSoCINTmaintextheight%
    \advance\@TSoCREDUCEmaintextheight by -\@TSoCmaintextheight%
    \advance\@TSoCREDUCEmaintextheight by \baselineskip%
    % this is the calculated height of the spacer
    % we change variable names here (to avoid confusion) as we no longer
    % need \@TSoCmaintextheight and can reuse its dimen register
    \let\@TSoCCOMPENSATElen=\@TSoCmaintextheight%
    \@TSoCCOMPENSATElen=\@TSoCNORMtitlevspace% set the nominal value
    % we go with the reduced length if it is smaller than an increase
    \ifdim\@TSoCREDUCEmaintextheight < 0.5\baselineskip\relax%
     \advance\@TSoCCOMPENSATElen by -\@TSoCREDUCEmaintextheight%
     % if the resulting spacer is too small back out and go with an increase instead
     \ifdim\@TSoCCOMPENSATElen<\@TSoCMINtitlevspace\relax%
      \advance\@TSoCCOMPENSATElen by \baselineskip%
     \fi%
    \else%
     % go with an increase because it is closer to the nominal than a decrease
     \advance\@TSoCCOMPENSATElen by -\@TSoCREDUCEmaintextheight%
     \advance\@TSoCCOMPENSATElen by \baselineskip%
    \fi%
    % set the calculated rigid spacer
    \vspace{\@TSoCCOMPENSATElen}}}



% V1.6
% we allow the user access to the last part of the title area
% useful in emergencies such as when a different spacing is needed
% This text is NOT compensated for in the dynamic sizer.
\let\@TSoCaftertitletext=\relax
\long\def\TSoCaftertitletext#1{\def\@TSoCaftertitletext{#1}}


% V1.7 provide a way for users to enter abstract and keywords
% into the onecolumn title are. This text is compensated for
% in the dynamic sizer.
\let\@TSoCtitleabstractindextext=\relax
\long\def\TSoCtitleabstractindextext#1{\def\@TSoCtitleabstractindextext{#1}}
% V1.7 provide a way for users to get the \@TSoCtitleabstractindextext if
% not in compsoc or transmag journal mode - this way abstract and keywords
% can still be placed in their conventional position if not in those modes.
\def\TSoCdisplaynontitleabstractindextext{%
% display for all conference formats
\ifCLASSOPTIONconference\@TSoCtitleabstractindextext\relax
\else% non-conferences
  \ifCLASSOPTIONcompsoc% display if not compsoc and not transmag
  \else
    \ifCLASSOPTIONtransmag
    \else% not compsoc journal nor transmag journal
       \@TSoCtitleabstractindextext\relax
    \fi
  \fi
\fi}


% command to allow alteration of baselinestretch, but only if the current
% baselineskip is unity. Used to tweak the compsoc abstract and keywords line spacing.
\def\@TSoCtweakunitybaselinestretch#1{{\def\baselinestretch{1}\selectfont
\global\@tempskipa\baselineskip}\ifnum\@tempskipa=\baselineskip%
\def\baselinestretch{#1}\selectfont\fi\relax}


% abstract and keywords are in \small, except 
% for 9pt docs in which they are in \footnotesize
% Because 9pt docs use an 8pt footnotesize, \small
% becomes a rather awkward 8.5pt
\def\@TSoCabskeysecsize{\small}
\ifx\CLASSOPTIONpt\@TSoCptsizenine
 \def\@TSoCabskeysecsize{\footnotesize}
\fi

% compsoc journals use \footnotesize, compsoc conferences use normalsize
\@TSoCcompsoconly{\def\@TSoCabskeysecsize{\footnotesize}}
\@TSoCcompsocconfonly{\def\@TSoCabskeysecsize{\normalsize}}




% V1.6 have abstract and keywords strip leading spaces, pars and newlines
% so that spacing is more tightly controlled.
\def\abstract{\normalfont
    \if@twocolumn
      \@TSoCabskeysecsize\bfseries\textit{\abstractname}---\relax
    \else
      \bgroup\par\addvspace{0.5\baselineskip}\centering\vspace{-1.78ex}\@TSoCabskeysecsize\textbf{\abstractname}\par\addvspace{0.5\baselineskip}\egroup\quotation\@TSoCabskeysecsize
    \fi\@TSoCgobbleleadPARNLSP}
% V1.6 TSoC wants only 1 pica from end of abstract to introduction heading when in 
% conference mode (the heading already has this much above it)
\def\endabstract{\relax\ifCLASSOPTIONconference\vspace{0ex}\else\vspace{1.34ex}\fi\par\if@twocolumn\else\endquotation\fi
    \normalfont\normalsize}

\def\TSoCkeywords{\normalfont
    \if@twocolumn
      \@TSoCabskeysecsize\bfseries\textit{\TSoCkeywordsname}---\relax
    \else
      \bgroup\par\addvspace{0.5\baselineskip}\centering\@TSoCabskeysecsize\textbf{\TSoCkeywordsname}\par\addvspace{0.5\baselineskip}\egroup\quotation\@TSoCabskeysecsize
    \fi\@TSoCgobbleleadPARNLSP}
\def\endTSoCkeywords{\relax\ifCLASSOPTIONtechnote\vspace{1.34ex}\else\vspace{0.67ex}\fi
    \par\if@twocolumn\else\endquotation\fi%
    \normalfont\normalsize}

% V1.7 compsoc keywords index terms
\ifCLASSOPTIONcompsoc
  \ifCLASSOPTIONconference% compsoc conference
\def\abstract{\normalfont
      \bgroup\par\addvspace{0.5\baselineskip}\centering\@TSoCabskeysecsize\textbf{\large\abstractname}\par\addvspace{0.5\baselineskip}\egroup\vskip 0.5\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip
      \if@twocolumn\else\quotation\fi\itshape\@TSoCabskeysecsize%
      \par\@TSoCgobbleleadPARNLSP}
\def\TSoCkeywords{\normalfont\vskip 1.5\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip
      \bgroup\par\addvspace{0.5\baselineskip}\centering\@TSoCabskeysecsize\textbf{\large\TSoCkeywordsname}\par\addvspace{0.5\baselineskip}\egroup\vskip 0.5\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip
      \if@twocolumn\else\quotation\fi\itshape\@TSoCabskeysecsize%
      \par\@TSoCgobbleleadPARNLSP}
  \else% compsoc not conference
\def\abstract{\normalfont\@TSoCtweakunitybaselinestretch{1.15}\sffamily
    \if@twocolumn
      \@TSoCabskeysecsize\noindent\textbf{\abstractname}---\relax
    \else
      \bgroup\par\addvspace{0.5\baselineskip}\centering\vspace{-1.78ex}\@TSoCabskeysecsize\textbf{\abstractname}\par\addvspace{0.5\baselineskip}\egroup\quotation\@TSoCabskeysecsize%
    \fi\@TSoCgobbleleadPARNLSP}
\def\TSoCkeywords{\normalfont\@TSoCtweakunitybaselinestretch{1.15}\sffamily
    \if@twocolumn
      \@TSoCabskeysecsize\vskip 0.5\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip\noindent
      \textbf{\TSoCkeywordsname}---\relax
    \else
      \bgroup\par\addvspace{0.5\baselineskip}\centering\@TSoCabskeysecsize\textbf{\TSoCkeywordsname}\par\addvspace{0.5\baselineskip}\egroup\quotation\@TSoCabskeysecsize%
    \fi\@TSoCgobbleleadPARNLSP}
  \fi
\fi

% V1.8 transmag keywords index terms
% no abstract name, use indentation
\ifCLASSOPTIONtransmag
\def\abstract{\normalfont\parindent 1em\relax
    \if@twocolumn
      \@TSoCabskeysecsize\bfseries\indent
    \else
      \bgroup\par\addvspace{0.5\baselineskip}\centering\vspace{-1.78ex}\@TSoCabskeysecsize
      \textbf{\abstractname}\par\addvspace{0.5\baselineskip}\egroup\quotation\@TSoCabskeysecsize
    \fi\@TSoCgobbleleadPARNLSP}

\def\TSoCkeywords{\normalfont\parindent 1em\relax
    \if@twocolumn
      \@TSoCabskeysecsize\vspace{1\baselineskip}\bfseries\indent\textit{\TSoCkeywordsname}---\relax
    \else
      \bgroup\par\vspace{1\baselineskip}\centering\@TSoCabskeysecsize
      \textbf{\TSoCkeywordsname}\par\addvspace{0.5\baselineskip}\egroup\quotation\@TSoCabskeysecsize
    \fi\@TSoCgobbleleadPARNLSP}
\fi



% gobbles all leading \, \\ and \par, upon finding first token that
% is not a \ , \\ or a \par, it ceases and returns that token
% 
% used to strip leading \, \\ and \par from the input
% so that such things in the beginning of an environment will not
% affect the formatting of the text
\long\def\@TSoCgobbleleadPARNLSP#1{\let\@TSoCswallowthistoken=0%
\let\@TSoCgobbleleadPARNLSPtoken#1%
\let\@TSoCgobbleleadPARtoken=\par%
\let\@TSoCgobbleleadNLtoken=\\%
\let\@TSoCgobbleleadSPtoken=\ %
\def\@TSoCgobbleleadSPMACRO{\ }%
\ifx\@TSoCgobbleleadPARNLSPtoken\@TSoCgobbleleadPARtoken%
\let\@TSoCswallowthistoken=1%
\fi%
\ifx\@TSoCgobbleleadPARNLSPtoken\@TSoCgobbleleadNLtoken%
\let\@TSoCswallowthistoken=1%
\fi%
\ifx\@TSoCgobbleleadPARNLSPtoken\@TSoCgobbleleadSPtoken%
\let\@TSoCswallowthistoken=1%
\fi%
% a control space will come in as a macro
% when it is the last one on a line
\ifx\@TSoCgobbleleadPARNLSPtoken\@TSoCgobbleleadSPMACRO%
\let\@TSoCswallowthistoken=1%
\fi%
% if we have to swallow this token, do so and taste the next one
% else spit it out and stop gobbling
\ifx\@TSoCswallowthistoken 1\let\@TSoCnextgobbleleadPARNLSP=\@TSoCgobbleleadPARNLSP\else%
\let\@TSoCnextgobbleleadPARNLSP=#1\fi%
\@TSoCnextgobbleleadPARNLSP}%




% TITLING OF SECTIONS
\def\@TSoCsectpunct{:\ \,}  % Punctuation after run-in section heading  (headings which are
                            % part of the paragraphs), need little bit more than a single space
                            % spacing from section number to title
% compsoc conferences use regular period/space punctuation
\ifCLASSOPTIONcompsoc
\ifCLASSOPTIONconference
\def\@TSoCsectpunct{.\ }
\fi\fi


\def\@seccntformat#1{\csname the#1dis\endcsname\hskip 0.5em\relax}

\ifCLASSOPTIONcompsoc
% compsoc journals need extra spacing
\ifCLASSOPTIONconference\else
\def\@seccntformat#1{\csname the#1dis\endcsname\hskip 1em\relax}
\fi\fi

%v1.7 put {} after #6 to allow for some types of user font control
%and use \@@par rather than \par
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
     \let\@svsec\@empty
  \else
     \refstepcounter{#1}%
     % load section label and spacer into \@svsec
     \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi%
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@% tempskipa determines whether is treated as a high
     \begingroup #6{\relax% or low level heading
      \noindent % subsections are NOT indented
       % print top level headings. \@svsec is label, #8 is heading title
       % TSoC does not block indent the section title text, it flows like normal
       {\hskip #3\relax\@svsec}{\interlinepenalty \@M #8\@@par}}%
     \endgroup
     \addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth\relax\else
               \protect\numberline{\csname the#1\endcsname}\fi#7}%
  \else % printout low level headings
     % svsechd seems to swallow the trailing space, protect it with \mbox{}
     % got rid of sectionmark stuff
     \def\@svsechd{#6{\hskip #3\relax\@svsec #8\@TSoCsectpunct\mbox{}}%
     \addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth\relax\else
               \protect\numberline{\csname the#1\endcsname}\fi#7}}%
  \fi%skip down
  \@xsect{#5}}


% section* handler
%v1.7 put {} after #4 to allow for some types of user font control
%and use \@@par rather than \par
\def\@ssect#1#2#3#4#5{\@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
     %\begingroup #4\@hangfrom{\hskip #1}{\interlinepenalty \@M #5\par}\endgroup
     % TSoC does not block indent the section title text, it flows like normal
     \begingroup \noindent #4{\relax{\hskip #1}{\interlinepenalty \@M #5\@@par}}\endgroup
  % svsechd swallows the trailing space, protect it with \mbox{}
  \else \def\@svsechd{#4{\hskip #1\relax #5\@TSoCsectpunct\mbox{}}}\fi
  \@xsect{#3}}


%% SECTION heading spacing and font
%%
% arguments are: #1 - sectiontype name
% (for \@sect)   #2 - section level
%                #3 - section heading indent
%                #4 - top separation (absolute value used, neg indicates not to indent main text)
%                     If negative, make stretch parts negative too!
%                #5 - (absolute value used) positive: bottom separation after heading,
%                      negative: amount to indent main text after heading
%                Both #4 and #5 negative means to indent main text and use negative top separation
%                #6 - font control
% You've got to have \normalfont\normalsize in the font specs below to prevent
% trouble when you do something like:
% \section{Note}{\ttfamily TT-TEXT} is known to ... 
% TSoC sometimes REALLY stretches the area before a section
% heading by up to about 0.5in. However, it may not be a good
% idea to let LaTeX have quite this much rubber.
\ifCLASSOPTIONjournal%
% TSoC wants section heading spacing to decrease for conference mode
\def\section{\@startsection{section}{1}{\z@}{30pt}%
{12pt}{\normalfont\normalsize\centering\scshape}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{12pt}%
{6pt}{\normalfont\normalsize\itshape}}%
\else % for journals
\def\section{\@startsection{section}{1}{\z@}{3.0ex plus 1.5ex minus 1.5ex}% V1.6 3.0ex from 3.5ex
{0.7ex plus 1ex minus 0ex}{\normalfont\normalsize\centering\scshape}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{3.5ex plus 1.5ex minus 1.5ex}%
{0.7ex plus .5ex minus 0ex}{\normalfont\normalsize\itshape}}%
\fi

% for both journals and conferences
% decided to put in a little rubber above the section, might help somebody
\def\subsubsection{\@startsection{subsubsection}{3}{\parindent}{6pt}%
{0pt}{\normalfont\normalsize\itshape}}%
\def\paragraph{\@startsection{paragraph}{4}{2\parindent}{0ex plus 0.1ex minus 0.1ex}%
{0ex}{\normalfont\normalsize\itshape}}%


% compsoc
\ifCLASSOPTIONcompsoc
\ifCLASSOPTIONconference
% compsoc conference
\def\section{\@startsection{section}{1}{\z@}{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}%
{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}{\normalfont\large\bfseries}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}%
{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}{\normalfont\sublargesize\bfseries}}%
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}%
{0ex}{\normalfont\normalsize\bfseries}}%
\def\paragraph{\@startsection{paragraph}{4}{2\parindent}{0ex plus 0.1ex minus 0.1ex}%
{0ex}{\normalfont\normalsize}}%
\else% compsoc journals
% use negative top separation as compsoc journals do not indent paragraphs after section titles
\def\section{\@startsection{section}{1}{\z@}{-3ex plus -2ex minus -1.5ex}%
{0.7ex plus 1ex minus 0ex}{\normalfont\large\sffamily\bfseries\scshape}}%
% Note that subsection and smaller may not be correct for the Computer Society,
% I have to look up an example.
\def\subsection{\@startsection{subsection}{2}{\z@}{-3.5ex plus -1.5ex minus -1.5ex}%
{0.7ex plus .5ex minus 0ex}{\normalfont\normalsize\sffamily\bfseries}}%
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-2.5ex plus -1ex minus -1ex}%
{0.5ex plus 0.5ex minus 0ex}{\normalfont\normalsize\sffamily\itshape}}%
\def\paragraph{\@startsection{paragraph}{4}{2\parindent}{-0ex plus -0.1ex minus -0.1ex}%
{0ex}{\normalfont\normalsize}}%
\fi\fi

% transmag
\ifCLASSOPTIONtransmag
\def\subsection{\@startsection{subsection}{2}{0.75\parindent}{3.5ex plus 1.5ex minus 1.5ex}%
{0.7ex plus .5ex minus 0ex}{\normalfont\normalsize\itshape}}%
\def\subsubsection{\@startsection{subsubsection}{3}{1.25\parindent}{0.1ex plus 0.1ex minus 0.1ex}%
{0.1ex}{\normalfont\normalsize\itshape}}%
\fi


%% ENVIRONMENTS
% "box" symbols at end of proofs
\def\TSoCQEDclosed{\mbox{\rule[0pt]{1.3ex}{1.3ex}}} % for a filled box
% V1.6 some journals use an open box instead that will just fit around a closed one
\def\TSoCQEDopen{{\setlength{\fboxsep}{0pt}\setlength{\fboxrule}{0.2pt}\fbox{\rule[0pt]{0pt}{1.3ex}\rule[0pt]{1.3ex}{0pt}}}}
\ifCLASSOPTIONcompsoc
\def\TSoCQED{\TSoCQEDopen}   % default to open for compsoc
\else
\def\TSoCQED{\TSoCQEDclosed} % otherwise default to closed
\fi

%V1.8 flag to indicate if QED symbol is to be shown
\newif\if@TSoCQEDshow  \@TSoCQEDshowtrue
\def\TSoCproofindentspace{2\parindent}% V1.8 allow user to change indentation amount if desired
% v1.7 name change to avoid namespace collision with amsthm. Also add support
% for an optional argument.
\def\TSoCproof{\@ifnextchar[{\@TSoCproof}{\@TSoCproof[\TSoCproofname]}}
\def\@TSoCproof[#1]{\@TSoCQEDshowtrue\par\noindent\hspace{\TSoCproofindentspace}{\itshape #1: }}
\def\endTSoCproof{\if@TSoCQEDshow\hspace*{\fill}\nobreakspace\TSoCQED\fi\par}
% qedhere for equation environments, similar to AMS \qedhere
\def\TSoCQEDhereeqn{\global\@TSoCQEDshowfalse\eqno\let\eqno\relax\let\leqno\relax
                    \let\veqno\relax\hbox{\TSoCQED}}
% TSoC style qedhere for TSoCeqnarray and other environments
\def\TSoCQEDhere{\global\@TSoCQEDshowfalse\TSoCQED}
% command to disable QED at end of TSoCproof
\def\TSoCQEDoff{\global\@TSoCQEDshowfalse}


%\itemindent is set to \z@ by list, so define new temporary variable
\newdimen\@TSoCtmpitemindent

% V1.8 allow long theorem names to break across lines.
% Thanks to Miquel Payaro for reporting this.
\def\@begintheorem#1#2{\@TSoCtmpitemindent\itemindent\relax\topsep 0pt\rmfamily\trivlist%
    \item[]\textit{\indent #1\ #2:} \itemindent\@TSoCtmpitemindent\relax}
\def\@opargbegintheorem#1#2#3{\@TSoCtmpitemindent\itemindent\relax\topsep 0pt\rmfamily \trivlist%
% V1.6 TSoC is back to using () around theorem names which are also in italics
% Thanks to Christian Peel for reporting this.
    \item[]\textit{\indent #1\ #2\ (#3):} \itemindent\@TSoCtmpitemindent\relax}
% V1.7 remove bogus \unskip that caused equations in theorems to collide with
% lines below.
\def\@endtheorem{\endtrivlist}

% V1.6
% display command for the section the theorem is in - so that \thesection
% is not used as this will be in Roman numerals when we want arabic.
% LaTeX2e uses \def\@thmcounter#1{\noexpand\arabic{#1}} for the theorem number
% (second part) display and \def\@thmcountersep{.} as a separator.
% V1.7 intercept calls to the section counter and reroute to \@TSoCthmcounterinsection
% to allow \appendix(ices} to override as needed.
%
% special handler for sections, allows appendix(ices) to override
\gdef\@TSoCthmcounterinsection#1{\arabic{#1}}
% string macro
\edef\@TSoCstringsection{section}

% redefine the #1#2[#3] form of newtheorem to use a hook to \@TSoCthmcounterinsection
% if section in_counter is used
\def\@xnthm#1#2[#3]{%
  \expandafter\@ifdefinable\csname #1\endcsname
    {\@definecounter{#1}\@newctr{#1}[#3]%
     \edef\@TSoCstringtmp{#3}
     \ifx\@TSoCstringtmp\@TSoCstringsection
     \expandafter\xdef\csname the#1\endcsname{%
     \noexpand\@TSoCthmcounterinsection{#3}\@thmcountersep
          \@thmcounter{#1}}%
     \else
     \expandafter\xdef\csname the#1\endcsname{%
       \expandafter\noexpand\csname the#3\endcsname \@thmcountersep
          \@thmcounter{#1}}%
     \fi
     \global\@namedef{#1}{\@thm{#1}{#2}}%
     \global\@namedef{end#1}{\@endtheorem}}}



%% SET UP THE DEFAULT PAGESTYLE
\ps@headings
\pagenumbering{arabic}

% normally the page counter starts at 1
\setcounter{page}{1}
% however, for peerreview the cover sheet is page 0 or page -1
% (for duplex printing)
\ifCLASSOPTIONpeerreview
   \if@twoside
      \setcounter{page}{-1}
   \else
      \setcounter{page}{0}
   \fi
\fi

% standard book class behavior - let bottom line float up and down as
% needed when single sided
\ifCLASSOPTIONtwoside\else\raggedbottom\fi
% if two column - turn on twocolumn, allow word spacings to stretch more and
% enforce a rigid position for the last lines
\ifCLASSOPTIONtwocolumn
% the peer review option delays invoking twocolumn
   \ifCLASSOPTIONpeerreview\else
      \twocolumn
   \fi
\sloppy 
\flushbottom
\fi




% \APPENDIX and \APPENDICES definitions

% This is the \@ifmtarg command from the LaTeX ifmtarg package
% by Peter Wilson (CUA) and Donald Arseneau
% \@ifmtarg is used to determine if an argument to a command
% is present or not.
% For instance:
% \@ifmtarg{#1}{\typeout{empty}}{\typeout{has something}}
% \@ifmtarg is used with our redefined \section command if
% \appendices is invoked.
% The command \section will behave slightly differently depending
% on whether the user specifies a title: 
% \section{My appendix title}
% or not:
% \section{}
% This way, we can eliminate the blank lines where the title
% would be, and the unneeded : after Appendix in the table of
% contents 
\begingroup
\catcode`\Q=3
\long\gdef\@ifmtarg#1{\@xifmtarg#1QQ\@secondoftwo\@firstoftwo\@nil}
\long\gdef\@xifmtarg#1#2Q#3#4#5\@nil{#4}
\endgroup
% end of \@ifmtarg defs


% V1.7
% command that allows the one time saving of the original definition
% of section to \@TSoCappendixsavesection for \appendix or \appendices 
% we don't save \section here as it may be redefined later by other
% packages (hyperref.sty, etc.)
\def\@TSoCsaveoriginalsectiononce{\let\@TSoCappendixsavesection\section
\let\@TSoCsaveoriginalsectiononce\relax}

% neat trick to grab and process the argument from \section{argument}
% we process differently if the user invoked \section{} with no
% argument (title)
% note we reroute the call to the old \section*
\def\@TSoCprocessthesectionargument#1{%
\@ifmtarg{#1}{%
\@TSoCappendixsavesection*{\appendixname\nobreakspace\thesectiondis}%
\addcontentsline{toc}{section}{\appendixname\nobreakspace\thesection}}{%
\@TSoCappendixsavesection*{\appendixname\nobreakspace\thesectiondis\\* #1}%
\addcontentsline{toc}{section}{\appendixname\nobreakspace\thesection: #1}}}

% we use this if the user calls \section{} after
% \appendix-- which has no meaning. So, we ignore the
% command and its argument. Then, warn the user.
\def\@TSoCdestroythesectionargument#1{\typeout{** WARNING: Ignoring useless
\protect\section\space in Appendix (line \the\inputlineno).}}


% remember \thesection forms will be displayed in \ref calls
% and in the Table of Contents.
% The \sectiondis form is used in the actual heading itself

% appendix command for one single appendix
% normally has no heading. However, if you want a 
% heading, you can do so via the optional argument:
% \appendix[Optional Heading]
\def\appendix{\relax}
\renewcommand{\appendix}[1][]{\@TSoCsaveoriginalsectiononce\par
    % v1.6 keep hyperref's identifiers unique
    \gdef\theHsection{Appendix.A}%
    % v1.6 adjust hyperref's string name for the section
    \xdef\Hy@chapapp{appendix}%
    \setcounter{section}{0}%
    \setcounter{subsection}{0}%
    \setcounter{subsubsection}{0}%
    \setcounter{paragraph}{0}%
    \gdef\thesection{A}%
    \gdef\thesectiondis{}% 
    \gdef\thesubsection{\Alph{subsection}}%
    \gdef\@TSoCthmcounterinsection##1{A}
    \refstepcounter{section}% update the \ref counter
    \@ifmtarg{#1}{\@TSoCappendixsavesection*{\appendixname}%
                  \addcontentsline{toc}{section}{\appendixname}}{%
             \@TSoCappendixsavesection*{\appendixname\nobreakspace\\* #1}%
             \addcontentsline{toc}{section}{\appendixname: #1}}%
    % redefine \section command for appendix
    % leave \section* as is
    \def\section{\@ifstar{\@TSoCappendixsavesection*}{%
                    \@TSoCdestroythesectionargument}}% throw out the argument
                                                     % of the normal form
}



% appendices command for multiple appendices
% user then calls \section with an argument (possibly empty) to
% declare the individual appendices
\def\appendices{\@TSoCsaveoriginalsectiononce\par
    % v1.6 keep hyperref's identifiers unique
    \gdef\theHsection{Appendix.\Alph{section}}%
    % v1.6 adjust hyperref's string name for the section
    \xdef\Hy@chapapp{appendix}%
    \setcounter{section}{-1}% we want \refstepcounter to use section 0
    \setcounter{subsection}{0}%
    \setcounter{subsubsection}{0}%
    \setcounter{paragraph}{0}%
    \ifCLASSOPTIONromanappendices%
    \gdef\thesection{\Roman{section}}%
    \gdef\thesectiondis{\Roman{section}}%
    \@TSoCcompsocconfonly{\gdef\thesectiondis{\Roman{section}.}}%
    \gdef\@TSoCthmcounterinsection##1{A\arabic{##1}}
    \else%
    \gdef\thesection{\Alph{section}}%
    \gdef\thesectiondis{\Alph{section}}%
    \@TSoCcompsocconfonly{\gdef\thesectiondis{\Alph{section}.}}%
    \gdef\@TSoCthmcounterinsection##1{\Alph{##1}}
    \fi%
    \refstepcounter{section}% update the \ref counter
    \setcounter{section}{0}% NEXT \section will be the FIRST appendix
    % redefine \section command for appendices
    % leave \section* as is
    \def\section{\@ifstar{\@TSoCappendixsavesection*}{% process the *-form
                    \refstepcounter{section}% or is a new section so,
                    \@TSoCprocessthesectionargument}}% process the argument 
                                                 % of the normal form
}



% \TSoCPARstart
% Definition for the big two line drop cap letter at the beginning of the
% first paragraph of journal papers. The first argument is the first letter
% of the first word, the second argument is the remaining letters of the
% first word which will be rendered in upper case.
% In V1.6 this has been completely rewritten to:
% 
% 1. no longer have problems when the user begins an environment
%    within the paragraph that uses \TSoCPARstart.
% 2. auto-detect and use the current font family
% 3. revise handling of the space at the end of the first word so that
%    interword glue will now work as normal.
% 4. produce correctly aligned edges for the (two) indented lines.
% 
% We generalize things via control macros - playing with these is fun too.
% 
% V1.7 added more control macros to make it easy for TSoCtrantools.sty users
% to change the font style.
% 
% the number of lines that are indented to clear it
% may need to increase if using decenders
\def\@TSoCPARstartDROPLINES{2}
% minimum number of lines left on a page to allow a \@TSoCPARstart
% Does not take into consideration rubber shrink, so it tends to
% be overly cautious
\def\@TSoCPARstartMINPAGELINES{2}
% V1.7 the height of the drop cap is adjusted to match the height of this text
% in the current font (when \TSoCPARstart is called).
\def\@TSoCPARstartHEIGHTTEXT{T}
% the depth the letter is lowered below the baseline
% the height (and size) of the letter is determined by the sum
% of this value and the height of the \@TSoCPARstartHEIGHTTEXT in the current
% font. It is a good idea to set this value in terms of the baselineskip
% so that it can respond to changes therein.
\def\@TSoCPARstartDROPDEPTH{1.1\baselineskip}
% V1.7 the font the drop cap will be rendered in,
% can take zero or one argument.
\def\@TSoCPARstartFONTSTYLE{\bfseries}
% V1.7 any additional, non-font related commands needed to modify
% the drop cap letter, can take zero or one argument.
\def\@TSoCPARstartCAPSTYLE{\MakeUppercase}
% V1.7 the font that will be used to render the rest of the word,
% can take zero or one argument.
\def\@TSoCPARstartWORDFONTSTYLE{\relax}
% V1.7 any additional, non-font related commands needed to modify
% the rest of the word, can take zero or one argument.
\def\@TSoCPARstartWORDCAPSTYLE{\MakeUppercase}
% This is the horizontal separation distance from the drop letter to the main text.
% Lengths that depend on the font (e.g., ex, em, etc.) will be referenced
% to the font that is active when \TSoCPARstart is called. 
\def\@TSoCPARstartSEP{0.15em}
% V1.7 horizontal offset applied to the left of the drop cap.
\def\@TSoCPARstartHOFFSET{0em}
% V1.7 Italic correction command applied at the end of the drop cap.
\def\@TSoCPARstartITLCORRECT{\/}

% V1.7 compoc uses nonbold drop cap and small caps word style
\ifCLASSOPTIONcompsoc
\def\@TSoCPARstartFONTSTYLE{\mdseries}
\def\@TSoCPARstartWORDFONTSTYLE{\scshape}
\def\@TSoCPARstartWORDCAPSTYLE{\relax}
\fi

% definition of \TSoCPARstart
% THIS IS A CONTROLLED SPACING AREA, DO NOT ALLOW SPACES WITHIN THESE LINES
% 
% The token \@TSoCPARstartfont will be globally defined after the first use
% of \TSoCPARstart and will be a font command which creates the big letter
% The first argument is the first letter of the first word and the second
% argument is the rest of the first word(s).
\def\TSoCPARstart#1#2{\par{%
% if this page does not have enough space, break it and lets start
% on a new one
\@TSoCtranneedspace{\@TSoCPARstartMINPAGELINES\baselineskip}{\relax}%
% V1.7 move this up here in case user uses \textbf for \@TSoCPARstartFONTSTYLE
% which uses command \leavevmode which causes an unwanted \indent to be issued
\noindent
% calculate the desired height of the big letter
% it extends from the top of \@TSoCPARstartHEIGHTTEXT in the current font
% down to \@TSoCPARstartDROPDEPTH below the current baseline
\settoheight{\@TSoCtrantmpdimenA}{\@TSoCPARstartHEIGHTTEXT}%
\addtolength{\@TSoCtrantmpdimenA}{\@TSoCPARstartDROPDEPTH}%
% extract the name of the current font in bold
% and place it in \@TSoCPARstartFONTNAME
\def\@TSoCPARstartGETFIRSTWORD##1 ##2\relax{##1}%
{\@TSoCPARstartFONTSTYLE{\selectfont\edef\@TSoCPARstartFONTNAMESPACE{\fontname\font\space}%
\xdef\@TSoCPARstartFONTNAME{\expandafter\@TSoCPARstartGETFIRSTWORD\@TSoCPARstartFONTNAMESPACE\relax}}}%
% define a font based on this name with a point size equal to the desired
% height of the drop letter
\font\@TSoCPARstartsubfont\@TSoCPARstartFONTNAME\space at \@TSoCtrantmpdimenA\relax%
% save this value as a counter (integer) value (sp points)
\@TSoCtrantmpcountA=\@TSoCtrantmpdimenA%
% now get the height of the actual letter produced by this font size
\settoheight{\@TSoCtrantmpdimenB}{\@TSoCPARstartsubfont\@TSoCPARstartCAPSTYLE{#1}}%
% If something bogus happens like the first argument is empty or the
% current font is strange, do not allow a zero height.
\ifdim\@TSoCtrantmpdimenB=0pt\relax%
\typeout{** WARNING: TSoCPARstart drop letter has zero height! (line \the\inputlineno)}%
\typeout{ Forcing the drop letter font size to 10pt.}%
\@TSoCtrantmpdimenB=10pt%
\fi%
% and store it as a counter
\@TSoCtrantmpcountB=\@TSoCtrantmpdimenB%
% Since a font size doesn't exactly correspond to the height of the capital
% letters in that font, the actual height of the letter, \@TSoCtrantmpcountB,
% will be less than that desired, \@TSoCtrantmpcountA
% we need to raise the font size, \@TSoCtrantmpdimenA 
% by \@TSoCtrantmpcountA / \@TSoCtrantmpcountB
% But, TeX doesn't have floating point division, so we have to use integer
% division. Hence the use of the counters.
% We need to reduce the denominator so that the loss of the remainder will
% have minimal affect on the accuracy of the result
\divide\@TSoCtrantmpcountB by 200%
\divide\@TSoCtrantmpcountA by \@TSoCtrantmpcountB%
% Then reequalize things when we use TeX's ability to multiply by
% floating point values
\@TSoCtrantmpdimenB=0.005\@TSoCtrantmpdimenA%
\multiply\@TSoCtrantmpdimenB by \@TSoCtrantmpcountA%
% \@TSoCPARstartfont is globaly set to the calculated font of the big letter
% We need to carry this out of the local calculation area to to create the
% big letter.
\global\font\@TSoCPARstartfont\@TSoCPARstartFONTNAME\space at \@TSoCtrantmpdimenB%
% Now set \@TSoCtrantmpdimenA to the width of the big letter
% We need to carry this out of the local calculation area to set the
% hanging indent
\settowidth{\global\@TSoCtrantmpdimenA}{\@TSoCPARstartfont
\@TSoCPARstartCAPSTYLE{#1\@TSoCPARstartITLCORRECT}}}%
% end of the isolated calculation environment
% add in the extra clearance we want
\advance\@TSoCtrantmpdimenA by \@TSoCPARstartSEP\relax%
% add in the optional offset
\advance\@TSoCtrantmpdimenA by \@TSoCPARstartHOFFSET\relax%
% V1.7 don't allow negative offsets to produce negative hanging indents
\@TSoCtrantmpdimenB\@TSoCtrantmpdimenA
\ifnum\@TSoCtrantmpdimenB < 0 \@TSoCtrantmpdimenB 0pt\fi
% \@TSoCtrantmpdimenA has the width of the big letter plus the
% separation space and \@TSoCPARstartfont is the font we need to use
% Now, we make the letter and issue the hanging indent command
% The letter is placed in a box of zero width and height so that other
% text won't be displaced by it.
\hangindent\@TSoCtrantmpdimenB\hangafter=-\@TSoCPARstartDROPLINES%
\makebox[0pt][l]{\hspace{-\@TSoCtrantmpdimenA}%
\raisebox{-\@TSoCPARstartDROPDEPTH}[0pt][0pt]{\hspace{\@TSoCPARstartHOFFSET}%
\@TSoCPARstartfont\@TSoCPARstartCAPSTYLE{#1\@TSoCPARstartITLCORRECT}%
\hspace{\@TSoCPARstartSEP}}}%
{\@TSoCPARstartWORDFONTSTYLE{\@TSoCPARstartWORDCAPSTYLE{\selectfont#2}}}}






% determines if the space remaining on a given page is equal to or greater
% than the specified space of argument one
% if not, execute argument two (only if the remaining space is greater than zero)
% and issue a \newpage
% 
% example: \@TSoCtranneedspace{2in}{\vfill}
% 
% Does not take into consideration rubber shrinkage, so it tends to
% be overly cautious
% Based on an example posted by Donald Arseneau
% Note this macro uses \@TSoCtrantmpdimenB internally for calculations,
% so DO NOT PASS \@TSoCtrantmpdimenB to this routine
% if you need a dimen register, import with \@TSoCtrantmpdimenA instead
\def\@TSoCtranneedspace#1#2{\penalty-100\begingroup%shield temp variable
\@TSoCtrantmpdimenB\pagegoal\advance\@TSoCtrantmpdimenB-\pagetotal% space left
\ifdim #1>\@TSoCtrantmpdimenB\relax% not enough space left
\ifdim\@TSoCtrantmpdimenB>\z@\relax #2\fi%
\newpage%
\fi\endgroup}



% TSoCbiography ENVIRONMENT
% Allows user to enter biography leaving place for picture (adapts to font size)
% As of V1.5, a new optional argument allows you to have a real graphic!
% V1.5 and later also fixes the "colliding biographies" which could happen when a 
% biography's text was shorter than the space for the photo.
% MDS 7/2001
% V1.6 prevent multiple biographies from making multiple TOC entries
\newif\if@TSoCbiographyTOCentrynotmade
\global\@TSoCbiographyTOCentrynotmadetrue

% biography counter so hyperref can jump directly to the biographies
% and not just the previous section
\newcounter{TSoCbiography}
\setcounter{TSoCbiography}{0}

% photo area size
\def\@TSoCBIOphotowidth{1.0in}    % width of the biography photo area
\def\@TSoCBIOphotodepth{1.25in}   % depth (height) of the biography photo area
% area cleared for photo
\def\@TSoCBIOhangwidth{1.14in}    % width cleared for the biography photo area
\def\@TSoCBIOhangdepth{1.25in}    % depth cleared for the biography photo area
                                  % actual depth will be a multiple of 
                                  % \baselineskip, rounded up
\def\@TSoCBIOskipN{4\baselineskip}% nominal value of the vskip above the biography

\newenvironment{TSoCbiography}[2][]{\normalfont\@TSoCcompsoconly{\sffamily}\footnotesize%
\unitlength 1in\parskip=0pt\par\parindent 1em\interlinepenalty500%
% we need enough space to support the hanging indent
% the nominal value of the spacer
% and one extra line for good measure
\@TSoCtrantmpdimenA=\@TSoCBIOhangdepth%
\advance\@TSoCtrantmpdimenA by \@TSoCBIOskipN%
\advance\@TSoCtrantmpdimenA by 1\baselineskip%
% if this page does not have enough space, break it and lets start
% with a new one
\@TSoCtranneedspace{\@TSoCtrantmpdimenA}{\relax}%
% nominal spacer can strech, not shrink use 1fil so user can out stretch with \vfill
\vskip \@TSoCBIOskipN plus 1fil minus 0\baselineskip%
% the default box for where the photo goes
\def\@TSoCtempbiographybox{{\setlength{\fboxsep}{0pt}\framebox{%
\begin{minipage}[b][\@TSoCBIOphotodepth][c]{\@TSoCBIOphotowidth}\centering PLACE\\ PHOTO\\ HERE \end{minipage}}}}%
%
% detect if the optional argument was supplied, this requires the
% \@ifmtarg command as defined in the appendix section above
% and if so, override the default box with what they want
\@ifmtarg{#1}{\relax}{\def\@TSoCtempbiographybox{\mbox{\begin{minipage}[b][\@TSoCBIOphotodepth][c]{\@TSoCBIOphotowidth}%
\centering%
#1%
\end{minipage}}}}% end if optional argument supplied
% Make an entry into the table of contents only if we have not done so before
\if@TSoCbiographyTOCentrynotmade%
% link labels to the biography counter so hyperref will jump
% to the biography, not the previous section
\setcounter{TSoCbiography}{-1}%
\refstepcounter{TSoCbiography}%
\addcontentsline{toc}{section}{Biographies}%
\global\@TSoCbiographyTOCentrynotmadefalse%
\fi%
% one more biography
\refstepcounter{TSoCbiography}%
% Make an entry for this name into the table of contents 
\addcontentsline{toc}{subsection}{#2}%
% V1.6 properly handle if a new paragraph should occur while the
% hanging indent is still active. Do this by redefining \par so
% that it will not start a new paragraph. (But it will appear to the
% user as if it did.) Also, strip any leading pars, newlines, or spaces.
\let\@TSoCBIOORGparCMD=\par% save the original \par command
\edef\par{\hfil\break\indent}% the new \par will not be a "real" \par
\settoheight{\@TSoCtrantmpdimenA}{\@TSoCtempbiographybox}% get height of biography box
\@TSoCtrantmpdimenB=\@TSoCBIOhangdepth%
\@TSoCtrantmpcountA=\@TSoCtrantmpdimenB% countA has the hang depth
\divide\@TSoCtrantmpcountA by \baselineskip%  calculates lines needed to produce the hang depth
\advance\@TSoCtrantmpcountA by 1% ensure we overestimate
% set the hanging indent
\hangindent\@TSoCBIOhangwidth%
\hangafter-\@TSoCtrantmpcountA%
% reference the top of the photo area to the top of a capital T
\settoheight{\@TSoCtrantmpdimenB}{\mbox{T}}%
% set the photo box, give it zero width and height so as not to disturb anything
\noindent\makebox[0pt][l]{\hspace{-\@TSoCBIOhangwidth}\raisebox{\@TSoCtrantmpdimenB}[0pt][0pt]{%
\raisebox{-\@TSoCBIOphotodepth}[0pt][0pt]{\@TSoCtempbiographybox}}}%
% now place the author name and begin the bio text
\noindent\textbf{#2\ }\@TSoCgobbleleadPARNLSP}{\relax\let\par=\@TSoCBIOORGparCMD\par%
% 7/2001 V1.5 detect when the biography text is shorter than the photo area
% and pad the unused area - preventing a collision from the next biography entry
% MDS
\ifnum \prevgraf <\@TSoCtrantmpcountA\relax% detect when the biography text is shorter than the photo
    \advance\@TSoCtrantmpcountA by -\prevgraf% calculate how many lines we need to pad
    \advance\@TSoCtrantmpcountA by -1\relax% we compensate for the fact that we indented an extra line
    \@TSoCtrantmpdimenA=\baselineskip% calculate the length of the padding
    \multiply\@TSoCtrantmpdimenA by \@TSoCtrantmpcountA%
    \noindent\rule{0pt}{\@TSoCtrantmpdimenA}% insert an invisible support strut
\fi%
\par\normalfont}



% V1.6
% added biography without a photo environment
\newenvironment{TSoCbiographynophoto}[1]{%
% Make an entry into the table of contents only if we have not done so before
\if@TSoCbiographyTOCentrynotmade%
% link labels to the biography counter so hyperref will jump
% to the biography, not the previous section
\setcounter{TSoCbiography}{-1}%
\refstepcounter{TSoCbiography}%
\addcontentsline{toc}{section}{Biographies}%
\global\@TSoCbiographyTOCentrynotmadefalse%
\fi%
% one more biography
\refstepcounter{TSoCbiography}%
% Make an entry for this name into the table of contents 
\addcontentsline{toc}{subsection}{#1}%
\normalfont\@TSoCcompsoconly{\sffamily}\footnotesize\interlinepenalty500%
\vskip 4\baselineskip plus 1fil minus 0\baselineskip%
\parskip=0pt\par%
\noindent\textbf{#1\ }\@TSoCgobbleleadPARNLSP}{\relax\par\normalfont}


% provide the user with some old font commands
% got this from article.cls
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}


% SPECIAL PAPER NOTICE COMMANDS
% 
% holds the special notice text
\def\@TSoCspecialpapernotice{\relax}
 
% for special papers, like invited papers, the user can do:
% \TSoCspecialpapernotice{(Invited Paper)} before \maketitle
\def\TSoCspecialpapernotice#1{\ifCLASSOPTIONconference%
\def\@TSoCspecialpapernotice{{\sublargesize\textit{#1}\vspace*{1em}}}%
\else%
\def\@TSoCspecialpapernotice{{\\*[1.5ex]\sublargesize\textit{#1}}\vspace*{-2ex}}%
\fi}




% PUBLISHER ID COMMANDS
% to insert a publisher's ID footer
% V1.6 \TSoCpubid has been changed so that the change in page size and style
% occurs in \maketitle. \TSoCpubid must now be issued prior to \maketitle
% use \TSoCpubidadjcol as before - in the second column of the title page
% These changes allow \maketitle to take the reduced page height into
% consideration when dynamically setting the space between the author 
% names and the maintext.
%
% the amount the main text is pulled up to make room for the
% publisher's ID footer
% TSoC uses about 1.3\baselineskip for journals, 
% dynamic title spacing will clean up the fraction
\def\@TSoCpubidpullup{1.3\baselineskip}
\ifCLASSOPTIONtechnote
% for technotes it must be an integer of baselineskip as there can be no
% dynamic title spacing for two column mode technotes (the title is in the
% in first column) and we should maintain an integer number of lines in the
% second column
% There are some examples (such as older issues of "Transactions on
% Information Theory") in which TSoC really pulls the text off the ID for
% technotes - about 0.55in (or 4\baselineskip). We'll use 2\baselineskip
% and call it even.
\def\@TSoCpubidpullup{2\baselineskip}
\fi

% V1.7 compsoc does not use a pullup
\ifCLASSOPTIONcompsoc
\def\@TSoCpubidpullup{0pt}
\fi

% holds the ID text
\def\@TSoCpubid{\relax}

% flag so \maketitle can tell if \TSoCpubid was called
\newif\if@TSoCusingpubid
\global\@TSoCusingpubidfalse
% issue this command in the page to have the ID at the bottom
% V1.6 use before \maketitle
\def\TSoCpubid#1{\def\@TSoCpubid{#1}\global\@TSoCusingpubidtrue}


% command which will pull up (shorten) the column it is executed in
% to make room for the publisher ID. Place in the second column of
% the title page when using \TSoCpubid
% Is smart enough not to do anything when in single column text or
% if the user hasn't called \TSoCpubid
% currently needed in for the second column of a page with the
% publisher ID. If not needed in future releases, please provide this
% command and define it as \relax for backward compatibility
% v1.6b do not allow command to operate if the peer review option has been 
% selected because \TSoCpubidadjcol will not be on the cover page.
% V1.7 do nothing if compsoc
\def\TSoCpubidadjcol{\ifCLASSOPTIONcompsoc\else\ifCLASSOPTIONpeerreview\else
\if@twocolumn\if@TSoCusingpubid\enlargethispage{-\@TSoCpubidpullup}\fi\fi\fi\fi}

% Special thanks to Peter Wilson, Daniel Luecking, and the other
% gurus at comp.text.tex, for helping me to understand how best to
% implement the TSoCpubid command in LaTeX.



%% Lockout some commands under various conditions

% general purpose bit bucket
\newsavebox{\@TSoCtranrubishbin}

% flags to prevent multiple warning messages
\newif\if@TSoCWARNthanks
\newif\if@TSoCWARNTSoCPARstart
\newif\if@TSoCWARNTSoCbiography
\newif\if@TSoCWARNTSoCbiographynophoto
\newif\if@TSoCWARNTSoCpubid
\newif\if@TSoCWARNTSoCpubidadjcol
\newif\if@TSoCWARNTSoCmembership
\newif\if@TSoCWARNTSoCaftertitletext
\@TSoCWARNthankstrue
\@TSoCWARNTSoCPARstarttrue
\@TSoCWARNTSoCbiographytrue
\@TSoCWARNTSoCbiographynophototrue
\@TSoCWARNTSoCpubidtrue
\@TSoCWARNTSoCpubidadjcoltrue
\@TSoCWARNTSoCmembershiptrue
\@TSoCWARNTSoCaftertitletexttrue


%% Lockout some commands when in various modes, but allow them to be restored if needed
%%
% save commands which might be locked out
% so that the user can later restore them if needed
\let\@TSoCSAVECMDthanks\thanks
\let\@TSoCSAVECMDTSoCPARstart\TSoCPARstart
\let\@TSoCSAVECMDTSoCbiography\TSoCbiography
\let\@TSoCSAVECMDendTSoCbiography\endTSoCbiography
\let\@TSoCSAVECMDTSoCbiographynophoto\TSoCbiographynophoto
\let\@TSoCSAVECMDendTSoCbiographynophoto\endTSoCbiographynophoto
\let\@TSoCSAVECMDTSoCpubid\TSoCpubid
\let\@TSoCSAVECMDTSoCpubidadjcol\TSoCpubidadjcol
\let\@TSoCSAVECMDTSoCmembership\TSoCmembership
\let\@TSoCSAVECMDTSoCaftertitletext\TSoCaftertitletext


% disable \TSoCPARstart when in draft mode
% This may have originally been done because the pre-V1.6 drop letter
% algorithm had problems with a non-unity baselinestretch
% At any rate, it seems too formal to have a drop letter in a draft
% paper.
\ifCLASSOPTIONdraftcls
\def\TSoCPARstart#1#2{#1#2\if@TSoCWARNTSoCPARstart\typeout{** ATTENTION: \noexpand\TSoCPARstart
 is disabled in draft mode (line \the\inputlineno).}\fi\global\@TSoCWARNTSoCPARstartfalse}
\fi
% and for technotes
\ifCLASSOPTIONtechnote
\def\TSoCPARstart#1#2{#1#2\if@TSoCWARNTSoCPARstart\typeout{** WARNING: \noexpand\TSoCPARstart
 is locked out for technotes (line \the\inputlineno).}\fi\global\@TSoCWARNTSoCPARstartfalse}
\fi


% lockout unneeded commands when in conference mode
\ifCLASSOPTIONconference
% when locked out, \thanks, \TSoCbiography, \TSoCbiographynophoto, \TSoCpubid,
% \TSoCmembership and \TSoCaftertitletext will all swallow their given text. 
% \TSoCPARstart will output a normal character instead
% warn the user about these commands only once to prevent the console screen
% from filling up with redundant messages
\def\thanks#1{\if@TSoCWARNthanks\typeout{** WARNING: \noexpand\thanks
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@TSoCWARNthanksfalse}
\def\TSoCPARstart#1#2{#1#2\if@TSoCWARNTSoCPARstart\typeout{** WARNING: \noexpand\TSoCPARstart
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@TSoCWARNTSoCPARstartfalse}


% LaTeX treats environments and commands with optional arguments differently.
% the actual ("internal") command is stored as \\commandname 
% (accessed via \csname\string\commandname\endcsname )
% the "external" command \commandname is a macro with code to determine
% whether or not the optional argument is presented and to provide the 
% default if it is absent. So, in order to save and restore such a command
% we would have to save and restore \\commandname as well. But, if LaTeX
% ever changes the way it names the internal names, the trick would break.
% Instead let us just define a new environment so that the internal
% name can be left undisturbed.
\newenvironment{@TSoCbogusbiography}[2][]{\if@TSoCWARNTSoCbiography\typeout{** WARNING: \noexpand\TSoCbiography
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@TSoCWARNTSoCbiographyfalse%
\setbox\@TSoCtranrubishbin\vbox\bgroup}{\egroup\relax}
% and make biography point to our bogus biography
\let\TSoCbiography=\@TSoCbogusbiography
\let\endTSoCbiography=\end@TSoCbogusbiography

\renewenvironment{TSoCbiographynophoto}[1]{\if@TSoCWARNTSoCbiographynophoto\typeout{** WARNING: \noexpand\TSoCbiographynophoto
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@TSoCWARNTSoCbiographynophotofalse%
\setbox\@TSoCtranrubishbin\vbox\bgroup}{\egroup\relax}

\def\TSoCpubid#1{\if@TSoCWARNTSoCpubid\typeout{** WARNING: \noexpand\TSoCpubid 
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@TSoCWARNTSoCpubidfalse}
\def\TSoCpubidadjcol{\if@TSoCWARNTSoCpubidadjcol\typeout{** WARNING: \noexpand\TSoCpubidadjcol
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@TSoCWARNTSoCpubidadjcolfalse}
\def\TSoCmembership#1{\if@TSoCWARNTSoCmembership\typeout{** WARNING: \noexpand\TSoCmembership
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@TSoCWARNTSoCmembershipfalse}
\def\TSoCaftertitletext#1{\if@TSoCWARNTSoCaftertitletext\typeout{** WARNING: \noexpand\TSoCaftertitletext
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@TSoCWARNTSoCaftertitletextfalse}
\fi


% provide a way to restore the commands that are locked out
\def\TSoCoverridecommandlockouts{%
\typeout{** ATTENTION: Overriding command lockouts (line \the\inputlineno).}%
\let\thanks\@TSoCSAVECMDthanks%
\let\TSoCPARstart\@TSoCSAVECMDTSoCPARstart%
\let\TSoCbiography\@TSoCSAVECMDTSoCbiography%
\let\endTSoCbiography\@TSoCSAVECMDendTSoCbiography%
\let\TSoCbiographynophoto\@TSoCSAVECMDTSoCbiographynophoto%
\let\endTSoCbiographynophoto\@TSoCSAVECMDendTSoCbiographynophoto%
\let\TSoCpubid\@TSoCSAVECMDTSoCpubid%
\let\TSoCpubidadjcol\@TSoCSAVECMDTSoCpubidadjcol%
\let\TSoCmembership\@TSoCSAVECMDTSoCmembership%
\let\TSoCaftertitletext\@TSoCSAVECMDTSoCaftertitletext}



% need a backslash character for typeout output
{\catcode`\|=0 \catcode`\\=12
|xdef|@TSoCbackslash{\}}


% hook to allow easy disabling of all legacy warnings
\def\@TSoClegacywarn#1#2{\typeout{** ATTENTION: \@TSoCbackslash #1 is deprecated (line \the\inputlineno).
Use \@TSoCbackslash #2 instead.}}


% provide some legacy TSoCtran commands
\def\authorblockA{\@TSoClegacywarn{authorblockA}{TSoCauthorblockA}\TSoCauthorblockA}
\def\authorblockN{\@TSoClegacywarn{authorblockN}{TSoCauthorblockN}\TSoCauthorblockN}
\def\authorrefmark{\@TSoClegacywarn{authorrefmark}{TSoCauthorrefmark}\TSoCauthorrefmark}
\def\PARstart{\@TSoClegacywarn{PARstart}{TSoCPARstart}\TSoCPARstart}
\def\pubid{\@TSoClegacywarn{pubid}{TSoCpubid}\TSoCpubid}
\def\pubidadjcol{\@TSoClegacywarn{pubidadjcol}{TSoCpubidadjcol}\TSoCpubidadjcol}
\def\specialpapernotice{\@TSoClegacywarn{specialpapernotice}{TSoCspecialpapernotice}\TSoCspecialpapernotice}
\def\TSoCcompsoctitleabstractindextext{\@TSoClegacywarn{TSoCcompsoctitleabstractindextext}{TSoCtitleabstractindextext}\TSoCtitleabstractindextext}
\def\TSoCdisplaynotcompsoctitleabstractindextext{\@TSoClegacywarn{TSoCdisplaynotcompsoctitleabstractindextext}{TSoCdisplaynontitleabstractindextext}\TSoCdisplaynontitleabstractindextext}
% provide some legacy TSoCtran environments
\def\keywords{\@TSoClegacywarn{keywords}{TSoCkeywords}\TSoCkeywords}
\def\endkeywords{\endTSoCkeywords}


\renewenvironment{abstract}
 {\small
  \begin{center}
  \bfseries \abstractname\vspace{-.5em}\vspace{0pt}
  \end{center}
  \list{}{
    \setlength{\leftmargin}{1.5cm}%
    \setlength{\rightmargin}{\leftmargin}%
  }%
  \item\relax}
 {\endlist}
 
\renewenvironment{keywords}
 {\small\vspace{9pt}
%  \begin{center}
%  \bfseries \keywordsname\vspace{-.5em}\vspace{0pt}
%  \end{center}
  \list{\textbf{~~\keywordsname : }}{
    \setlength{\leftmargin}{1.5cm}%
    \setlength{\rightmargin}{\leftmargin}%
  }%
  \item\relax}
 {\endlist}

 
% V1.8 no more support for legacy IED list commands
%\let\labelindent\TSoClabelindent
%\def\calcleftmargin{\@TSoClegacywarn{calcleftmargin}{TSoCcalcleftmargin}\TSoCcalcleftmargin}
%\def\setlabelwidth{\@TSoClegacywarn{setlabelwidth}{TSoCsetlabelwidth}\TSoCsetlabelwidth}
%\def\usemathlabelsep{\@TSoClegacywarn{usemathlabelsep}{TSoCusemathlabelsep}\TSoCusemathlabelsep}
%\def\iedlabeljustifyc{\@TSoClegacywarn{iedlabeljustifyc}{TSoCiedlabeljustifyc}\TSoCiedlabeljustifyc}
%\def\iedlabeljustifyl{\@TSoClegacywarn{iedlabeljustifyl}{TSoCiedlabeljustifyl}\TSoCiedlabeljustifyl}
%\def\iedlabeljustifyr{\@TSoClegacywarn{iedlabeljustifyr}{TSoCiedlabeljustifyr}\TSoCiedlabeljustifyr}
% V1.8 no more support for QED and proof stuff
%\def\QED{\@TSoClegacywarn{QED}{TSoCQED}\TSoCQED}
%\def\QEDclosed{\@TSoClegacywarn{QEDclosed}{TSoCQEDclosed}\TSoCQEDclosed}
%\def\QEDopen{\@TSoClegacywarn{QEDopen}{TSoCQEDopen}\TSoCQEDopen}
%\AtBeginDocument{\def\proof{\@TSoClegacywarn{proof}{TSoCproof}\TSoCproof}\def\endproof{\endTSoCproof}}
% V1.8 no longer support biography or biographynophoto
%\def\biography{\@TSoClegacywarn{biography}{TSoCbiography}\TSoCbiography}
%\def\biographynophoto{\@TSoClegacywarn{biographynophoto}{TSoCbiographynophoto}\TSoCbiographynophoto}
%\def\endbiography{\endTSoCbiography}
%\def\endbiographynophoto{\endTSoCbiographynophoto}
% V1.7 and later no longer supports \overrideTSoCmargins
%\def\overrideTSoCmargins{%
%\typeout{** WARNING: \string\overrideTSoCmargins \space no longer supported (line \the\inputlineno).}%
%\typeout{** Use the \string\CLASSINPUTinnersidemargin, \string\CLASSINPUToutersidemargin \space controls instead.}}

\RequirePackage{xparse}
\ExplSyntaxOn
\seq_new:N \l_input_seq % declare a list (seq) variable
\tl_new:N \l_last_word_tl % declare a "token list" variable
\NewDocumentCommand{\reverseit}{m}
  {
    \tl_if_blank:nF {#1} % If the input contains no words, do nothing.
      {
        % Split the argument into words (~ stands for a space here).
        \seq_set_split:Nnn \l_input_seq { ~ } {#1}
        % Remove the last word from the seq.
        \seq_pop_right:NN \l_input_seq \l_last_word_tl 
        \seq_pop_right:NN \l_input_seq \l_last_word_tl 
        \seq_pop_right:NN \l_input_seq \l_last_word_tl 
        \seq_pop_right:NN \l_input_seq \l_last_word_tl 
        \seq_pop_right:NN \l_input_seq \l_last_word_tl 
        % Put the last word on the left of the sequence.
        %\seq_put_left:NV \l_input_seq \l_last_word_tl
        % Use the contents of the sequence, separating words by a space (~).
        \seq_use:Nnnn \l_input_seq { ~ } { ~ } { ~ }
      }
  }
\ExplSyntaxOff

\RequirePackage[margin=3cm, top=4.1cm, headheight=1.1cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\fancypagestyle{firstpage}{%
\fancyhf{} % clear all six fields 
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt}
} 
\fancypagestyle{firststyle}
{
\fancyhead[R]{\footnotesize{\sc Ind. Journal on Computing~ Vol.~XX, No.~XX, \MONTH~\the\year\\pp. xx-xx. doi:xxx}}   
\fancyhead[L]{\sc{OPEN ACCESS}\\
\includegraphics[width=2.75 cm]{logo.png}\\\footnotesize{\sc{ISSN xxxx-xxxx}\\
\MakeLowercase{socj.telkomuniversity.ac.id/indojc}}
}
}
\fancypagestyle{followingpage}{%
\fancyhf{} % clear all six fields 
\fancyhead[LE]{\footnotesize{\sc \Author \MakeLowercase{\textit{}}: \\ \Title ...}\\$~$}
\fancyhead[LO]{%\footnotesize{\sc Ind. Journal on Computing~ Vol.~XX, No.~XX, \MONTH~\the\year}
}
\fancyhead[R]{%\footnotesize{\sc \thepage}
} \renewcommand{\headrulewidth}{0.7pt} \renewcommand{\footrulewidth}{0pt}
  }
\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{empty}\geometry{headheight = 0.55in}
}
\renewcommand{\headrulewidth}{0pt}

\endinput

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of TSoCtran.cls  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% That's all folks!
