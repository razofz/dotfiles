let mapleader=" "

colo raz

set nu
set autoindent
" set linebreak

" longer history of commands used, 50 are not that much when you're in the
" middle of something and after a while want to save the useful commands
set history=1000

" highlighting stuff
set hlsearch
nnoremap <Leader>h :noh<CR>

" highlighting when line is over 80 characters
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
" match OverLength /\%81v.\+/

" 'sensible' splits
set splitright
set splitbelow

" edit .vimrc
nnoremap <silent> <Leader>r :e ~/.vimrc<CR>

" markdown stuff
""""""""""""""""
" markdown: quickly insert link list item, and paste from register + inside
" the brackets
" let @l='o- \url{}"+P'
let @l='o- []"+PA()"+P'
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
" Cycle to next tab (due to tmux intercepting the keystroke)
nnoremap <Leader>t :tabn<CR>

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
let g:airline_theme='distinguished'

" noremap <silent> <F3> :NERDTreeToggle<CR>
" nnoremap <leader>
nnoremap <silent> <leader><Space> :NERDTreeToggle<CR>

" snakemake
au BufNewFile,BufRead Snakefile set syntax=snakemake  | set filetype=snakemake
au BufNewFile,BufRead *.rules set syntax=snakemake | set filetype=snakemake
au BufNewFile,BufRead *.snakefile set syntax=snakemake | set filetype=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake | set filetype=snakemake

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jedi-vim
" let g:jedi#use_splits_not_buffers = "right"
" let g:jedi#goto_command = "<leader>d"
" let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>t"
" let g:jedi#goto_definitions_command = ""
" let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
" let g:jedi#completions_command = "<C-Space>"
let g:jedi#auto_close_doc = 0
let g:jedi#rename_command = "<leader>f"
let g:jedi#popup_on_dot = 1 " set to 0 for don't auto-show completions, slow
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sample settings for vim-r-plugin and screen.vim
" Installation
"       - Place plugin file under ~/.vim/
"       - To activate help, type in vim :helptags ~/.vim/doc
"       - Place the following vim conf lines in .vimrc
" Usage
"       - Read intro/help in vim with :h vim-r-plugin or :h screen.txt
"       - To initialize vim/R session, start screen/tmux, open some *.R file in vim and then hit F2 key
"       - Object/omni completion command CTRL-X CTRL-O
"       - To update object list for omni completion, run :RUpdateObjList
" My favorite Vim/R window arrangement
"	tmux attach
"	Open *.R file in Vim and hit F2 to open R
"	Go to R pane and create another pane with C-a %
"	Open second R session in new pane
"	Go to vim pane and open a new viewport with :split *.R
" Useful tmux commands
"       tmux new -s <myname>       start new session with a specific name
"	tmux ls (C-a-s)            list tmux session
"       tmux attach -t <id>        attach to specific session
"       tmux kill-session -t <id>  kill specific session
" 	C-a-: kill-session         kill a session
" 	C-a %                      split pane vertically
"       C-a "                      split pane horizontally
" 	C-a-o                      jump cursor to next pane
"	C-a C-o                    swap panes
" 	C-a-: resize-pane -L 10    resizes pane by 10 to left (L R U D)
" Corresponding Vim commands
" 	:split or :vsplit      split viewport
" 	C-w-w                  jump cursor to next pane-
" 	C-w-r                  swap viewports
" 	C-w C-++               resize viewports to equal split
" 	C-w 10+                increase size of current pane by value

" To open R in terminal rather than RGui (only necessary on OS X)
" let vimrplugin_applescript = 0
" let vimrplugin_screenplugin = 0
" For tmux support
let g:ScreenImpl = 'Tmux'
let vimrplugin_screenvsplit = 1 " For vertical tmux split
let g:ScreenShellInitialFocus = 'shell'
" instruct to use your own .screenrc file
let g:vimrplugin_noscreenrc = 1
" For integration of r-plugin with screen.vim
let g:vimrplugin_screenplugin = 1
" Don't use conque shell if installed
let vimrplugin_conqueplugin = 0
" map the letter 'r' to send visually selected lines to R
let g:vimrplugin_map_r = 1
" see R documentation in a Vim buffer
let vimrplugin_vimpager = "no"
"set expandtab
set shiftwidth=4
set tabstop=8
" start R with F2 key
map <F2> <Plug>RStart
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
" send selection to R with space bar
vmap <Space> <Plug>RDSendSelection
" send line to R with space bar
nmap <Space> <Plug>RDSendLine

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
