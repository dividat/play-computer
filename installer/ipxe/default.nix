{ stdenv, fetchgit
, lzma, binutils, mtools, syslinux, perl, cdrtools
, name ? "ipxe.usb"
}:
stdenv.mkDerivation {
  inherit name;

  buildInputs = [ lzma binutils mtools syslinux perl cdrtools ];
  
  src = fetchgit {
    url = "git://git.ipxe.org/ipxe.git";
    rev = "d2063b7693e0e35db97b2264aa987eb6341ae779";
    sha256 = "16sv591607v0anap63mw13d6gf4p98hb7w78npv3m041c2gbaldw";
  };

  hardeningDisable = [
    "stackprotector"
  ];

  patches = [
    ./init-reg.diff
    ./download-proto-https.diff
  ];

  buildPhase = ''
    cd src/
    make bin/ipxe.usb EMBED=${./embed.ipxe}
  '';

  installPhase = ''
    cp bin/ipxe.usb $out
  '';
}
