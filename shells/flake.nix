{
  description = "Development shells";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system} = {
        rust-stable = (import ./rust.nix { inherit pkgs; });
        java = (import ./java.nix { inherit pkgs; });
        java17 = (import ./java17.nix { inherit pkgs; });
      };
    };
}
