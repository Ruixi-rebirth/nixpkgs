{ lib
, stdenv
, fetchFromGitHub
, nix-update-script
, fetchpatch
, vala
, meson
, ninja
, pkg-config
, python3
, libgee
, gsettings-desktop-schemas
, gnome
, pantheon
, wrapGAppsHook
, gtk3
, json-glib
, glib
, glib-networking
, libhandy
}:

stdenv.mkDerivation rec {
  pname = "tootle";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "bleakgrey";
    repo = pname;
    rev = version;
    sha256 = "NRM7GiJA8c5z9AvXpGXtMl4ZaYN2GauEIbjBmoY4pdo=";
  };

  patches = [
    # Adhere to GLib.Object naming conventions for properties
    # https://github.com/bleakgrey/tootle/pull/339
    (fetchpatch {
      url = "https://git.alpinelinux.org/aports/plain/community/tootle/0001-Adhere-to-GLib.Object-naming-conventions-for-propert.patch?id=001bf1ce9695ddb0bbb58b44433d54207c15b0b5";
      sha256 = "sha256-B62PhMRkU8P3jmnIUq1bYWztLtO2oNcDsXnAYbJGpso=";
    })
    # Use reason_phrase instead of get_phrase
    # https://github.com/bleakgrey/tootle/pull/336
    (fetchpatch {
      url = "https://git.alpinelinux.org/aports/plain/community/tootle/0002-Use-reason_phrase-instead-of-get_phrase.patch?id=001bf1ce9695ddb0bbb58b44433d54207c15b0b5";
      sha256 = "sha256-rm5NFLeAL2ilXpioywgCR9ppoq+MD0MLyVaBmdzVkqU=";
    })
    # Application: make app_entries private
    # https://github.com/bleakgrey/tootle/pull/346
    (fetchpatch {
      url = "https://git.alpinelinux.org/aports/plain/community/tootle/0003-make-app-entries-private.patch?id=c973e68e3cba855f1601ef010afa9a14578b9499";
      sha256 = "sha256-zwU0nxf/haBZl4tOYDmMzwug+HC6lLDT8/12Wt62+S4=";
    })
    # https://github.com/flathub/com.github.bleakgrey.tootle/pull/22
    (fetchpatch {
      url = "https://github.com/flathub/com.github.bleakgrey.tootle/raw/6b524dc13143e4827f67628e33dcf161d862af29/Fix-construct-prop.patch";
      sha256 = "sha256-zOIMy9+rY2aRcPHcGWU/x6kf/xb7VnuHdsKQ0FO1Cyc=";
    })
  ];

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    python3
    vala
    wrapGAppsHook
  ];

  buildInputs = [
    glib
    glib-networking
    gnome.libsoup
    gsettings-desktop-schemas
    gtk3
    json-glib
    libgee
    pantheon.granite
    libhandy
  ];

  postPatch = ''
    chmod +x meson/post_install.py
    patchShebangs meson/post_install.py
  '';

  passthru = {
    updateScript = nix-update-script { };
  };

  meta = with lib; {
    description = "Simple Mastodon client designed for elementary OS";
    homepage = "https://github.com/bleakgrey/tootle";
    license = licenses.gpl3;
    maintainers = with maintainers; [ dtzWill ];
    platforms = platforms.linux;
  };
}
