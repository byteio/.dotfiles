################ NIX
#install nix
sudo curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

nix-env -iA \
  nixpkgs.neovim \
  nixpkgs.tmux \
  nixpkgs.zsh \
  nixpkgs.oh-my-zsh \
  nixpkgs.git \
  nixpkgs.stow \
  nixpkgs.tig \
  nixpkgs.direnv \
  nixpkgs.ripgrep \
  nixpkgs.nodejs \
  nixpkgs.rustup \
  nixpkgs.fzf \
  nixpkgs.fzf-zsh \
  nixpkgs.htop \
  nixpkgs.wget \
  nixpkgs.powerline \
  nixpkgs.gnumake \
  nixpkgs.gcc \
  nixpkgs.bpytop

################ STOW
#use stow to install dotfiles
stow git
stow tmux 
stow vim
stow zsh

################ MISC

#zsh as default shell
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh)

#install NVS
export NVS_HOME="$HOME/.nvs"
git clone https://github.com/jasongin/nvs "$NVS_HOME"

#download iosevka nerd fonts
wget -P /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
unzip /tmp/Iosevka.zip -d ~/.fonts

#install fonts on ubuntu
[ -f /usr/bin/fc-cache ] && sudo fc-cache
