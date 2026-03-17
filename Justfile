# Bold/color helpers
bold := `tput bold`
reset := `tput sgr0`
green := `tput setaf 2`
blue := `tput setaf 4`
yellow := `tput setaf 3`
cyan := `tput setaf 6`

# List all commands
[group('default')]
default:
    @just --list

# --- flake inspection ---

# 📦 Show flake outputs
[group('inspect')]
show:
    @echo "{{cyan}}📦 Showing flake outputs...{{reset}}"
    @nix flake show

# 📦 Show flake outputs for a specific flake
[group('inspect')]
show-arg arg:
    @echo "{{cyan}}📦 Showing flake outputs for {{arg}}...{{reset}}"
    @nix flake show {{arg}}

# ✅ Check flake for errors
[group('inspect')]
check:
    @echo "{{yellow}}🔍 Checking flake...{{reset}}"
    @nix flake check && echo "{{green}}✅ Flake is valid!{{reset}}"

# 🧪 Open a repl (default: current flake)
[group('inspect')]
repl arg=".":
    @echo "{{cyan}}🧪 Entering repl for {{arg}}...{{reset}}"
    @nix repl {{arg}}

# 📋 Show flake metadata (last modified, locked inputs etc)
[group('inspect')]
meta:
    @nix flake metadata


# --- development ---

# 🐚 Enter dev shell (default: current flake)
[group('dev')]
shell arg=".":
    @echo "{{green}}🐚 Entering dev shell...{{reset}}"
    @nix develop {{arg}}

# 🐚 Enter a specific dev shell by name
[group('dev')]
shell-pick which:
    @echo "{{green}}🐚 Entering dev shell '{{which}}'...{{reset}}"
    @nix develop .#{{which}}

# --- maintenance ---

# 🔄 Update all flake inputs and commit lock file
[group('maintenance')]
up:
    @echo "{{yellow}}🔄 Updating flake inputs...{{reset}}"
    @nix flake update --commit-lock-file && echo "{{green}}✅ Inputs updated and committed!{{reset}}"

# 🎨 Format nix files (default: current directory)
[group('maintenance')]
fmt arg=".":
    @echo "{{blue}}🎨 Formatting nix files in {{arg}}...{{reset}}"
    @nix fmt {{arg}} && echo "{{green}}✅ Done!{{reset}}"

# 🗑️  Garbage collect
[group('maintenance')]
gc:
    nix-collect-garbage -d
