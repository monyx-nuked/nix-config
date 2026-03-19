{inputs, ...}: {
  imports = with inputs.flake-parts.flakeModules; [
    modules
  ];
}
