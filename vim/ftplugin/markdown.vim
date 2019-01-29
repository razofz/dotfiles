:map <buffer> <Leader>m :!pandoc % -o PDFs/%:r.pdf <Esc><Esc>
:map <buffer> <Leader>l :!pandoc % -o PDFs/%:r.pdf --latex-engine xelatex <Esc><Esc>
