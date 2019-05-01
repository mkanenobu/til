
" Global
let g:var1 = 0

" Script (同スクリプト内)
let s:var2 = 1

" Buffer local
let b:var3 = 'Buffer'

" Window local
let b:var4 = "Window"

" Tab local
let t:var5 = 'Tab'

" Embedded
echo v:stderr

" Function local
function! s:sample(arg)
  echo l:arg
endfunction

