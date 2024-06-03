if [[ $OSTYPE = linux* ]]; then
	### START-Keychain ###
	## Let  re-use ssh-agent and/or gpg-agent between logins
	
    # Check if 1Password is installed on Linux, and if not, use keychain to manage SSH keys.
    if [ "$(command -v op)" ]; then
        echo "1Password is installed on Linux"
    else
        if [ "$(command -v keychain)" ]; then
            eval $(keychain --eval --quiet $SSH_KEYS)
            echo "keychain added"
        fi
    fi

    # display login screen
    neofetch
    if [ -x /usr/games/cowsay -a -x /usr/games/fortune -a -x /usr/games/lolcat ]; then
        fortune | cowsay -f $(ls /usr/share/cowsay/cows | shuf -n1) | lolcat
    fi
elif [[ $OSTYPE = darwin* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    #
     # display login screen
    neofetch
    if [ -x /opt/homebrew/bin/cowsay -a -x /opt/homebrew/bin/fortune -a -x /opt/homebrew/bin/lolcat ]; then
        fortune | cowsay -f $(ls /opt/homebrew/share/cows/*.cow | shuf -n1) | lolcat
    fi
    
fi


if [ -f ~/.cargo/env ]; then
    . "$HOME/.cargo/env"
fi
