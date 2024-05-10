## Deploying new Macs

1. add DOB to $HOME
2. install 1Password v8 fdirectly from Website first
3. setup 1Password since all the sshkeys are store there for github
4. setup 1Password developr setting to enable ssh-agent
5. export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
6. run ssh-add -l to verify the keys
7. pull dotfiles into $HOME

```console
git clone git@github.com:thomasjhchai/dotfiles.git ~/dotfiles        
```
4. run ~/dotfiles/bin/mac_deploy.sh


