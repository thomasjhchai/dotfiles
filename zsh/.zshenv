# setting up config path based on XDG specification
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

export ZDOTDIR=$XDG_CONFIG_HOME/zsh


# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1

# check macos environment or linux environment
if [[ $OSTYPE = darwin* ]]; then
    # macos
    export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
elif [[ $OSTYPE = linux* ]]; then
    export SSH_AUTH_SOCK=~/.1password/agent.sock
fi

# set rust cargo env
. "$HOME/.cargo/env"
