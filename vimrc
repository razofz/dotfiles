let mapleader=" "

set nu
set autoindent
" set linebreak

" highlighting stuff
set hlsearch
nnoremap <Leader>h :noh<CR>

" highlighting when line is over 80 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
match OverLength /\%81v.\+/

" 'sensible' splits
set splitright
set splitbelow

" markdown stuff
""""""""""""""""
" markdown: quickly insert link list item, and paste from register + inside
" the brackets
let @l='o- \url{}"+P'
" markdown: quickly yank link from list item to register +
let @y='"+yi}'
" markdown: make selection bold, use when something is visually selected
let @b='s****hP'
" markdown: surround with backticks, use when something is visually selected
let @c='s``P'
" markdown: make selection italic, use when something is visually selected
let @i='s__P'

""""""""""""""""""""""""""""""""

" html stuff
""""""""""""""""""""""""""""""""
" commenting
let @z='$I<!-- A -->'
" uncommenting
let @x='$0exxhxhxhx$xxxx'

filetype plugin indent on
""""""""""""""""""""""""""""""""


" for traversing visual lines and not actual lines
nnoremap j gj
nnoremap k gk

" easier movement between splits
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" insert today's date
nnoremap <F5> "=strftime("%Y-%m-%d")<CR>p

" 'anti-J', split a line into two where cursor is
nnoremap \ i<CR><Esc>

" (native) fuzzy search, open split contra vertical split
" let @z=':sp **/*'
" let @x=':vs **/*'
" another way of doing fuzzy search
nnoremap <Leader>e :e **/*
nnoremap <Leader>v :vs **/*
nnoremap <Leader>s :sp **/*

" Quick jump to previous buffer
nnoremap <Leader>p :b #<CR>

" use wildmenu, i. e. show possible completions for :e, :sp, :vsp etc
" https://gist.github.com/csswizardry/9a33342dace4786a9fee35c73fa5deeb
set wmnu
set wildignore+=*.bmp,*.gif,*.jpg,*.png
set wildignore+=*.pdf,*.aux,*.dvi,*.bcf

" map Ctrl+s to save
" note: needs 'stty -ixon' in .bashrc to work
" otherwise <C-S> freezes terminal and requires <C-Q> to unfreeze
nnoremap <C-S> <Esc>:w<CR>
inoremap <C-S> <C-O>:w<CR>
vnoremap <C-S> <Esc>:w<CR>gv

" related to wildmenu, if this is enabled Vim keep tracks of current file's directory
" set autochdir

let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '>'

" noremap <silent> <F3> :NERDTreeToggle<CR>
" nnoremap <leader>
nnoremap <silent> <leader><Space> :NERDTreeToggle<CR>
