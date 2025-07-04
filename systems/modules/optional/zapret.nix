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
        configureFirewall = true;
        qnum = 350;
        params = [
          "--wssize 1:6"

          "--filter-tcp=80"
          "--dpi-desync=multisplit"
          "--dpi-desync-split-pos=10"
          "--dpi-desync-repeats=6"
          "--new"

          "--filter-tcp=443"
          "--dpi-desync=multidisorder"
          "--dpi-desync-split-pos=1,midsld"
          "--new"

          "--filter-tcp=443"
          "--dpi-desync=syndata"
          "--dpi-desync-fake-syndata=0x00000000"
          "--dpi-desync-ttl=10"
          "--new"

          "--filter-udp=443"
          "--dpi-desync=fake"
          "--dpi-desync-repeats=6"
          "--dpi-desync-fake-quic=0x00000000"
          "--new"

          "--filter-udp=443"
          "--dpi-desync=fake,udplen"
          "--dpi-desync-udplen-increment=5"
          "--dpi-desync-fake-tls=0x00000000"
          "--dpi-desync-cutoff=n3"
          "--dpi-desync-repeats=2"
          "--new"

          "--filter-tcp=443"
          "--dpi-desync=split"
          "--dpi-desync-fooling=md5sig,badseq"
          "--dpi-desync-fake-tls=0x00000000"
          "--dpi-desync-split-pos=1"
          "--dpi-desync-repeats=10"
          "--new"

          "--filter-tcp=443"
          "--dpi-desync=fake,split2"
          "--dpi-desync-fooling=md5sig"
          "--dpi-desync-fake-tls=0x00000000"
          "--dpi-desync-split-seqovl=2"
          "--dpi-desync-split-pos=2"

          "--dpi-desync-autottl"
          "--new"
          "--filter-tcp=443"
          "--dpi-desync=fake,split2"
          "--dpi-desync-fooling=md5sig"
          "--dpi-desync-fake-tls=0x00000000"
          "--dpi-desync-split-seqovl=2"
          "--dpi-desync-split-pos=2"
          "--dpi-desync-autottl"
          "--new"

          "--filter-tcp=80"
          "--dpi-desync=fake,split2"
          "--dpi-desync-fooling=md5sig"
          "--dpi-desync-fake-tls=0x00000000"
          "--dpi-desync-autottl"
          "--new"

          "--filter-tcp=80"
          "--dpi-desync-ttl=1"
          "--dpi-desync-autottl=2"
          "--dpi-desync-fake-tls=0x00000000"
          "--dpi-desync-split-pos=1"
          "--dpi-desync=fake,split2"
          "--dpi-desync-repeats=6"
          "--dpi-desync-fooling=md5sig"
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
          "music.youtube.com"
          "test.googlevideo.com"
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
          "x.com"
          "t.co"
          "ads-twitter.com"
          "twimg.com"
          "twitter.com"
          "pscp.tv"
          "twtrdns.net"
          "twttr.com"
          "periscope.tv"
          "tweetdeck.com"
          "twitpic.com"
          "twitter.co"
          "twitterinc.com"
          "twitteroauth.com"
          "twitterstat.us"
        ];
      };
    };
  };
}