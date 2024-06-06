#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install nala 

sudo nala install \
	build-essential \
	zlib1g-dev \
    libssl-dev \
	libbz2-dev \
	libreadline-dev \
	libsqlite3-dev \
	llvm \
	libncurses5-dev \
	libncursesw5-dev \
	xz-utils \
	tk-dev \
	libffi-dev \
	liblzma-dev

sudo nala install \
	keychain \
	neofetch \
    zsh	\
	autojump \
	stow \
	eza \
    fortune \
    lolcat \
    cowsay \
    fd-find \
    fzf \
    bat \
    tree



# install ohmyzsh if .ohmyzsh folder doesn't exist
if [ ! -d "~/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended \
--keep-zshrc
    echo "oh-my-zsh installed"
else
    echo "oh-my-zsh already installed"
fi

# install zsh-autosuggestions
if [ ! -d "~/.oh-my-zsh/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo "zsh-autosuggestions installed"
    echo "zsh-autosuggestions enabled"
else
    echo "zsh-autosuggestions already exist"
fi

# install zsh-syntax-highlighting
if [ ! -d "~/.oh-my-zsh/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "zsh-syntax-highlighting installed"
    echo "zsh-syntax-highlighting enabled"
else
    echo "zsh-syntax-highlighting already exist"
fi

# install autojump
if [ ! -d "~/.oh-my-zsh/plugins/autojump" ]; then
    git clone https://github.com/wting/autojump.git "$HOME/.oh-my-zsh/custom/plugins/autojump"
    echo "autojump installed"
    echo "autojump enabled"
else
    echo "autojump already exist"
fi

# install ohmyzsh spaceship theme
if [ ! -d "~/.oh-my-zsh/themes/spaceship-prompt" ]; then
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt --depth=1
    ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme
    echo "spaceship-prompt installed"
    echo "spaceship-prompt enabled"
else
    echo "spaceship already exist"
fi



