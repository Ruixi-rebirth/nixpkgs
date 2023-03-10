{ lib
, mkDerivation
, fetchFromGitHub
, pkg-config
, qtbase
, qtsvg
, qtcharts
, wrapQtAppsHook
, cmake
, python3
}:

mkDerivation rec {
  pname = "ripes";
  version = "2.2.6";

  src = fetchFromGitHub {
    owner = "mortbopet";
    repo = "Ripes";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-fRkab0G2zjK1VYzH21yhL7Cr0rS4I8ir8gwH9ALy60A=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
    wrapQtAppsHook
  ];

  buildInputs = [
    qtbase
    qtsvg
    qtcharts
  ];

  installPhase = ''
    install -D Ripes $out/bin/Ripes
    cp -r ${src}/appdir/usr/share $out/share
  '';

  meta = with lib; {
    description = "A graphical processor simulator and assembly editor for the RISC-V ISA";
    homepage = "https://github.com/mortbopet/Ripes";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ rewine ];
  };
}
