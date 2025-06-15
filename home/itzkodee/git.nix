{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "itzk0tlin";
    userEmail = "orlovskymaksimik@yandex.ru";
    extraConfig = {
      credential.helper = [
        "oauth"
      ];           
    };
  };

  home.packages = with pkgs; [ # Pretty wonky, but idk
      git-credential-oauth     # how to make it better
  ];
}