# OS SPECIFIC ENV SETTING
if [[ $OSTYPE  = darwin* ]]; then
    export BREW_PATH="/opt/homebrew/bin"
    export BREW_OPT_PATH="opt/homebrew/opt"

    export PATH=:$BREW_PATH:$HOME/.local/bin:$PATH

    ## env for nvm (macos)
    export NVM_DIR=$HOME/.nvm
    [ -s "$BREW_OPT_PATH/nvm/nvm.sh" ] && \. "$BREW_OPT_PATH/nvm/nvm.sh"  # This loads nvm
    [ -s "$BREW_OPT_PATH/nvm/etc/bash_completion.d/nvm" ] && \. "$BREW_OPT_PATH/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

    ## env for fzf (macos)
	export FZF_OS_ENV_PATH="/opt/homebrew/opt/fzf/shell/"
	export FD_FILENAME="fd" 
else
    export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH
    
    ## env for nvm (linux)
    export NVM_DIR="$HOME/.config/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    ## env for fzf (linux)
	export FZF_OS_ENV_PATH="/usr/share/doc/fzf/examples/"
	export FD_FILENAME="fdfind" # fix Ubuntu fd naming difference
fi

# COMMON ENV SETTING
#
## Path to your oh-my-zsh installation.
## -----------------------------------
export ZSH=$HOME/.oh-my-zsh

## Fixed tmux zsh autosuggestion bug
## ---------------------------------
export TERM=xterm-256color

# for mosh connection from Mac to server
# --------------------------------------
export LC_CTYPE="en_US.UTF-8"
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

## set default EDITOR
## ------------------
if type "nvim" > /dev/null; then
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi


# ZSH HISTORY
HISTFILE=$XDG_CACHE_HOME/zsh_history        # Keep our home directory neat by keeping the histfile somewhere else
SAVEHIST=5000                               # Big history
HISTSIZE=5000                               # Big history

setopt EXTENDED_HISTORY                     # Include more information about when the command was executed, etc
setopt APPEND_HISTORY                       # Allow multiple terminal sessions to all append to one zsh command history
setopt HIST_FIND_NO_DUPS                    # When searching history don't display results already cycled through twice
setopt HIST_EXPIRE_DUPS_FIRST               # When duplicates are entered, get rid of the duplicates first when we hit $HISTSIZE 
setopt HIST_IGNORE_SPACE                    # Don't enter commands into history if they start with a space
setopt HIST_VERIFY                          # makes history substitution commands a bit nicer. I don't fully understand
setopt SHARE_HISTORY                        # Shares history across multiple zsh sessions, in real time
setopt HIST_IGNORE_DUPS                     # Do not write events to history that are duplicates of the immediately previous event
setopt INC_APPEND_HISTORY                   # Add commands to history as they are typed, don't wait until shell exit
setopt HIST_REDUCE_BLANKS                   # Remove extra blanks from each command line being added to history

## Save the location of the current completion dump file.
## ------------------------------------------------------
if [ -z "$ZSH_COMPDUMP" ]; then
  ZSH_COMPDUMP="${XDG_CACHE_HOME}/.zcompdump-${HOST}-${ZSH_VERSION}"
fi


# SOURCE OTHER SUPPORTING FILES 
[ -f ${ZDOTDIR}/ohmyzsh_settings ] && source ${ZDOTDIR}/ohmyzsh_settings
[ -f ${ZDOTDIR}/zsh_aliases ] && source ${ZDOTDIR}/zsh_aliases

# ZSH AUTO COMPLETIONS 

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
# tab completion for PID :D
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zmodload zsh/complist
compinit
_comp_options+=(globdots)
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command '/usr/bin/ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# FZF SETTINGS

## Auto-completion
## ---------------

[[ $- == *i* ]] && source "${FZF_OS_ENV_PATH}/completion.zsh" 2> /dev/null

## Key bindings
## ---------------

source "${FZF_OS_ENV_PATH}/key-bindings.zsh" 2> /dev/null

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="${FD_FILENAME} --ignore-file ${XDG_CONFIG_HOME}/fd/ignore ."
export FZF_DEFAULT_OPTS='--no-height --no-reverse'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND" 
#export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --margin 7,20"
export FZF_CTRL_T_OPTS="--preview '(batcat --color "always" {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --margin 7,20"
export FZF_ALT_C_COMMAND="${FD_FILENAME} -t d ." # search current directory only
export FZF_COMPLETION_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --margin 7,20" 

## fzf fuzzy completion ignore files define in ignore file
## --------------------------------------------------------
_fzf_compgen_path() { 
  ${FD_FILENAME} --ignore-file ${XDG_CONFIG_HOME}/fd/ignore . "$1" }

_fzf_compgen_dir() { 
  ${FD_FILENAME} --type d --ignore-file ${XDG_CONFIG_HOME}/fd/ignore . "$1" }


