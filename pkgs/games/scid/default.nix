{ lib, fetchurl, tcl, tk, libX11, zlib, makeWrapper }:

tcl.mkTclDerivation {
  pname = "scid";
  version = "4.3";

  src = fetchurl {
    url = "mirror://sourceforge/scid/scid-4.3.tar.bz2";
    sha256 = "0zb5qp04x8w4gn2kvfdfq2p44kmzfcqn7v167dixz6nlyxg41hrw";
  };

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [ tk libX11 zlib ];

  prePatch = ''
    sed -i -e '/^ *set headerPath *{/a ${tcl}/include ${tk}/include' \
           -e '/^ *set libraryPath *{/a ${tcl}/lib ${tk}/lib' \
           -e '/^ *set x11Path *{/a ${libX11}/lib/' \
           configure

    sed -i -e '/^ *set scidShareDir/s|\[file.*|"'"$out/share"'"|' \
      tcl/config.tcl
  '';

  configureFlags = [
    "BINDIR=$(out)/bin"
    "SHAREDIR=$(out)/share"
  ];

  hardeningDisable = [ "format" ];

  dontPatchShebangs = true;

  # TODO: can this use tclWrapperArgs?
  postFixup = ''
    for cmd in sc_addmove sc_eco sc_epgn scidpgn \
               sc_import sc_spell sc_tree spliteco
    do
      sed -i -e '1c#!'"$out"'/bin/tcscid' "$out/bin/$cmd"
    done

    sed -i -e '1c#!${tcl}/bin/tcslsh' "$out/bin/spf2spi"
    sed -i -e '1c#!${tk}/bin/wish' "$out/bin/sc_remote"
    sed -i -e '1c#!'"$out"'/bin/tkscid' "$out/bin/scid"

    for cmd in $out/bin/*
    do
      wrapProgram "$cmd" \
        --set TK_LIBRARY "${tk}/lib/${tk.libPrefix}"
    done
  '';

  meta = {
    description = "Chess database with play and training functionality";
    maintainers = with lib.maintainers; [ agbrooks ];
    homepage = "https://scid.sourceforge.net/";
    license = lib.licenses.gpl2;
  };
}
