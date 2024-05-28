let
  # Extract the lib folder from a package
  rust_overlay = import (builtins.fetchTarball
    "https://github.com/oxalica/rust-overlay/archive/master.tar.gz");
  nixpkgs = import <nixpkgs> { overlays = [ rust_overlay ]; };
  rust_channel = nixpkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml;
  getLibFolder = pkg: "${pkg}/lib";
  libiconvPath = "${nixpkgs.libiconv}/lib";
in
with nixpkgs;

pkgs.mkShell {
  nativeBuildInputs = [
    pkg-config
    pkgs.rustc
    pkgs.cargo

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
  RUST_SRC_PATH = "${rust_channel}/lib/rustlib/src/rust/library";

  shellHook = ''
    export PATH="$PATH:${rust_channel}/bin"
  '';
}

