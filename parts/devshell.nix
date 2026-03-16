{
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      name = "nix-devshell";

      packages = with pkgs; [
        devenv
      ];

      shellHook = ''
        cat ./res/devshell.txt
        alias devenvs='devenv shell --tui "nu --no-std-lib --no-config-file"'
        alias devenv='devenv shell --tui'
        devenvs
      '';
    };
  };
}
