{ mkDerivation, atto-lisp, attoparsec, base, bytestring, directory
, MissingH, parsec, QuickCheck, stdenv, stringable, tasty, aeson
, tasty-quickcheck, xml
}:
mkDerivation {
  pname = "GetDebs";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    atto-lisp attoparsec base bytestring MissingH parsec stringable xml aeson
  ];
  testDepends = [
    atto-lisp attoparsec base bytestring directory MissingH parsec
    QuickCheck stringable tasty tasty-quickcheck xml
  ];
  homepage = "http://chriswarbo.net/essays/repos/tree-features.html";
  description = "Feature extraction for tree structured data";
  license = stdenv.lib.licenses.gpl3;
}
