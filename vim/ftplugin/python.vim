" :map <buffer> <Leader>c :s/^/# /<Esc><Esc> :noh <CR>
" :map <buffer> <Leader>u :s/# // <Esc><Esc> :noh <CR>
:map <buffer> <Leader>m :py3f %<CR>

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab

set foldmethod=indent
set foldlevel=99

let python_highlight_all=1
