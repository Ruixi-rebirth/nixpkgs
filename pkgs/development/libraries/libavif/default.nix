{ lib, stdenv
, fetchFromGitHub
, libaom
, cmake
, pkg-config
, zlib
, libpng
, libjpeg
, dav1d
, libyuv
}:

stdenv.mkDerivation rec {
  pname = "libavif";
  version = "0.11.1";

  src = fetchFromGitHub {
    owner = "AOMediaCodec";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-mUi0DU99XV3FzUZ8/9uJZU+W3fc6Bk6+y6Z78IRZ9Qs=";
  };

  # reco: encode libaom slowest but best, decode dav1d fastest

  cmakeFlags = [
    "-DBUILD_SHARED_LIBS=ON"
    "-DAVIF_CODEC_AOM=ON" # best encoder (slow but small)
    "-DAVIF_CODEC_DAV1D=ON" # best decoder (fast)
    "-DAVIF_CODEC_AOM_DECODE=OFF"
    "-DAVIF_BUILD_APPS=ON"
  ];

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    libaom
    zlib
    libpng
    libjpeg
    dav1d
    libyuv
  ];

  meta = with lib; {
    description  = "C implementation of the AV1 Image File Format";
    longDescription = ''
      Libavif aims to be a friendly, portable C implementation of the
      AV1 Image File Format. It is a work-in-progress, but can already
      encode and decode all AOM supported YUV formats and bit depths
      (with alpha). It also features an encoder and a decoder
      (avifenc/avifdec).
    '';
    homepage    = "https://github.com/AOMediaCodec/libavif";
    changelog   = "https://github.com/AOMediaCodec/libavif/blob/v${version}/CHANGELOG.md";
    maintainers = with maintainers; [ mkg20001 ];
    platforms   = platforms.all;
    license     = licenses.bsd2;
  };
}
