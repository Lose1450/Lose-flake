{ config, pkgs, ... }:

{
  home.username = "lose";
  home.homeDirectory = "/home/lose";
  home.stateVersion = "26.05";


  programs.bash = {
    enable = true;
    shellAliases = {
      home-help = "anything written in this field will be typed in the terminal";
      nrsf = "sudo nixos-rebuild switch --flake /etc/nixos#Remielle";
      nrsfu = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake /etc/nixos#Remielle";
      nix-update = "cd /etc/nixos && sudo nix flake update";
      nrsf-git = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake /etc/nixos#Remielle && sudo cp -r /etc/nixos/* ~/Remielle && cd ~/Remielle && git pull origin master && git add . && git commit && git push origin master";
      git-commit = "sudo cp -r /etc/nixos/* ~/Remielle && cd ~/Remielle && git add . && git commit && git push origin master";
    };
    initExtra = ''
      export PS1='\[\e[38;5;206m\]\u\[\e[0m\] in \[\e[38;5;27m\]\w\[\e[0m\] \\$ '
    '';
  };

  home.packages = with pkgs; [
    pkgs.hyprmod
  ];
}
