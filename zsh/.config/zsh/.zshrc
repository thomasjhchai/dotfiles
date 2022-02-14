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
    export GOPATH=${XDG_DATA_HOME}/go
    export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$GOPATH/bin:$PATH
    
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
setopt HIST_IGNORE_ALL_DUPS                 # Do not put duplicated commands into history list 
setopt INC_APPEND_HISTORY                   # Add commands to history as they are typed, don't wait until shell exit
setopt HIST_REDUCE_BLANKS                   # Remove extra blanks from each command line being added to history

## Save the location of the current completion dump file.
## ------------------------------------------------------
export ZSH_COMPDUMP="${XDG_CACHE_HOME}/.zcompdump-${HOST}-${ZSH_VERSION}"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME}"


# SOURCE OTHER SUPPORTING FILES 
[ -f ${ZDOTDIR}/ohmyzsh_settings ] && source ${ZDOTDIR}/ohmyzsh_settings
[ -f ${ZDOTDIR}/zsh_aliases ] && source ${ZDOTDIR}/zsh_aliases # source alias after ohmyzsh to overide some of the builtin aliases

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

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


# key bindings - TODO fixed where to put
bindkey '^ ' autosuggest-accept # control-space to autocomplete suggestion

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
