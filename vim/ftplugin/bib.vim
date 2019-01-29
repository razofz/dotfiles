:map <buffer> <Leader>c :s/^/% /<Esc><Esc> :noh <CR>
:map <buffer> <Leader>u :s/% // <Esc><Esc> :noh <CR>
:map <buffer> <Leader>m :!pdflatex main <Esc><Esc>
:map <buffer> <Leader>b :!pdflatex main <CR> :!biber main <CR> :!pdflatex main <CR>
