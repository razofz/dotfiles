:map <buffer> <Leader>c :s/^/% /<Esc><Esc> :noh <CR>
:map <buffer> <Leader>u :s/% // <Esc><Esc> :noh <CR>
:map <buffer> <Leader>m :!pdflatex % <Esc><Esc>
:map <buffer> <Leader>b :!pdflatex % <CR> :!bibtex %:r <CR> :!pdflatex % <CR> :!pdflatex % <CR>
