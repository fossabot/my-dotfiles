function! init#init#fern#current_file_dir() abort
  let l:dir = expand('%:h')
  if empty(l:dir)
    let l:dir = '.'
  endif
  let l:dir = substitute(l:dir, '^suda://', '', 'g')
  execute 'Fern -drawer' l:dir
endfunction

function! init#init#fern#leftmouse() abort
  call feedkeys("\<LeftMouse>", 'n')
  call feedkeys('o')
endfunction

function! init#init#fern#2leftmouse() abort
  call feedkeys("\<LeftMouse>", 'n')
  call feedkeys('i')
endfunction

function! init#init#fern#cleftmouse() abort
  call feedkeys("\<LeftMouse>", 'n')
  call feedkeys('s')
endfunction

function! init#init#fern#middlemouse() abort
  call feedkeys('gu')
endfunction
