\version "2.18.2"
melody = \relative c' {
  \clef treble
  \key c \major
  \time 4/4

  c d e f
}

\score {
  \new Staff \melody
  \layout {}
  \midi {}
}
