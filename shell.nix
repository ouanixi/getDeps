{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc7101" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, atto-lisp, attoparsec, base, bytestring
      , directory, MissingH, parsec, QuickCheck, stdenv, stringable
      , tasty, tasty-quickcheck, xml
      }:
      mkDerivation {
        pname = "GetDebs";
        version = "0.1.0.0";
        src = ./.;
        isLibrary = false;
        isExecutable = true;
        buildDepends = [
          atto-lisp attoparsec base bytestring MissingH parsec stringable xml
        ];
        testDepends = [
          atto-lisp attoparsec base bytestring directory MissingH parsec
          QuickCheck stringable tasty tasty-quickcheck xml
        ];
        homepage = "http://chriswarbo.net/essays/repos/tree-features.html";
        description = "Feature extraction for tree structured data";
        license = stdenv.lib.licenses.gpl3;
      };

  drv = pkgs.haskell.packages.${compiler}.callPackage f {};

in

  if pkgs.lib.inNixShell then drv.env else drv
