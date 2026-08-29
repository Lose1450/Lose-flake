{ pkgs, inputs, ... }:
{
  home-manager.users.lose = {
    imports = [
      inputs.caelestia-shell.homeManagerModules.default
    ];

    programs.caelestia = {
      enable = true;
      cli.enable = true;
    };
  };
}
