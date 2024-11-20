{
  packageOverrides = pkgs: with pkgs; {
    devTools = pkgs.buildEnv {
      name = "leo.devTools";
      paths = [
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
        btop
        ctop
        wget
        powerline
        gnumake
        jq
      ];
    };
  };
}
