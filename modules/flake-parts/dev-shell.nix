_:
{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          just
          statix
          deadnix
          nixpkgs-fmt
        ];
      };
    };
}
