{
  description = " A stand-alone Blender Network Renderer ";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    system = "x86_64-linux";

  in {
    packages.${system} = {
      blendFarm = pkgs.callPackage ./default.nix { };
      default = self.packages.${system}.blendFarm;
    };

    apps.${system} = {
      blendFarm = {
        type = "app";
        program = "${self.packages.${system}.blendFarm}/bin/LogicReinc.BlendFarm";
      };
      blendFarm-server = {
        type = "app";
        program = "${self.packages.${system}.blendFarm}/bin/LogicReinc.BlendFarm.Server";
      };

      default = self.apps.${system}.blendFarm;
    };
  };
}
