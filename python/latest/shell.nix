# based on https://wiki.nixos.org/wiki/Python
{ pkgs ? let 
  nixpkgs-unstable = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  };
  in import nixpkgs-unstable {}
}: pkgs.mkShell {
  packages = [
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      # select Python packages here. can find more in https://search.nixos.org
      pandas
      requests
    ]))
  ];
}
