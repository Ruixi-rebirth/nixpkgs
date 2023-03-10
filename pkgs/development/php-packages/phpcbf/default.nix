{ mkDerivation, fetchurl, lib, php, makeWrapper }:

let
  pname = "phpcbf";
  version = "3.7.1";
in
mkDerivation {
  inherit pname version;

  src = fetchurl {
    url = "https://github.com/squizlabs/PHP_CodeSniffer/releases/download/${version}/phpcbf.phar";
    sha256 = "sha256-yTwOg8vaIcIfhJzPD0tCl50gAEpaYXLtDqJw7Keub6g=";
  };

  dontUnpack = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    install -D $src $out/libexec/phpcbf/phpcbf.phar
    makeWrapper ${php}/bin/php $out/bin/phpcbf \
      --add-flags "$out/libexec/phpcbf/phpcbf.phar"
    runHook postInstall
  '';

  meta = with lib; {
    changelog = "https://github.com/squizlabs/PHP_CodeSniffer/releases/tag/${version}";
    description = "PHP coding standard beautifier and fixer";
    license = licenses.bsd3;
    homepage = "https://squizlabs.github.io/PHP_CodeSniffer/";
    maintainers = with maintainers; [ cmcdragonkai ] ++ teams.php.members;
  };
}
