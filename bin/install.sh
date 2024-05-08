#!/bin/bash

# Set the directory where your dotfiles are located
DOTFILES_DIR="$HOME/dotfiles"



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

# Install apps from Brewfile
if [ -f "$DOTFILES_DIR/Brewfile" ]; then
    echo "Installing apps from Brewfile..."
    brew bundle --file="$DOTFILES_DIR/Brewfile"
else
    echo "Brewfile not found in $DOTFILES_DIR. Skipping app installation."
fi

# Set the list of packages (directories) to be managed by Stow
PACKAGES=(nvim tmux zsh)

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
