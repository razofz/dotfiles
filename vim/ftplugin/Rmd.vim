:map <buffer> <Leader>m :!pandoc % -o %:r.pdf <Esc><Esc>
:map <buffer> <Leader>l :!pandoc % -o %:r.pdf --latex-engine xelatex <Esc><Esc>
