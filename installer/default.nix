with import <nixpkgs> {};
let
  ipxe = 
      (import ./ipxe {
        inherit stdenv fetchgit;
        inherit lzma binutils mtools syslinux perl cdrtools; 
      });
in
stdenv.mkDerivation rec {
  name = "play-computer-installer";
  buildInputs = [
    awscli
  ];

  src = ./.;

  shellHook = ''
    export IPXE_USB=${ipxe}

    # Setup build directory
    export out=$(pwd)/build
  '';

  configurePhase = ''
    export IPXE_USB=${ipxe}
  '';
}
