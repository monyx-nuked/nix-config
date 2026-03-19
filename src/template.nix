{ inputs, ... }:
{
  flake.defaultTemplate = {
    path = inputs.self.outPath;
    description = "THIS IS NOT A TEMPLATE BUT TO COPY";
  };
}
