{ pkgs ? let 
  nixpkgs-unstable = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  };
  in import nixpkgs-unstable {}
}: pkgs.mkShell {
  buildInputs = with pkgs; [
    go
    ginkgo
    go-migrate
    golangci-lint
    gopls
    delve
  ];

  GOROOT = "${pkgs.go}/share/go";
  GOBIN = "${pkgs.go}/share/go/bin";
  # https://discourse.nixos.org/t/golang-delve-debugger-with-nix-flake-issue/22740
  hardeningDisable = [ "all" ];
}
