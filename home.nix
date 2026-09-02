{ config, pkgs, ... }:

{
  home.username = "lose";
  home.homeDirectory = "/home/lose";
  home.stateVersion = "26.05";


  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw"; #this is just for demo purposes
      nrs = "sudo nixos-rebuild switch";
      nrsf = "sudo nixos-rebuild switch --flake /etc/nixos#Remielle";
      rebuild-nixos = "sudo nixos-rebuild switch --flake /etc/nixos#Remielle && sudo cp /etc/nixos/* ~/Remielle && cd ~/Remielle && git pull origin master && git add . && git commit && git push origin master";
      git-commit = "sudo cp /etc/nixos/* ~/Remielle && cd ~/Remielle && git add . && git commit && git push origin master";
      };
      initExtra = ''
        export PS1='\[\e[38;5;206m\]\u\[\e[0m\] in \[\e[38;5;27m\]\w\[\e[0m\] \\$ '
        '';
        };

      programs.caelestia = {
  enable = true;
  systemd = {
    enable = false; # if you prefer starting from your compositor
    target = "graphical-session.target";
    environment = [];
  };
  settings = {
    bar.statusIcons = [
      { id = "lockStatus"; enabled = true; }
      { id = "network"; enabled = true; }
      { id = "bluetooth"; enabled = true; }
      { id = "battery"; enabled = false; }
    ];
    paths.wallpaperDir = "~/Images";
  };
  cli = {
    enable = true; # Also add caelestia-cli to path
    settings = {
      theme.enableGtk = false;
    };
  };
};



    home.packages = with pkgs; [
      bat
      pkgs.hyprmod
    ];
}
