{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        hspkgs = pkgs.haskell.packages.ghc910;
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            hspkgs.ghc
            hspkgs.cabal-install
            pkgs.haskell-language-server 
            pkgs.zlib 
          ];
        };
      }
    );
}
