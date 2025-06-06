{ lib, config, ... }: 

{
  options = {
    zapretPreset.enable =
      lib.mkEnableOption "enable zapret module";
  };

  config = lib.mkIf config.zapretPreset.enable {
    services = {
      zapret = {
        enable = true;
        udpPorts = [ "50000:65535" "27015:27050" ];
        udpSupport = true;
        params = [
          "--dpi-desync-autottl=3"
          "--wssize 1:6"
          "--dpi-desync-fake-tls=0x00000000"
          "--dpi-desync-split-pos=1"
          "--dpi-desync=syndata,fake,split2"
          "--dpi-desync-repeats=6"
          "--dpi-desync-fooling=md5sig"

          "--dpi-desync=fake,split2"
          "--dpi-desync-any-protocol"

          "--new"
        ];
        whitelist = [
          "googlevideo.com"
          "youtu.be"
          "youtube.com"
          "youtubei.googleapis.com"
          "googlevideo.com"
          "youtu.be"
          "youtube.com"
          "youtubei.googleapis.com"
          "youtubeembeddedplayer.googleapis.com"
          "ytimg.l.google.com"
          "ytimg.com"
          "jnn-pa.googleapis.com"
          "youtube-nocookie.com"
          "youtube-ui.l.google.com"
          "yt-video-upload.l.google.com"
          "wide-youtube.l.google.com"
          "youtubekids.com"
          "ggpht.com"
          "discord.com"
          "gateway.discord.gg"
          "cdn.discordapp.com"
          "discordapp.net"
          "discordapp.com"
          "discord.gg"
          "media.discordapp.net"
          "images-ext-1.discordapp.net"
          "discord.app"
          "discord.media"
          "discordcdn.com"
          "discord.dev"
          "discord.new"
          "discord.gift"
          "discordstatus.com"
          "dis.gd"
          "discord.co"
          "discord-attachments-uploads-prd.storage.googleapis.com"
          "7tv.app"
          "7tv.io"
          "10tv.app"
          "dixxe.top"
        ];
      };
    };
  };
}