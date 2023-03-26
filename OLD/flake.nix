{
  description = "Emacs with broadway support and nativecomp";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages."aarch64-darwin".emacs = nixpkgs.emacs.overrideAttrs (oldAttrs: {
      name = "emacs-broadway-nativecomp";
      nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ nixpkgs.gcc ];
      configureFlags = [
        "--with-x-toolkit=broadway"
        "--with-cairo"
        "--with-modules"
        "--with-nativecomp"
      ];
      buildInputs = oldAttrs.buildInputs ++ [ nixpkgs.dbus-x11 ];
      propagatedBuildInputs = oldAttrs.propagatedBuildInputs ++ [ nixpkgs.dbus-x11 ];
      enableParallelBuilding = true;
      preConfigure = ''
        # workaround for broken configure script on M1 Macs
        sed -i 's/"-arch" "i686"//g' configure
      '';
    });
    dbus-x11 = nixpkgs.dbus-x11.overrideAttrs (oldAttrs: {
      configureFlags = oldAttrs.configureFlags ++ [
        "--disable-systemd"
        "--disable-tests"
      ];
    });

    defaultPackage."aarch64-darwin" = packages."aarch64-darwin".emacs;
  };
}
