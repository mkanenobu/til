if exists('g:sample_var')
  echo 'g:sample_var is defined'
else
  echo 'g:sample_var is not defined'
endif

let g:sample_var = 1

if exists('g:sample_var')
  echo 'g:sample_var is defined'
else
  echo 'g:sample_var is not defined'
endif

