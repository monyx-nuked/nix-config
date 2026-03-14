# List all the just commands
default:
    @just --list

# show flake
[group('nix')]
show:
    @nix flake show

# Update all flake inputs
[group('nix')]
up:
    nix flake update --commit-lock-file

# show flake with arguments
[group('nix')]
show-arg arg:
    @nix flake show {{arg}}

# check the flake
[group('nix')]
check:
    @nix flake check

# repl inside the current flake
[group('nix')]
repl:
    @nix repl .

# repl with arguments
[group('nix')]
repl-arg arg:
    @nix repl {{arg}}