{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      name = "devenv";

      packages = with pkgs; [
        fastfetch
        devenv
      ];

      shellHook = ''
        cat ${inputs.self.outPath}/res/devshell.txt
        alias devenvsn='devenv shell --tui "nu --no-std-lib --no-config-file"'
        alias devenvs='devenv shell --tui'
        fastfetch
        devenv shell --tui "nu --no-std-lib --no-config-file"
        exit
      '';
    };
  };
}
