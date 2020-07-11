# Setup (for Ubuntu or Debian based Linux)

## Initial Setup
  - apt update && apt upgrade (root)
  - change remote server default hostname
    - sudo hostnamectl set-hostname <desire name>
    - edit /etc/hostname
  - create user and assign sudo priviledge (root)
      - useradd <username> 
      - usermod -aG sudo <username>
  - setup user shell
      - install zsh if not available
      - chsh -s /usr/bin/zsh <username> (change default shell)
      - install oh-my-zsh
          - install cobalt2 theme (source: https://github.com/wesbos/Cobalt2-iterm)
          - install powerline-font (for terminal to be able to display glyph)
          - install plugins for oh-my-zsh
              - zsh-autosuggestions (source: https://github.com/zsh-users/zsh-autosuggestions)
  - link all necessary config files from dotfiles (git clone from my repo first)
      - eg. ln -s ~/dotfiles/.zshrc .
  - setup ssh
      - server side
          - edit /etc/ssh/sshd_config
              set PermitRootLogin no
              set PasswordAuthentication no (note: when set to NO, can't do ssh-copy-id from client side)
          - sudo systemctl reload sshd.service
          
          - edit /etc/ssh/ssh_config
              set PasswordAuthentication no 
      - client side
          - ssh-keygen -t rsa -b 4096
          - ssh-copy-id <username>@<remote-server> OR copy id_rsa.pub key to remote authorized_keys file

  - setup nginx
  - setup Let's Encrypt
      - sudo add-apt-repository ppa:certbot/certbot
      - sudo apt-get install python-certbot-nginx
      - sudo ufw to add port to firewall  
      - more info at https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04

  - mosh server setup (for ipad access to remote server)
      - source: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-mosh-on-a-vps
      - ensure firewall access (sudo ufw allow 22/tcp && ufw allow 60000:61000/udp)

  - neovim or vim setup
      - install vim-plug (source: https://github.com/junegunn/vim-plug)


## Applications to install
  1)  zsh
  2)  oh-my-zsh
  3)  git 
  4)  htop
  5)  neovim (see above for plugin install)
  6)  fzf
  7)  fd (for macos) or fd-find (ubuntu) - for use with fzf
  8)  nodejs
  9)  python3 (if not available in the system)
  10) mosh
  11) tree
  12) tmux
  13) neofetch
  14) cmake (for macos)
  15) docker