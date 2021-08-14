# Macbook Pro Setup

## Applications via App Store
  2)  iAWriter
  3)  Telegram
  4)  WhatsApp
  5)  Magnet
  6)  Fantastical
  7)  HP Smart
  8)  Spark
  9)  Parallel
  10) Microsoft 365
  11) Microsoft 365
  12) Save To Pocket (Safari Extension)
  13) Messenger
  14) Drafts
  15) Margin Note 3
  16) Twitter
  17) XCode
  18) Good Notes 5
  19) PDF Pen Pro
  20) Nord VPN IKE
  21) Yoink


## Application via websites
  1)  VSCode
        for continuos scrolling when hitting h,j,k,l
        defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
  2)  Homebrew
  3)  Homebrew Cask (for Mac GUI apps)
       3.1)  dash (for API documentation)
       3.2)  docker
  4)  Chrome (via cask)
  5)  iTerm2
  6)  Cryptomator
  8)  Dropbox
  9)  Google Drive File Stream
  10) Logitech Option
  11) Spotify
  12) Fuse
  13) LastPass
  14) Evernote
  15) Bartender
  16) Hazel
  17) Alfred
  18) Kindle

## Setup

  iTerm
    1) download FiraCode font
    2) download gruvbox colorscheme

  CLI
    1) install oh-my-zsh
        chmod 755 /usr/local/share/zsh
        chmod 755 /usr/local/share/zsh/site-functions
        install cobalt2-theme
    2) pull dotfiles repo from git hub
        symlink 
          .zshrc
          .zprofile
          .alias
          .tmux.conf
          .gitconfig
          .config/nvim/init.vim
          .config/nvim/src
          .config/nvim/coc-settings.json

    3) setup neovim
        mkdir $HOME/.config/nvim
        install vim-plug

    4) mkdir Repositories folder for all the repos

  Brew
    1) Python
        - create sym link for python -> python3
        - create sym link for pip -> pip3
        - pip install
          - neovim
          - pipenv

    2) tmux
    3) htop
    4) neovim
    5) neofetch
    6) mosh
    7) fd
    8) tree
    9) fzf
    10) yarn
    11) ripgrep
    12) dash (via cask)
    13) node
    14) BetterTouchTool (via cask)
          GoldenChaos preset
    15) Firefox (via cask)

  Setup VSCode
    install Extension
      Settings Sync
        login to github gist and pull all the setting to local

