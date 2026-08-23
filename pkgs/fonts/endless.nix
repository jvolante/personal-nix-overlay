{
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation {
  pname = "endless-font";
  version = "0.1";

  src = ../../assets/fonts;

  installPhase = ''
    runHook preInstall

    install -Dm644 -t $out/share/fonts/truetype endless-font.ttf

    runHook postInstall
  '';
}

