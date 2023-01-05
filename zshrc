(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv export zsh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv hook zsh)"

export ZSH_TMUX_AUTOCONNECT=false

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias which='whence -p '
alias bat='bat -n '

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=99999
HISTFILESIZE=99999

export PYTHONPATH='/home/raz/data/code/python/own_utils/'

export PROMPT_COMMAND='history -a'

export PATH=$PATH:/home/raz/prg/appimages
export PATH=$PATH:/home/raz/anaconda3/envs/vim-nodejs/bin
export PATH=$PATH:/usr/local/go/bin

# cuda stuff
export LD_LIBRARY_PATH=/usr/local/cuda-12.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export PATH=${PATH}:/usr/local/cuda-12.0/bin

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

source ~/dotfiles/always-bashrc

export EDITOR=nvim

# For Loading the SSH key
/usr/bin/keychain -q --nogui $HOME/.ssh/id_ed25519
source $HOME/.keychain/`hostname`-sh

# for direnv, to have directory-specific environment variables
eval "$(direnv hook bash)"
alias nvtop="docker run -it --rm --runtime=nvidia --gpus=all --pid=host nvtop"
alias l='/usr/bin/ls'
alias ls='lsd'
alias lt='ls --tree'

# add own environment variables
. ~/.environment_variables

# echo "Hi raz!"
# echo ""

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

  fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

[ -f /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh ] && . /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k" # set by `omz`
# ZSH_THEME="agnoster"
# ZSH_THEME="jonathan"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(

	ag
	aliases
	catimg
	colored-man-pages
	colorize
	conda-zsh-completion
	cp
	direnv
	docker
	emoji
	emoji-clock
	emotty
	extract
	fd
	git
	jsontools
	mosh
	npm
	rsync
	samtools
	thefuck
	themes
	tmux
	vi-mode
	fzf # needs to be after vi-mode https://github.com/ohmyzsh/ohmyzsh/issues/10533
	zsh-autosuggestions

	zsh-syntax-highlighting # must apparently be last

	# command-not-found
	# copybuffer
)

ZSH_COLORIZE_STYLE="emacs"

source $ZSH/oh-my-zsh.sh

# conda completion stuff
zstyle ':completion::complete:*' use-cache 1
zstyle ":conda_zsh_completion:*" use-groups true
zstyle ":conda_zsh_completion:*" sort-envs-by-time true

# vi-mode stuff
VI_MODE_SET_CURSOR=true
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
INSERT_MODE_INDICATOR="%F{yellow}i%f"
MODE_INDICATOR="%F{yellow}N%f"

# zsh-syntax-highlighting stuff
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

prompt_virtualenv() {
  # # Get the name of the virtual environment if one is active
  # if [[ -n $VIRTUAL_ENV ]]; then
  #   local env_label=" $(basename $VIRTUAL_ENV) "
  # fi
  if [[ $(basename $CONDA_PREFIX) == "anaconda3" ]]; then
    env_label=""
  else
    env_label="$(basename $CONDA_PREFIX)"
  fi

  # # Get the name of the Anaconda environment if one is active
  # if [[ -n $CONDA_PREFIX ]]; then
  #   if [[ $env_label -eq "anaconda3" ]]; then
  #     env_label=""
  #   elif [[ -n $env_label ]]; then
  #     env_label+="+ $(basename $CONDA_PREFIX) "
  #   else
  #     local env_label=" $(basename $CONDA_PREFIX) "
  #   fi
  # fi

  # Draw prompt segment if a virtual/conda environment is active
  if [[ -n $env_label ]]; then
    color=yellow
    # prompt_segment $color $PRIMARY_FG
    prompt_segment $color black
    print -Pn $env_label
  fi
}

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

j() {
    if [[ "$#" -ne 0 ]]; then
        cd $(autojump $@)
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)" 
}

export MANPATH=/usr/share/man
man-find() {
    f=$(fd . $MANPATH/man${1:-1} -t f -x echo {/.} | fzf) && man $f
}
# Same as above, but with previews and works correctly with man pages in different sections.
function fman() {
    man -k . | fzf -q "$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man | col -bx | bat -l man -p --color always' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}
# Get the colors in the opened man page itself
export MANPAGER="sh -c 'col -bx | bat -l man -p --paging always'"

alias fzf="fzf-tmux -p"

# Install (one or multiple) selected application(s)
# using "brew search" as source input
# mnemonic [B]rew [I]nstall [P]ackage
bip() {
  local inst=$(brew search "$@" | fzf -m)

  if [[ $inst ]]; then
    for prog in $(echo $inst);
    do; brew install $prog; done;
  fi
}

# Update (one or multiple) selected application(s)
# mnemonic [B]rew [U]pdate [P]ackage
bup() {
  local upd=$(brew leaves | fzf -m)

  if [[ $upd ]]; then
    for prog in $(echo $upd);
    do; brew upgrade $prog; done;
  fi
}

# prompt_dir() {
#     # Get the path from home, root, or git repo to the working directory
#     if [ -d .git ]; then
#         # If the current directory is the top level of a git repo,
#         # just add the name of the repo to the prompt and exit.
#         prompt_segment blue $CURRENT_FG
#         print -Pn "$(basename $(pwd))"
#         return 0
#     elif $(git rev-parse > /dev/null 2>&1); then
#         # If we're in a git repo, get the path from the top of the repo to the
#         # working directory.
#         local abs_path_=$(pwd)
#         local git_toplevel="$(git rev-parse --show-toplevel)"
#         local path_=${abs_path_#$git_toplevel}
#     else
#         # If we aren't in a git repo, get the path from either root or home to
#         # the working directory.
#         local abs_path_=$(pwd)
#         local path_=${abs_path_#$HOME}

#         if [[ $abs_path_ != $path_ ]]; then
#             local path_="~/$path_"
#         else
#             local from_root=1
#         fi
#     fi

#     # Shorten the path by truncating each directory (except the current one) to
#     # only one letter.
#     local path_as_array=(${(s:/:)path_})  # Split the path at forward slashes
#     local length_of_path=${#path_as_array[@]}
#     local shrunken_path=""
#     if [[ $length_of_path != 0 ]]; then
#         for i in {1..$length_of_path}; do
#             if [[ $i != 1 || $git_toplevel ]]; then
#                 # Add a separating slash
#                 shrunken_path+="/"
#             fi

#             # Truncate the dir name to the first letter, unless it is the
#             # current dir
#             if [[ $i != $length_of_path ]]; then
#                 local elem="$path_as_array[$i]"
#                 shrunken_path+="${elem[0,1]}"
#             else
#                 local elem="$path_as_array[$i]"
#                 shrunken_path+="$elem"
#             fi
#         done
#     fi

#     if [[ $from_root ]]; then
#         local shrunken_path="/"$shrunken_path
#     elif [[ $git_toplevel ]]; then
#         local shrunken_path="$(basename $git_toplevel)$shrunken_path"
#     fi

#     # Draw the prompt
#     prompt_segment blue $CURRENT_FG
#     print -Pn "$shrunken_path"
# }

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/raz/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/raz/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/raz/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/raz/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
