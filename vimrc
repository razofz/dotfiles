let g:python_host_prog="/home/raz/anaconda3/envs/vim-python2/bin/python"
let g:python3_host_prog="/home/raz/anaconda3/envs/vim-python3/bin/python"
let g:node_host_prog = "/home/raz/anaconda3/envs/vim-nodejs/bin/node"
" let g:black_virtualenv = g:python3_host_prog

let mapleader=" "

colo raz

set nu
set autoindent
" set linebreak
set background=dark

" longer history of commands used, 50 are not that much when you're in the
" middle of something and after a while want to save the useful commands
set history=1000

" highlighting stuff
set hlsearch

" highlighting when line is over 80 characters
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
" match OverLength /\%81v.\+/

" 'sensible' splits
set splitright
set splitbelow

" edit .vimrc
nnoremap <silent> <Leader>r :e ~/.vimrc<CR>
" reload vimrc
nnoremap <Leader>R :so ~/.vimrc<CR>

filetype plugin indent on

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

" allow mouse use
set mouse=a
" allow mouse use in tmux as well. (on work tower is sgr in standard terminal,
" xterm2 in tmux). Combined with mouse mode on/off bindings in .tmux.conf
" (does not seem to be really needed, though. Still nice.)
if (!has('nvim'))
	set ttymouse=sgr
endif

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

if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif


" related to wildmenu, if this is enabled Vim keep tracks of current file's directory
" set autochdir

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline_theme='distinguished'
let g:airline_powerline_fonts = 1

" noremap <silent> <F3> :NERDTreeToggle<CR>
" nnoremap <leader>
nnoremap <silent> <leader><Space> :NERDTreeToggle<CR>

" snakemake
" au BufNewFile,BufRead Snakefile set syntax=snakemake  | set filetype=snakemake
" au BufNewFile,BufRead *.rules set syntax=snakemake | set filetype=snakemake
" au BufNewFile,BufRead *.snakefile set syntax=snakemake | set filetype=snakemake
" au BufNewFile,BufRead *.snake set syntax=snakemake | set filetype=snakemake

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

" for gitgutter plugin
set updatetime=100
nnoremap <silent> <leader>g :GitGutterToggle<CR>
let g:gitgutter_set_sign_backgrounds = 1

" for undotree plugin
nnoremap <F6> :UndotreeToggle<CR>

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" auto-install vim-plug if not installed
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'snakemake/snakemake', {'rtp': 'misc/vim'}
Plug 'snakemake/snakefmt'
" Plug 'davidhalter/jedi-vim'
Plug 'psf/black'
Plug 'jrudess/vim-foldtext'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'ekalinin/dockerfile.vim'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update
" this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'jalvesaq/Nvim-R'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'gaalcaras/ncm-R'
Plug 'ncm2/ncm2-jedi'
" Vim 8 only
if !has('nvim')
	Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'wellle/tmux-complete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'ncm2/ncm2-vim-lsp'
Plug 'ncm2/ncm2-github'

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" for Nvim-R
" https://github.com/jamespeapen/Nvim-R/wiki/options#assignment-operator-and-rnoweb-completion-of-code-block
let R_assign = 2

" enable ncm2 for all buffers
if has('nvim')
	autocmd BufEnter * call ncm2#enable_for_buffer()
endif

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" can `set foldcolumn=2` [0-12] to show how folds are defined 
nnoremap <Leader>h :noh<CR>
