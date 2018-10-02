\version "2.18.2"
%melody = 
\relative c' {
  \clef treble
  \key c \major
  \time 4/4

  %A
  \bar ".|:"
  c'4. b8 a4 g8 f8~ |
  f8 g4. a4 c |
  b4. a8 g4 f8 e8~ | e1 |
  a4. g8 f4 e8 d8~ |
  d8 e4. f4 a |
  gis4. f8 e4 d8 c~ |
  c2. cis4 \bar "||" |
  %B
  d8 a'4 a8~ a2~ |
  a2 c4 b |
  g1~ | g2. b,4 |
  c8 f4 f8~ f2~ | f4 a2 g4 |
  f4. e8~ e2~ | e2 r2 \bar "||" |
  %A
  c'4. b8 a4 g8 f8~ |
  f8 g4. a4 c |
  b4. a8 g4 f8 e8~ | e1 |
  a4. g8 f4 e8 d8~ |
  d8 e4. f4 a |
  gis4. f8 e4 d8 c~ |
  c2. cis4 \bar "||" |
  %C
  d8 a'4 a8~ a2~ |
  a2 c4 b |
  \set Score.repeatCommands = #'((volta "1"))
  g1~ | g2. gis4 |
  a8 c,4 c8~ c2~ | c2 c4 d | c1 | r1 |
  \set Score.repeatCommands = #'((volta #f))
  \bar ":|."
  \set Score.repeatCommands = #'((volta "2"))
  e'1~
  \set Score.repeatCommands = #'((volta #f))

  e2. c4 | d8 a4 a8~ a2~ | a2 b4 d | c1~ | c1
  \bar "|."
}

%harmonies = \chordmode {
%  c4:m f:min7 g:maj c:aug
%  d2:dim b:sus
%}

%\score {
%  <<
%    \new ChordNames {
%      \set chordChanges = ##t
%      \harmonies
%    }
%    \new Staff \melody
%  >>
%  \layout{ }
%  \midi { }
%}
