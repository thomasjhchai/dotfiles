

if [[ $OSTYPE = linux* ]]; then
	### START-Keychain ###
	## Let  re-use ssh-agent and/or gpg-agent between logins
	export HOSTNAME="$(uname -n)"
	/usr/bin/keychain $HOME/.ssh/id_rsa
	source $HOME/.keychain/$HOSTNAME-sh
	#### End-Keychain ###
fi

