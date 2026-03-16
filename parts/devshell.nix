{
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      name = "nix-devshell";

      packages = with pkgs; [
        # Tools for Nix and NixOS systems
        alejandra
        nix-melt
        nix-tree
        nh
        deadnix
        # Options searchers
        manix
        optnix
        devenv
        nushell
      ];

      shellHook = ''
        cat ./res/devshell.txt
        exec nu --no-std-lib --no-config-file
      '';
    };
  };
}
