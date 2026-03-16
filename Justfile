# List all the just commands
[group('default')]
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
showw arg:
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
repll arg:
    @nix repl {{arg}}

# dev-shell on current-dir
[group('nix')]
develop:
    @nix develop .

# dev-shell on current-dir (choose the reference)
[group('nix')]
developp which:
    @nix develop .#{{which}}

# dev-shelll with your own arguments
[group('nix')]
developpp arg:
    @nix develop {{arg}}