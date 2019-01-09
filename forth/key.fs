#! /usr/bin/env gforth

: inputKey ( -- )
  key
  emit
;

inputKey
bye
