{
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      name = "nix-devshell";

      packages = with pkgs; [
        # Nix tooling
        nil # Nix language server
        hello

        # utilities
        git
        curl
        jq
      ];

      shellHook = ''
        cat ./res/devshell.txt
      '';
    };
  };
}
