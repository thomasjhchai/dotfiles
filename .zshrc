#if MacOS
if [[ $OSTYPE  = darwin* ]]; then
    # If you come from bash you might have to change your $PATH..
    export PATH=$HOME/Library/Python/3.8/bin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH
else
    export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH
fi

# setting up config path based on XDG specification
export XDG_CONFIG_HOME=$HOME/.config

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# set Right hand side promot to show hostname
# export export RPROMPT="%F{238} %K{46}%n@%m"

# Disable homebrew cask from throwing github error
export HOMEBREW_NO_GITHUB_API=1

# Fixed tmux zsh autosuggestion bug
export TERM=xterm-256color

# for mosh connection from Mac to server
export LC_CTYPE="en_US.UTF-8"

# set default EDITOR
if type "nvim" > /dev/null; then
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="cobalt2"
#ZSH_THEME="powerlevel9k/powerlevel9k"
# Config for powerlever9k
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time context dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rbenv)
#POWERLEVEL9K_STATUS_VERBOSE=false
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git 
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
# Use modern completion system
 autoload -Uz compinit
# compinit

# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
 zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
 zstyle ':completion:*' menu select long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true
 zmodload zsh/complist
 compinit
 _comp_options+=(globdots)
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#start ssh-agent during login session
#eval `ssh-agent`

# load .alias file
[ -f ~/.alias  ] && source ~/.alias

# load fzf key-binding and auto-completion
#
# Check OS version and set proper enviroment
if [ "$(uname -s)" = "Linux" ]; then
	export FZF_OS_ENV_PATH="/usr/share/doc/fzf/examples/"
	export FD_FILENAME="fdfind" # fix Ubuntu fd naming difference
else
	export FZF_OS_ENV_PATH="/usr/local/opt/fzf/shell/"
	export FD_FILENAME="fd" 
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${FZF_OS_ENV_PATH}/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${FZF_OS_ENV_PATH}/key-bindings.zsh" 2> /dev/null
#

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="${FD_FILENAME} --ignore-file ~/.ignore . $HOME"
export FZF_DEFAULT_OPTS='--no-height --no-reverse'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND" 
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --margin 7,20"
#export FZF_CTRL_T_OPTS="--preview '(bat --color "always" {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --margin 7,20"
export FZF_ALT_C_COMMAND="${FD_FILENAME} -t d . $HOME" # search HOME directory only
export FZF_COMPLETION_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --margin 7,20" 

# fzf fuzzy completion ignore files define in .ignore file
_fzf_compgen_path() { 
  ${FD_FILENAME} --ignore-file ~/.ignore . "$1" }

_fzf_compgen_dir() { 
  ${FD_FILENAME} --type d --ignore-file ~/.ignore . "$1" }

# display hostname beginning of the prompt 
export PROMPT='%m'$PROMPT

# key bindings
bindkey '^ ' autosuggest-accept # control-space to autocomplete suggestion

