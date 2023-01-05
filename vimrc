let g:python_host_prog="/home/raz/anaconda3/envs/vim-python2/bin/python"
let g:python3_host_prog="/home/raz/anaconda3/envs/vim-python3/bin/python"
" let R_path="/home/raz/anaconda3/envs/vim-R/bin/"
let R_path="/home/raz/anaconda3/envs/nvim-R/bin"
" let R_path="/home/raz/anaconda3/envs/DB_QZ_signac_saras/bin"
" let g:node_host_prog="/home/raz/anaconda3/envs/vim-nodejs/bin/node"
" let g:black_virtualenv = g:python3_host_prog

nmap <leader>q :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let mapleader=" "

colo raz
" colo desert

set nu
set autoindent
" set linebreak
set background=dark

set cursorline

" longer history of commands used, 50 are not that much when you're in the
" middle of something and after a while want to save the useful commands
set history=10000

" highlighting stuff
set hlsearch

set encoding=utf8

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

" Toggle pasteing
nnoremap <Leader>c :set paste!<CR>

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
set wildignore+=*.ipynb

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
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_sep = '>'
" let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline_theme='distinguished'
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_startify = 1
" set guifont=DroidSansMono\ Nerd\ Font\ 11
set guifont=Fantasque\ Sans\ Mono\ Regular\ Nerd\ Font\ Complete.ttf
" let g:airline_section_y="%{coverage_highlight#get_current()} airline#util#wrap(airline#parts#ffenc(),0)}"
let g:airline_section_z="%{coverage_highlight#get_current()}%p%%%#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#%#__accent_bold#%{g:airline_symbols.colnr}%v%#__restore__#"
" let g:airline_section_y="AAAAH"

" noremap <silent> <F3> :NERDTreeToggle<CR>
" nnoremap <leader>
nnoremap <silent> <leader><Space> :NERDTreeToggle<CR>
nnoremap <silent> gn :NERDTreeFocus<CR>

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
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_async = 1
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

" for clipboard support in Blink on iPad
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | OSCYankReg '"' | endif
set clipboard& clipboard^=unnamed,unnamedplus

" for coverage-highlight.vim (next uncovered chunk)
noremap [C :<C-U>PrevUncovered<CR>
noremap ]C :<C-U>NextUncovered<CR>

" for undotree plugin
nnoremap <F6> :UndotreeToggle<CR>

let g:gruvbox_italic=1

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'',
                \ 'Staged'    :'',
                \ 'Untracked' :'',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'ﲅ',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'',
                \ 'Ignored'   :'婢',
                \ 'Clean'     :'',
                \ 'Unknown'   :'',
                \ }
