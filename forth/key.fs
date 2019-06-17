
: inputKey ( -- )
  ." Press any key" CR
  key
  dup
  emit ." 's Ascii code is " . CR
;

inputKey
