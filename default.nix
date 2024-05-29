{ stdenv, lib, fetchFromGitHub, buildDotnetModule, dotnetCorePackages, pkgconfig, binutils, icu, libGL, libX11, libXi, libICE, libSM, fontconfig, libgdiplus }:

buildDotnetModule rec {
  pname = "BlendFarm";
  version = "1.1.6";

  src = fetchFromGitHub {
    owner = "lyze237-forks";
    repo = "LogicReinc.BlendFarm";
    rev = "3def7bf152062a518ac8d88a37325a4c6ec831d0";
    sha256 = "yY0fZs4wYCwqCrzs1UwEPLxI4B1OIi6Mrtz3OYr9WpI=";
  };

  projectFile = "LogicReinc.BlendFarm/LogicReinc.BlendFarm.csproj";

  dotnet-sdk = dotnetCorePackages.sdk_6_0;
  dotnet-runtime = dotnetCorePackages.runtime_6_0;

  nugetDeps = ./deps.nix;

  meta = with lib; {
    description = "A stand-alone Blender Network Renderer";
    homepage = "https://github.com/lyze237-forks/LogicReinc.BlendFarm";
    license = licenses.gpl3;
    platforms = platforms.unix;
  };
  runtimeDeps = [ fontconfig icu libGL libX11 libXi libICE libSM fontconfig libgdiplus ];
}
