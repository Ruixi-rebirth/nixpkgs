{ lib, stdenv, fetchFromGitHub, getent }:

stdenv.mkDerivation rec {
  pname = "papirus-folders";
  version = "1.12.1";

  src = fetchFromGitHub {
    owner = "PapirusDevelopmentTeam";
    repo = "papirus-folders";
    rev = "v${version}";
    sha256 = "sha256-Dus9f2m5Wj46Url7N3UYEvBAankppzGzdJHGPH3CT3g=";
  };

  buildInputs = [
    getent
  ];

  makeFlags = [ "PREFIX=${placeholder "out"}" ];

  patchPhase = ''
    substituteInPlace ./papirus-folders --replace "getent" "${getent}/bin/getent"
  '';

  meta = with lib; {
    description = "A tool to change papirus icon theme color";
    longDescription = ''
      papirus-folders is a bash script that allows changing the color of
      folders in Papirus icon theme and its forks (which based on version 20171007 and newer).
    '';
    homepage = "https://github.com/PapirusDevelopmentTeam/papirus-folders";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = [ maintainers.aacebedo ];
  };
}
