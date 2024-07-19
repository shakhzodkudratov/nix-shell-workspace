{ pkgs ? let
    # https://www.nixhub.io/packages/nodejs
    hash = "a71323f68d4377d12c04a5410e214495ec598d4c";
    nixpkgs = fetchTarball {
      url = "https://github.com/nixos/nixpkgs/archive/${hash}.tar.gz";
    };
  in
    import nixpkgs {
      overlays = [];
      config.permittedInsecurePackages = [
        "nodejs-16.20.2"
      ];
    }
}:
pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs_16
  ];
}
