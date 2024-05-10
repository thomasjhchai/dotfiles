#!/bin/bash

# Set the directory where your dotfiles are located
DOTFILES_DIR="$HOME/dotfiles"

# Make a dotfiles directory if it doesn't already exist
if [! -d "$DOTFILES_DIR" ]; then
    mkdir -p "$DOTFILES_DIR"
    echo "Created $DOTFILES_DIR"
else
    echo "$DOTFILES_DIR already exists"
fi

# Check if Xcode Command Line Tools are installed
if ! xcode-select --install &> /dev/null; then
    echo "Xcode Command Line Tools are not installed. Installing now..."

    # Install Xcode Command Line Tools
    sudo xcode-select --install

    # Wait for the installation to complete
    while sudo /usr/bin/xcode-select --install &> /dev/null; do
        echo "Installing Xcode Command Line Tools..."
        sleep 5
    done

    echo "Xcode Command Line Tools installation complete."
else
    echo "Xcode Command Line Tools are already installed."
fi


# Install Homebrew if not already installed
echo "Installing Homebrew"
    if ! [ -x "$(command -v brew)" ]; then
    echo "Installing Homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/tjunkie/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
source ~/.zprofile

# Install apps from Brewfile
if [ -f "$DOTFILES_DIR/Brewfile" ]; then
    echo "Installing apps from Brewfile..."
    brew bundle --file="$DOTFILES_DIR/Brewfile"
else
    echo "Brewfile not found in $HOME. Skipping app installation."
fi
 

# Set the list of packages (directories) to be managed by Stow
PACKAGES=(alacritty karabiner fd git nvim tmux zsh)

# Function to link a package using Stow
link_package() {
    local package="$1"
    
    # Check if the package directory exists
    if [ ! -d "$DOTFILES_DIR/$package" ]; then
        echo "Error: Package directory '$package' not found in '$DOTFILES_DIR'"
        return 1
    fi
    
    # Link the package
    stow -vt "$HOME" "$package" -d "$DOTFILES_DIR"
    echo "Linked package '$package'"
}

# Link all packages
echo "Linking all packages..."
for package in "${PACKAGES[@]}"; do
    link_package "$package"
done

echo "All packages have been linked."
echo "All installation steps have been completed."

# TODO: double check below

# install ohmyzsh if .ohmyzsh folder doesn't exist
if [ ! -d "~/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
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
    git clone https://github.com/wting/autojump.git "$HOME/.oh-my-zsh/plugins/autojump"
    echo "autojump installed"
    echo "autojump enabled"
else
    echo "autojump already exist"
fi

# install ohmyzsh spaceship theme
if [ ! -d "~/.oh-my-zsh/themes/spaceship-prompt" ]; then
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    echo "spaceship-prompt installed"
    echo "spaceship-prompt enabled"
else
    echo "spaceship already exist"
fi








