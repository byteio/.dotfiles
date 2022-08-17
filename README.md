.dotfiles
====================

My portable dev environment.

## How It Works

`cd` into the `.dotfiles.` directory and run `install.sh` to get things going in a fresh environment.

### nix

The [nix package manager](https://github.com/NixOS/nix) is used to install the development tools and packages. 

Nix is ideal here because it provides portable and reproducable package installations to various *nix platforms. Packages roll up their own dependencies in private package repositories on disk that are namespaced using a hash of their dependencies. The result is that many version of the same package can co-exist on the system regardless of what is already installed: and everything just works. 

### stow

The gnu stow package allows one to [trivially manage dotfiles](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) and their installation into your home directory. 

Stow automatically symlinks the dotfiles into their necessary locations in your home directory from a centralized location that can be easily managed using git (hence the directory structure of this repository), check out `install.sh` to get an idea of how it works.

### misc

Ad-hoc extras that are nice to have.
