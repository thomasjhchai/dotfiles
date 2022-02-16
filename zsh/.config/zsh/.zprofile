

if [[ $OSTYPE = linux* ]]; then
	### START-Keychain ###
	## Let  re-use ssh-agent and/or gpg-agent between logins
	export HOSTNAME="$(uname -n)"
	/usr/bin/keychain $HOME/.ssh/id_rsa
	source $HOME/.keychain/$HOSTNAME-sh
	#### End-Keychain ###
elif [[ $OSTYPE = darwin* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    ssh-add --apple-use-keychain ~/.ssh/id_rsa
fi

# display login screen
neofetch

if [ -x /usr/games/cowsay -a -x /usr/games/fortune -a -x /usr/games/lolcat ]; then
    fortune | cowsay -f $(ls /usr/share/cowsay/cows | shuf -n1) | lolcat
fi
