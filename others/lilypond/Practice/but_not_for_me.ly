\version "2.18.2"
melody = \relative c' {
  \clef treble
  \key es \major
  \time 4/4
  
  \partial 4*3 f4 g f |
  % A
  g2 f4 es~ | es f g f | g1 |
  r4 f4 g f | g2 f4 es~ | es f g f | g1 |
  r4 g aes bes | \bar "||"
  % B
  b2 c4 es | r4 f, g aes | a2 bes4 es |
  r4 es, f g | g2 aes4 es' | r4 es c aes | f1 | r4 f g f |
  \bar "||"
  % C
  b2 c4 es | r4 f, g aes | a2 bes4 f' |
  r4 es c aes | g1 | f1 | es1~ | es2. r4
  \bar "|."
}

harmonies = \chordmode {
  % A
  \set noChordSymbol = ""
  r2.
  f1:7 | f2:min7 bes2:7 | es1:maj7 | g2:min7 c2:7 |
  f1:7 | f2:min7 bes2:7 | es1:maj7 | bes2:min7 es2:7 |
  % B
  aes1:maj7 | aes2:min7 des2:7 | es1:maj7 | es1:maj7  |
  c1:min7 | f1:7 | f1:min7 | bes1:7 |
  % C
  aes1:maj7 | aes2:min7 des2:7 | es1:maj7 | c1:min7 |
  f1:min7 | bes1:7 | es1:6 | es1:6
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new Staff \melody
  >>
  \layout {}
  \midi {}
}
