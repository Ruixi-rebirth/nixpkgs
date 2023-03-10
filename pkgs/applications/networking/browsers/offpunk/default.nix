{
  fetchFromSourcehut,
  installShellFiles,
  less,
  lib,
  makeWrapper,
  offpunk,
  python3,
  stdenv,
  testers,
  timg,
  xdg-utils,
  xsel,
}:

let
  pythonDependencies = with python3.pkgs; [
    beautifulsoup4
    cryptography
    feedparser
    pillow
    readability-lxml
    requests
    setproctitle
  ];
  otherDependencies = [
    less
    timg
    xdg-utils
    xsel
  ];
in
stdenv.mkDerivation (finalAttrs: {
  pname = "offpunk";
  version = "1.9";

  src = fetchFromSourcehut {
    owner = "~lioploum";
    repo = "offpunk";
    rev = "v${finalAttrs.version}";
    sha256 = "sha256-sxX4/7jbNbLwHVfE1lDtjr/luby5zAf6Hy1RcwXZLBA=";
  };

  nativeBuildInputs = [ makeWrapper installShellFiles ];
  buildInputs = otherDependencies ++ pythonDependencies;

  installPhase = ''
    runHook preInstall

    install -D ./offpunk.py $out/bin/offpunk

    wrapProgram $out/bin/offpunk \
        --set PYTHONPATH "$PYTHONPATH" \
        --set PATH ${lib.makeBinPath otherDependencies}

   installManPage man/*.1
   runHook postInstall
  '';

  passthru.tests.version = testers.testVersion { package = offpunk; };

  meta = with lib; {
    description = "An Offline-First browser for the smolnet ";
    homepage = finalAttrs.src.meta.homepage;
    maintainers = with maintainers; [ DamienCassou ];
    platforms = platforms.linux;
    license = licenses.bsd2;
  };
})
