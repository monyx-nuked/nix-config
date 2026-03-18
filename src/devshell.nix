{
  inputs,
  config,
  ...
}: {
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShellNoCC {
      name = "devshell";
      packages = with pkgs; [
        alejandra
        nixd
        nil
        nix-melt
        nix-tree
        nix-init
        nh
        deadnix
        statix
        manix
        optnix
        just
        gh
        fzf
        ripgrep
        fastfetch
      ];
      shellHook = ''
        fastfetch
      '';
    };
  };
}