" \ 'Dirty'     :'',
" \ 'Dirty'     :'',
" \ 'Modified'  :'﮺',
" \ 'Ignored'   :'',
" \ 'Ignored'   :'',
" \ 'Unmerged'  :'',

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['smk'] = 'פּ'
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['smk'] = 'ﳇ'
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['smk'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sh'] = ' '
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['bash'] = ' '
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['bash'] = ' '
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['py'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ipynb'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jpg'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['png'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['svg'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['svg'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['svg'] = '謁'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['bam'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['bai'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['fasta'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['fai'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['pdf'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ps'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['xml'] = '謹'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['csv'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tsv'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tsv'] = '離'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['bed'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['broadPeak'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['narrowPeak'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['gappedPeak'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yml'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yaml'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['.gitignore'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['zip'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['gz'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tar'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['Rdata'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['rds'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['h5'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['hdf5'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['mtx'] = 'ﬧ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['Matrix'] = 'ﬧ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['iso'] = '﫭'

let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:juliaPurple = "9558B2"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:vuejs = '42B883'
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor[".gitignore"] = s:rspec_red " sets the color for .gitignore files
" let g:NERDTreeExactMatchHighlightColor[".zarr"] = s:white 

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor["r"] = s:blue
let g:NERDTreeExtensionHighlightColor["R"] = s:blue
let g:NERDTreeExtensionHighlightColor["yml"] = s:beige
let g:NERDTreeExtensionHighlightColor["yaml"] = s:beige
let g:NERDTreeExtensionHighlightColor["ipynb"] = s:beige
let g:NERDTreeExtensionHighlightColor["smk"] = s:git_orange
let g:NERDTreeExtensionHighlightColor["csv"] = s:brown
let g:NERDTreeExtensionHighlightColor["tsv"] = s:brown
let g:NERDTreeExtensionHighlightColor["xml"] = s:brown
let g:NERDTreeExtensionHighlightColor["md"] = s:orange
let g:NERDTreeExtensionHighlightColor["gz"] = s:purple
let g:NERDTreeExtensionHighlightColor["zip"] = s:purple
let g:NERDTreeExtensionHighlightColor["tar"] = s:purple
let g:NERDTreeExtensionHighlightColor["conf"] = s:green
let g:NERDTreeExtensionHighlightColor["html"] = s:pink
let g:NERDTreeExtensionHighlightColor["svg"] = s:darkBlue
let g:NERDTreeExtensionHighlightColor["h5"] = s:vuejs
let g:NERDTreeExtensionHighlightColor["hdf5"] = s:vuejs
let g:NERDTreeExtensionHighlightColor["rds"] = s:vuejs
let g:NERDTreeExtensionHighlightColor["Rds"] = s:vuejs
let g:NERDTreeExtensionHighlightColor["RDS"] = s:vuejs
let g:NERDTreeExtensionHighlightColor["Rdata"] = s:vuejs
let g:NERDTreeExtensionHighlightColor["bam"] = "808080"
let g:NERDTreeExtensionHighlightColor["bai"] = "808080"
let g:NERDTreeExtensionHighlightColor["fasta"] = "808090"
let g:NERDTreeExtensionHighlightColor["fai"] = "808090"
let g:NERDTreeExtensionHighlightColor["bed"] = "808090"
let g:NERDTreeExtensionHighlightColor["broadPeak"] = "808090"
let g:NERDTreeExtensionHighlightColor["narrowPeak"] = "808090"
let g:NERDTreeExtensionHighlightColor["gappedPeak"] = "808090"
let g:NERDTreeExtensionHighlightColor["pdf"] = s:red
let g:NERDTreeExtensionHighlightColor["ps"] = s:red


" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsListSnippets="<c-f>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" https://github.com/dense-analysis/ale#faq-coc-nvim
let g:ale_disable_lsp = 1
" use coc for completion instead
let g:ale_completion_enabled = 0

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
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'rbberger/vim-singularity-syntax'
" Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

Plug 'mgedmin/coverage-highlight.vim'
" Plug 'google/vim-maktaba'
" Plug 'google/vim-coverage'
" Plug 'google/vim-glaive'

Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jpalardy/vim-slime'
Plug 'ojroques/vim-oscyank'

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update
" this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'tmux-plugins/vim-tmux'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'

Plug 'tpope/vim-unimpaired'


"""" Approach A to completion and LSP stuff
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'gaalcaras/ncm-R'
"Plug 'ncm2/ncm2-vim-lsp'
"Plug 'ncm2/ncm2-bufword'
"Plug 'yuki-yano/ncm2-dictionary'
"Plug 'ncm2/ncm2-github'
"" Plug 'ncm2/ncm2-jedi'
"" Vim 8 only
"if !has('nvim')
"	Plug 'roxma/vim-hug-neovim-rpc'
"endif
"Plug 'wellle/tmux-complete.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'thomasfaingnaert/vim-lsp-snippets'
"Plug 'thomasfaingnaert/vim-lsp-ultisnips'
""""

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Approach B to completion and LSP stuff
"""
Plug 'dense-analysis/ale'
Plug 'kevinoid/vim-jsonc'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/vim-jsx-improve'
Plug 'neoclide/npm.nvim', {'do' : 'npm install'}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-html'
" Plug 'neoclide/coc-git'
" Plug 'neoclide/coc-json'
" Plug 'neoclide/coc-highlight'
" Plug 'neoclide/coc-r-lsp'
" Plug 'valentjn/vscode-ltex'
" Plug 'weirongxu/coc-markdown-preview-enhanced'
" Plug 'weirongxu/coc-webview'
" Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
" Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
" " Plug 'fannheyward/coc-pyright'

" Okay, seems like the better way is to actually run CocInstall all the
" plugins, stuff doesn't seem to want to work with the way above. Will just
" resort to in comments here what coc extensions I've installed....

"" this might be needed: https://github.com/neoclide/coc.nvim/wiki/Using-workspaceFolders#resolve-workspace-folder
" coc-pyright 

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" note: manually installed 'yuki-yano/fzf-preview' w/ :CocInstall coc-fzf-preview
"""

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for ALE

let g:ale_sign_error = '!!'
let g:ale_sign_warning = '>>'
highlight ALEWarning ctermbg=DarkGray ctermfg=Yellow

" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \    'R': 'styler',
" \}
"
let g:ale_linters = {
\    'R': 'lintr',
\    'python': ['pylint', 'flake8'],
\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
" let g:ale_linters = {'python': ['flake8']}
let g:ale_r_lintr_lint_package = 0
let g:ale_python_flake8_options = '--max-line-length=80'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

nnoremap <F8> :ALELint<CR>

call ale#linter#Define('r', {
\   'name': 'lintr',
\   'executable': '/home/raz/anaconda3/envs/vim-ale-R/bin/Rscript',
\   'cwd': '%s:h',
\   'command': function('ale_linters#r#lintr#GetCommand'),
\   'callback': 'ale#handlers#gcc#HandleGCCFormat',
\   'output_stream': 'both'
\})
"
" \   'lsp_config': {
" \      "server_capabilities": {
" \         "definitionProvider": false
" \      }
" \   }

" let g:ale_r_lintr_options = "linters_with_defaults(line_length_linter(80), commented_code_linter = NULL, duplicate_argument_linter(), inner_combine_linter(), object_name_linter(styles = c('symbols', 'snake_case', 'SNAKE_CASE')), undesirable_function_linter(), unreachable_code_linter())"

let g:ale_python_flake8_executable = '/home/raz/anaconda3/envs/vim-ale-python/bin/flake8'
let g:ale_python_pylint_executable = '/home/raz/anaconda3/envs/vim-ale-python/bin/pylint'
let g:ale_python_pyright_executable = '/home/raz/anaconda3/envs/vim-ale-python/bin/pyright-langserver'
let g:ale_python_mypy_executable = '/home/raz/anaconda3/envs/vim-ale-python/bin/mypy'

nmap <silent> gk <Plug>(ale_previous_wrap)
nmap <silent> gj <Plug>(ale_next_wrap)

let g:ale_cspell_executable="/home/raz/node_modules/cspell/bin.js"
" end of ALE stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" for psf/black
let g:black_linelength = 80
nnoremap <F9> :Black<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Coc.nvim stuff, see https://github.com/neoclide/coc.nvim
let g:coc_filetype_map = {'tex': 'latex'}
set hidden
" Give more space for displaying messages.
set cmdheight=2
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <F2> <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]
""" end Coc.nvim stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" bindings for coc extensions
" CocCommand markdown-preview-enhanced.openPreview
" CocList --input=markdown-preview-enhanced. commands " also nice
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
:command Mdpreview CocCommand markdown-preview-enhanced.openPreview
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" good commands to save
" :CocList extensions
"
" From https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#manage-extensions-with-coclist
" ? means invalid extension
" * means extension is activated
" + means extension is loaded
" - means extension is disabled
"   Supported actions (hit <Tab> to activate action menu):
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" vim-slime
" Run :let g:slime_target = "tmux"
" and
" <C-c>v 
" and prompt
" default
" and
" :.0
" for current window, pane with id 0
" see here for details:
" https://github.com/jpalardy/vim-slime#tmux

let g:slime_target = "tmux"

" nmap <Leader>l     <Plug>SlimeSendCurrentLine
" nmap <C-c>l     :SlimeSendCurrentLine <CR>
nmap <C-c><C-l>     :SlimeSendCurrentLine <CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" for Nvim-R
" https://github.com/jamespeapen/Nvim-R/wiki/options#assignment-operator-and-rnoweb-completion-of-code-block
let R_assign = 2
let R_start_libs = 'base,stats,graphics,grDevices,utils,methods,nvimcom,stringr'
let R_notmuxconf = 1
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1
let R_external_term = 1
let R_in_buffer = 0
let R_source = "/home/raz/data/code/R/tmux_split.vim"

" " enable ncm2 for all buffers
" if has('nvim')
	" autocmd BufEnter * call ncm2#enable_for_buffer()
" endif

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" for vim-lsp
highlight lspReference ctermfg=yellow ctermbg=darkmagenta

" can `set foldcolumn=2` [0-12] to show how folds are defined 
nnoremap <Leader>h :noh<CR>

let $FZF_DEFAULT_COMMAND = 'fd ""'
nnoremap <Leader>f :Files <CR>
nnoremap <Leader>g :GFiles <CR>
