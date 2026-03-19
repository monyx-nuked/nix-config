{ inputs, ... }:
{
  # flake-parts: necessary for module system to work (specifically dendretic pattern)
  imports = [ inputs.flake-parts.flakeModules.modules ];
}
