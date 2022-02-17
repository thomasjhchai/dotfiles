

if [[ $OSTYPE = linux* ]]; then
	### START-Keychain ###
	## Let  re-use ssh-agent and/or gpg-agent between logins
	export HOSTNAME="$(uname -n)"
	/usr/bin/keychain $HOME/.ssh/id_rsa
	source $HOME/.keychain/$HOSTNAME-sh
	#### End-Keychain ###

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

    ssh-add --apple-use-keychain ~/.ssh/id_rsa
fi


