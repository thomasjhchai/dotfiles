#
# setting up config path based on XDG specification
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

# os specific configurations
if [[ $OSTYPE  = darwin* ]]; then
    # Disable homebrew cask from throwing github error
    export HOMEBREW_NO_GITHUB_API=1

    local BREW_PATH="/opt/homebrew/bin"
    local BREW_OPT_PATH="opt/homebrew/opt"
    local NVM_PATH="$HOME/.nvm"
    # If you come from bash you might have to change your $PATH..
    export PATH=:$BREW_PATH:$HOME/.local/bin:$PATH

    # setting up nvm path for macos
    export NVM_DIR=$NVM_PATH
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
else
    # setting up nvm path for Ubuntu
    export NVM_DIR="$HOME/.config/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Fixed tmux zsh autosuggestion bug
export TERM=xterm-256color

# for mosh connection from Mac to server
export LC_CTYPE="en_US.UTF-8"
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# set default EDITOR
if type "nvim" > /dev/null; then
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ORDER=(
  host
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  char
)

SPACESHIP_RPROMPT_ORDER=(
  node
  docker
  exec_time
)

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_HOST_SHOW_FULL=true
SPACESHIP_GIT_BRANCH_COLOR="blue"
SPACESHIP_NODE_COLOR="cyan"


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
	zsh-autosuggestions
    zsh-syntax-highlighting
    autojump
)
source $ZSH/oh-my-zsh.sh


# Use modern completion system
 autoload -U compinit; compinit

#zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
 zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=2
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true
## tab completion for PID :D
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
 zmodload zsh/complist
 compinit
 _comp_options+=(globdots)
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command '/usr/bin/ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#start ssh-agent during login session
#eval `ssh-agent`

# load .alias file
[ -f ~/.alias  ] && source ~/.alias

# load fzf key-binding and auto-completion
#
# Check OS version and set proper enviroment
#if [ "$(uname -s)" = "Linux" ]; then
if [[ $OSTYPE  = linux* ]]; then
	export FZF_OS_ENV_PATH="/usr/share/doc/fzf/examples/"
	export FD_FILENAME="fdfind" # fix Ubuntu fd naming difference
else
	export FZF_OS_ENV_PATH="/opt/homebrew/opt/fzf/shell/"
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

export FZF_DEFAULT_COMMAND="${FD_FILENAME} --ignore-file ${XDG_CONFIG_HOME}/fd/ignore ."
export FZF_DEFAULT_OPTS='--no-height --no-reverse'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND" 
#export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --margin 7,20"
export FZF_CTRL_T_OPTS="--preview '(batcat --color "always" {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --margin 7,20"
export FZF_ALT_C_COMMAND="${FD_FILENAME} -t d ." # search current directory only
export FZF_COMPLETION_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --margin 7,20" 

# fzf fuzzy completion ignore files define in .ignore file
_fzf_compgen_path() { 
  ${FD_FILENAME} --ignore-file ${XDG_CONFIG_HOME}/fd/ignore . "$1" }

_fzf_compgen_dir() { 
  ${FD_FILENAME} --type d --ignore-file ${XDG_CONFIG_HOME}/fd/ignore . "$1" }

# display hostname beginning of the prompt 
#export PROMPT='%m'$PROMPT

# key bindings
bindkey '^ ' autosuggest-accept # control-space to autocomplete suggestion

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
