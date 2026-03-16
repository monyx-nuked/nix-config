{
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      name = "nix-devshell";

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
      ];

      shellHook = ''
        cat ./res/devshell.txt
        devenv shell
      '';
    };
  };
}
