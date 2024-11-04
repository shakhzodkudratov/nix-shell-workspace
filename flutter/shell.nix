{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  buildInputs = [
    pkgs.flutter
    pkgs.android-tools
  ];
}

