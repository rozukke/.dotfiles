{
  description = "Flake for mcpp village";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, ... }: flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [
      "x86_64-linux" "aarch64-darwin" "x86_64-darwin"
    ]; 
    perSystem = { config, self', inputs', pkgs, system, ... }: {
      devShells.default = pkgs.mkShell {
        name = "mcpp-village";

        packages = with pkgs; [
          cmake
          (stdenv.mkDerivation {
            name = "mcpp";
            src = builtins.fetchGit {
              name = "mcpp";
              url = "git@github.com:rozukke/mcpp.git";
              ref = "main";
              rev = "23566116d4a3a65291fc68e5d9dcd85d8387d9c8";
            };
            nativeBuildInputs = [ cmake ];
          })
        ];
      };
    };
  };
}
