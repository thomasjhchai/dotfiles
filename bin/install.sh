#!/usr/bin/env bash

if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
    test -d "${xpath}" && test -x "${xpath}" ; then 
        echo "xcode cli installed" ; 
else
    echo "Installing xcode cli tools
    xcode-select -install

    echo "Installing Homebrew"
    if ! [ -x "$(command -v brew)" ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi
fi

#<----------------Installing MacOS Apps, via Homebrew, Caks, & The App Store-------------------->
brew=(
    fzf
    htop
    neofetch
    neovim
    node
    python
    tmux
    tree
    wget
)

cask=(
    spotify
    docker
) #GUI apps that install with cask

brew update
brew upgrade

brew install ${brew[@]} #Homebrew App Installer
brew cask install ${cask[@]} #Casks Installer

cd ~
mkdir Repo
cd Repo
git clone https://github.com/makccr/dot

ln -s ~/Repo/dot/.config/ ~/.config
ln -s ~/Repo/dot/.tmux.conf ~/.tmux.conf
ln -s ~/Repo/dot/.bashrc ~/.bashrc
ln -s ~/Repo/dot/.profile ~/.profile
ln -s ~/Repo/dot/.bin/ ~/.bin
ln -s ~/Repo/dot/.gitconfig ~/.gitconfig

#Installing Vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo 'Run ":PlugInstall" to install NeoVim Plugins"
nvim +PlugInstall +qall

#echo 'Installation Complete'
echo 'Now you can make an SSH key:'
echo "Press CONTROL+C, if you don't want to"

ssh-keygen -t rsa -b 4096
