{ pkgs ? import <nixpkgs> { } }: pkgs.mkShell {
  buildInputs = [
    pkgs.go
  ];

  GOROOT = "${pkgs.go}/share/go";
  GOBIN = "${pkgs.go}/share/go/bin";
}
