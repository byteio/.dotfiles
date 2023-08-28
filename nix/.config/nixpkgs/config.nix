{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "leo";
      paths = [
        neovim
        tmux
        zsh
        oh-my-zsh
        git
        stow
        tig
        direnv
        ripgrep 
        nodejs
        rustup 
        cargo-llvm-cov
        fzf
        fzf-zsh
        htop
        wget
        powerline
        gnumake
        gcc
        btop
        jq
        conda
      ];
    };
  };
}
