#!/usr/bin/env -S vi -u
" $ uname -r
.!echo \" $(uname -r)%HERE%
" $ has
.!echo \" $(has vi)
" $ cat test.vim
set runtimepath=$VIMRUNTIME
set runtimepath+=~/.local/share/nvim/repos/github.com/
let g:coc_config_home = '.'
" $ cat coc-settings.json
" $ chmod +x test.vim
" $ ./test.vim
