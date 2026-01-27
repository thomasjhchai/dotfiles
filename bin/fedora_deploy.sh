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

sudo dnf update -y

DNF_PACKAGES=(
    keychain fastfetch zsh autojump stow 
    lsd fortune lolcat cowsay fd-find 
    fzf bat tree nvtop s-tui btop lm_sensors 1password moby-engine docker-compose tailscale ghostty neovim
)

echo "Starting installation..."

for pkg in "${DNF_PACKAGES[@]}"; do
    echo "Installing $pkg..."
    # --skip-broken handles dependency issues, -y handles prompts
    sudo dnf install -y "$pkg" || echo "⚠️  Failed to install $pkg, skipping..."
done

echo "✅ Installation process complete."
# Start and enable the service
echo "Enabling and starting Docker service..."
sudo systemctl enable --now docker


STOW_PACKAGES=(fd git nvim tmux zsh)

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
for package in "${STOW_PACKAGES[@]}"; do
    link_package "$package"
done

echo "All packages have been linked."
echo "All installation steps have been completed."

# Link all packages
echo "Linking all packages..."
for package in "${PACKAGES[@]}"; do
    link_package "$package"
done

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

chsh -s $(which zsh) $USER


