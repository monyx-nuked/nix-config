{inputs, ...}: {
  perSystem = {
    pkgs,
    config,
    ...
  }: {
    # devShells.default = pkgs.mkShell {
    #   name = "devenv";

    #   packages = with pkgs; [
    #     devenv
    #   ];

    #   shellHook = ''
    #     cat ${inputs.self.outPath}/res/devshell.txt
    #     alias devenvsn='devenv shell --tui "nu --no-std-lib --no-config-file"'
    #     alias devenvs='devenv shell --tui'
    #     devenv shell --tui # "nu --no-std-lib --no-config-file"
    #     exit
    #   '';
    # };
    devShells.default = let
      commonDevEnvModules = builtins.attrValues inputs.self.modules.devEnv;
    in
      inputs.devenv.lib.mkShell {
        inherit inputs pkgs;
        modules = commonDevEnvModules;
      };
  };
}
