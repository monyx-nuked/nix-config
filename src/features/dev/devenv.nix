_: {
  flake.modules.homeManager.devenv = {pkgs, ...}: {
    home.packages = with pkgs; [
      devenv
    ];
  };
  flake.modules.devEnv.default = {pkgs, ...}: {
    packages = with pkgs; [
      # Tools for Nix and NixOS systems
      alejandra
      nil
      nix-melt
      nix-tree
      nh
      deadnix
      statix
      # Options searchers
      manix
      optnix
      devenv
      # nushell
      # Utilites
      just
      gh
      lazygit
      bat
      eza
      fastfetch
      fzf
      ripgrep
    ];

    enterShell = ''
      echo "Welcome to devenv!"
      echo "This devshell is created to work on my nix-configuration"
      echo "Git version:"
      git --version
      alias cat='bat'
      alias ls='eza --icons'
      clear
      fastfetch
    '';
  };
}
