{
  description = "effects-benchmark";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        haskellPackages = pkgs.haskellPackages;
      in
      rec
      {
        packages.effects-benchmark = # (ref:haskell-package-def)
          haskellPackages.callCabal2nix "effects-benchmark" ./. rec {
            # Dependency overrides go here
          };

        defaultPackage = packages.effects-benchmark;

        devShell =
          pkgs.mkShell {
            buildInputs = with haskellPackages; [
              haskell-language-server
              ghcid
              cabal-install
            ];
            inputsFrom = [
              self.defaultPackage.${system}.env
            ];
          };
      });
}
