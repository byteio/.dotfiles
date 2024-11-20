################ NIX
#install nix
if [[ ! -n "$NIX_PROFILES" ]]; then
    sudo curl -L https://nixos.org/nix/install | sh
fi

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# we install these in logical groups to avoid using lots of memory at once
nix-env -iA nixpkgs.bootstrapTools
nix-env -iA nixpkgs.devTools
nix-env -iA nixpkgs.devUtils

################ STOW
#use stow to install dotfiles
stow git
stow tmux 
stow vim
stow zsh
stow nix

################ MISC

#zsh as default shell
sudo command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh)


#download iosevka nerd fonts
wget -P /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
unzip /tmp/Iosevka.zip -d ~/.fonts

#install fonts on ubuntu
[ -f /usr/bin/fc-cache ] && sudo fc-cache
