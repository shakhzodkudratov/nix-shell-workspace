{ pkgs ? import <nixpkgs> { } }:

let
  # Extract the lib folder from a package
  getLibFolder = pkg: "${pkg}/lib";
  libiconvPath = "${pkgs.libiconv}/lib";
in
pkgs.mkShell {
  buildInputs = [
    pkgs.rustup

    # Required for building the project
    pkgs.libiconv
    pkgs.llvmPackages.llvm
    pkgs.llvmPackages.clang
  ];

  # Set the LD_LIBRARY_PATH so that the dynamic linker can find shared libraries
  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    (getLibFolder pkgs.llvmPackages.llvm)
    libiconvPath
  ];

  NIX_LDFLAGS = "-L${libiconvPath}"; # -L${./lib}
  RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
}

