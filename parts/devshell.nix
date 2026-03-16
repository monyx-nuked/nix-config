{
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      name = "nix-devshell";

      packages = with pkgs; [
        devenv
      ];

      shellHook = ''
        cat ./res/devshell.txt
        alias devenv='devenv shell "nu  --no-std-lib --no-config-file"'
        devenv shell "nu  --no-std-lib --no-config-file"
      '';
    };
  };
}
