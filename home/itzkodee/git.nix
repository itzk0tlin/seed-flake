{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "itzkodee";
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