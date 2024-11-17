{
  packageOverrides = pkgs: with pkgs; {
    bootstrapTools = pkgs.buildEnv {
      name = "leo.bootstrapTools";
      paths = [
        stow
      ];
    };

    devTools = pkgs.buildEnv {
      name = "leo.devTools";
      paths = [
        git
        zsh
        neovim
        tmux
        tig
        direnv
        oh-my-zsh
        ripgrep 
        fzf
        fzf-zsh
        gcc
        proto
      ];
    };

    devUtils = pkgs.buildEnv {
      name = "leo.devUtils";
      paths = [
        htop
        wget
        powerline
        gnumake
        btop
        ctop
        jq
      ];
    };
  };
}
