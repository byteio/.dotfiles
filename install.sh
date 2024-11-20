################ NIX
#install nix
if [[ ! -n "$NIX_PROFILES" ]]; then
    sudo curl -L https://nixos.org/nix/install | sh
fi

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

nix-channel --update -v

if [ ! -f .ssh/id_rsa ]; then
    scp leo@stanley.dev:.ssh/id_rsa leo@stanley.dev:.ssh/id_rsa.pub .ssh/
fi

# install the bootstrap tools
nix-env -iA nixpkgs.stow
nix-env -iA nixpkgs.git

git clone git@github.com:byteio/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
################ STOW
#use stow to install dotfiles
stow git
stow tmux 
stow vim
stow zsh
stow nix

# we install these in logical groups to avoid using lots of memory at once
nix-env -iA nixpkgs.devTools
nix-env -iA nixpkgs.devUtils

################ MISC
#zsh as default shell
sudo command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh)

#download and install iosevka nerd fonts for Ubuntu Desktop
if [[ -n "$XDG_SESSION_DESKTOP" ]]; then
    wget -P /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
    unzip /tmp/Iosevka.zip -d ~/.fonts
    [ -f /usr/bin/fc-cache ] && sudo fc-cache
fi

#download and install iosevka nerd fonts for macOS
if [[ "$(uname)" == "Darwin" ]]; then
    wget -P /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
    unzip /tmp/Iosevka.zip -d ~/Library/Fonts
fi

[ -f /usr/bin/fc-cache ] && sudo fc-cache
mkdir ~/fz-notes
