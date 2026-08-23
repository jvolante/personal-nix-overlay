{ pkgs, ... }:
let
  video-player = "celluloid.desktop";
  video-player-drv = pkgs.celluloid;
in
{
  home.packages = [
    video-player-drv
  ];

  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "video/x-ogm+ogg" = [ video-player ];
    "video/3gp" = [ video-player ];
    "video/3gpp" = [ video-player ];
    "video/3gpp2" = [ video-player ];
    "video/dv" = [ video-player ];
    "video/divx" = [ video-player ];
    "video/fli" = [ video-player ];
    "video/flv" = [ video-player ];
    "video/mp2t" = [ video-player ];
    "video/mp4" = [ video-player ];
    "video/mp4v-es" = [ video-player ];
    "video/mpeg" = [ video-player ];
    "video/mpeg-system" = [ video-player ];
    "video/msvideo" = [ video-player ];
    "video/ogg" = [ video-player ];
    "video/quicktime" = [ video-player ];
    "video/vivo" = [ "org.gnome.Totem.desktop" ];
    "video/vnd.divx" = [ video-player ];
    "video/vnd.mpegurl" = [ video-player ];
    "video/vnd.rn-realvideo" = [ video-player ];
    "video/vnd.vivo" = [ "org.gnome.Totem.desktop" ];
    "video/webm" = [ video-player ];
    "video/x-anim" = [ video-player ];
    "video/x-avi" = [ video-player ];
    "video/x-flc" = [ video-player ];
    "video/x-fli" = [ video-player ];
    "video/x-flic" = [ "org.gnome.Totem.desktop" ];
    "video/x-flv" = [ video-player ];
    "video/x-m4v" = [ video-player ];
    "video/x-matroska" = [ video-player ];
    "video/x-mjpeg" = [ "org.gnome.Totem.desktop" ];
    "video/x-mpeg" = [ video-player ];
    "video/x-mpeg2" = [ video-player ];
    "video/x-ms-asf" = [ video-player ];
    "video/x-ms-asf-plugin" = [ video-player ];
    "video/x-ms-asx" = [ video-player ];
    "video/x-msvideo" = [ video-player ];
    "video/x-ms-wm" = [ video-player ];
    "video/x-ms-wmv" = [ video-player ];
    "video/x-ms-wmx" = [ video-player ];
    "video/x-ms-wvx" = [ video-player ];
    "video/x-nsv" = [ video-player ];
    "video/x-theora" = [ video-player ];
    "video/x-theora+ogg" = [ video-player ];
    "video/x-totem-stream" = [ "org.gnome.Totem.desktop" ];
    "video/x-ogm" = [ video-player ];
    "video/avi" = [ video-player ];
    "video/x-mpeg-system" = [ video-player ];
  };
}
