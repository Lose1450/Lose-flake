{ lib, python3Packages, fetchurl }:

python3Packages.buildPythonApplication rec {
  pname = "csvmusic";
  version = "1.7.6";
  pyproject = true;

  src = fetchurl {
    url = "https://github.com/angall1/CSVMusic/releases/download/v${version}/csvmusic-${version}.tar.gz";
    sha256 = "sha256-08AOP7HskQ5hGk9WRi2WVEtcsVcOunC6biXKyH7e2Bg=";
  };

  build-system = with python3Packages; [ setuptools wheel ];

  dependencies = with python3Packages; [
    pyside6
    yt-dlp
    ytmusicapi
    mutagen
    requests
    pandas
  ];

  # PySide6 apps often need this so Qt can find its plugins at runtime
  # dontWrapQtApps = false;  # uncomment/adjust if using qt6.wrapQtAppsHook

  meta = with lib; {
    description = "Convert Spotify playlists to MP3/M4A via YouTube Music";
    homepage = "https://github.com/angall1/CSVMusic";
    license = licenses.mit;
    platforms = platforms.unix;
    mainProgram = "csvmusic";
  };
}
