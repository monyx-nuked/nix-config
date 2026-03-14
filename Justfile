# show flake
show:
    @nix flake show

show-arg arg:
    @nix flake show {{arg}}

# check the flake
check:
    @nix flake check

# repl inside the current flake
repl:
    @nix repl .

# repl with arguments
repl-arg arg:
    @nix repl {{arg}}