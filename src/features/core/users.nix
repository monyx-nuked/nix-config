_: {
  flake.modules.nixos.users =
    {
      lib,
      pkgs,
      ...
    }:
    {
      users.mutableUsers = true;
      users.users.monyx = {
        description = "Muhammad Iso";
        extraGroups = [ "disk" ];
        group = "users";
        initialHashedPassword = lib.mkDefault "$6$MVEeUt8NyzjVug0a$9KQZWFATILxxfck.1Ra8RXiUbcXCnloXdbl2kP0fJ.hY0PteweOLWwJRl1/aUOHTHZSxr7Fwcz21BAhLbaqQh1";
        isNormalUser = true;
        shell = pkgs.fish;
        # hashedPassword = lib.mkDefault "";
      };
      # Default Editor for root
      programs.vim = {
        defaultEditor = true;
        enable = true;
      };
      # Enable fish for root
      programs.fish.enable = true;
    };
}
