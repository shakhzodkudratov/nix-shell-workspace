# Nix shell workspace - collection of shell.nix scripts for development environments

## How to use
- select appropriate shell.nix from folders in this repo
- copy and paste into the root folder of your project
- type ```nix-shell``` in your terminal (append ```--run zsh``` if you're using not bash)
- profit

# What if this repo doesn't contain an application you needed?
- search your package in https://search.nixos.org/packages
- append ```<package-name>``` into ```buildInputs = []```

# What if stable nix-channel doesn't contain a package you need?
- goto https://www.nixhub.io/ and search for your package
- copy the hash of the nixpkgs reference
- copy and paste [nodejs_16/shell.nix](nodejs/nodejs_16/shell.nix) as a template into root folder of your project
- replace hash variable and append required package into ```buildInputs = []```
- if Nix is complaining about unfree, nodejs_16 template contain ```config.permittedInsecurePackages``` as an example
