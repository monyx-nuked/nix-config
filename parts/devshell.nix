{
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      name = "nix-devshell";

      packages = with pkgs; [
        devenv
      ];

      shellHook = ''
        cat ./res/devshell.txt
        alias devenv='devenv shell --tui "nu --no-std-lib --no-config-file"'
        devenv shell --tui "nu  --no-std-lib --no-config-file"
      '';
    };
  };
}
