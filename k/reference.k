Verb                       Adverb                Noun            Atom List
:  assign                  '  each               char  " ab"       `c `C
+  add         flip        /  over               name  ``a`b       `n `N
-  subtract    negate      \  scan               int   Ø 0 2       `i `
*  multiply    first       ': eachprior          float ø 2.3 π ∞   `f
%  divideby    inverse     /: eachright join|sv  time 12:34:56.789 `t `T   .z.t
&  min|and     where       \: eachleft split|vs  date 2019-06-28   `D `D   .z.D
|  max|or      reverse
<  less        ascend      System                list (2;3.4;`c)   `
>  more        descend     0: read/write line    dict {a:2;b:`c}   `a `A(table)
=  equal       group       1: read/write byte    func {(+/x)%#x}   `1..9
~  match       not         2: read/write data    expr  :32+9*f%5   `0
!  key         enumerate   3: conn/set (.z.ms)
,  catenate    list        4: http/get (.z.mg)   \h      help          \l log
^  except      null                              \l f.k  load
#  take        count       #[t;c;b[;a]] select   \t[:n]x time
_  drop        floor       _[t;c;b[;a]] update   \u[:n]x trace
?  find        distinct    ?[x;i;f[;y]] splice   \v [d]  vars
@  index       type        @[x;i;f[;y]] amend    \f [d]  fns
.  apply       eval        .[x;i;f[;y]] dmend    \cd [d] get[set]dir   \gr grep
$  pad|cast    string      $[c;t;f]     cond     \lf [x] file \lc char \ll line

util: in within bin like find [f]asc [f]desc [f]key
math: sqrt sin cos abs prm cmb [n]log [n]exp [n]rand mod div
aggr: count first last min max sum avg var dev med
sql: [select|update|delete] a.. by b.. from t.. where c..

datetime:YMDHRSTUV+duration:ymdhrstuv; T:.z.D+.z.t; 2019-06-28+2m; day:7 mod
`year`month`date`hour`minute`second`millisecond`microsecond`nanosecond

bool: `utf8`ascii`print
1way: `p`m`crc`sha`rip`bad   e.g. hash:  `sha@"crypto"
2way:``j`k`csv`b64`hex`aes   e.g. json: `j?`j@{a:2;b:`c}

if[c;..];while[c;..]
