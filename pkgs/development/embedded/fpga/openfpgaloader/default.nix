{ stdenv
, lib
, fetchFromGitHub
, cmake
, pkg-config
, libftdi1
, libusb1
, udev
, hidapi
, zlib
}:

stdenv.mkDerivation rec {
  pname = "openfpgaloader";
  version = "0.10.0";

  src = fetchFromGitHub {
    owner = "trabucayre";
    repo = "openFPGALoader";
    rev = "v${version}";
    sha256 = "sha256-MPIFD7/jUEotY/EhuzNhaz8C3LVMxUr++fhtCpbbz0o=";
  };

  nativeBuildInputs = [ cmake pkg-config ];

  buildInputs = [
    libftdi1
    libusb1
    udev
    hidapi
    zlib
  ];

  meta = with lib; {
    description = "Universal utility for programming FPGAs";
    homepage = "https://github.com/trabucayre/openFPGALoader";
    license = licenses.agpl3Only;
    maintainers = with maintainers; [ danderson ];
  };
}
