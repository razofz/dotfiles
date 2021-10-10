Trying to get a good setup for vim. However, there are a lot of plugins and
solutions to accomplish basically the same things (conceptually speaking), and
there are probably conflicting solutions in my vimrc and vim folder already.
So, try to list the conceptual things I want and concrete solutions to
accomplish them.

- File browser
    - NERDtree
- Mouse support
    - `set mouse=a`
        - needs `ttymouse=sgr` for tmux
- Moving between buffers
    - Control+{vim movement keys}
- Fuzzy finding/opening of files
    - the `**/*` trick
        - including wildmenu
- C-s to save
    - maps, also `stty -ixon` in bashrc
- Autocompletion
    - <C-p>/<C-N> for in-buffer stuff
    - ncm2
        - https://github.com/ncm2/ncm2-vim-lsp
        - https://github.com/prabirshrestha/vim-lsp#registering-servers
        - https://github.com/mattn/vim-lsp-settings
        - Seems to be unmaintaned.
    - deoplete?
        - Seems to be unmaintaned.
    - asyncomplete?
    - YouCompleteMe
        - really weird to build on ubuntu 18.04, though. Wait til I've
          installed 20.04.
    - completor.vim
    - coc.nvim
- Yank history
    - https://github.com/svermeulen/vim-yoink
- Comment/uncomment easily
    - vim-commentary
    - my Leader-c Leader-u maps
- Undo
    - Persistent undo
    - Visualize undo tree
        - mbbill/undotree
- Language support
    - Autocompletion
    - Send to console/terminal
        - vim-slime?
    - View help/docs
    - Object/variable viewer
    - Linting
        - https://github.com/dense-analysis/ale Asynchronous Lint Engine
    - Autoformatter
    - Go to definition and the likes

- R
- Python
    - Autocompletion
        - ncm2/ncm2-jedi
    - Autoformatter
        - psf/black
            - `:Black` to format
- Snakemake
- Dockerfile
    - ekalinin/dockerfile.vim
- Markdown
    - Preview
        - iamcco/markdown-preview.nvim

https://github.com/jeetsukumaran/vim-pythonsense ?

# Nvim

- Setting paths for python binaries work, but not for node currently. Weird 'ELF' token.
