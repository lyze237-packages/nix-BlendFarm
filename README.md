This is a nix package for `LogicReinc.BlendFarm`

To run the client execute `nix run github:lyze237-packages/nix-BlendFarm` in an empty folder.

To run the server exceute `nix run github:lyze237-packages/nix-BlendFarm#blendFarm-server` in an empty folder and open port 15000 if needed.

The project right now works on a forked version of the LogicReinc.BlendFarm repo, as that one doesn't want to run on NixOS due to a straange nuget dependency.
