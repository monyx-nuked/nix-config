_: {
  # persystem: generate outputs per-system
  perSystem =
    { pkgs, ... }:
    {
      # devshell: basic devshell with programs
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          actionlint
          deadnix
          gum
          just
          nixpkgs-fmt
          shellcheck
          shfmt
          statix
          treefmt
        ];
      };
    };
}
