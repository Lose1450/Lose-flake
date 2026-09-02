{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

  hyprmod = {
    url = "github:BlueManCZ/hyprmod";
    inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
        };

        caelestia-shell = {
          url = "github:caelestia-dots/shell";
          inputs.nixpkgs.follows = "nixpkgs";
          };

  };

  outputs = inputs: {
<<<<<<< HEAD
    nixosConfigurations.Remielle = inputs.nixpkgs.lib.nixosSystem {
=======
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem { #change nixos to Remielle later
>>>>>>> 7e14592 (Ver-1.5.3(?) added vlc)
        system = "x86_64-linux"; #understand that this line is redundant
        modules = [
            ./configuration.nix
            inputs.home-manager.nixosModules.home-manager
            { nixpkgs.overlays = [ inputs.hyprmod.overlays.default ]; }
            {
                home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    backupFileExtension = "backup";
                    users.lose = {
                      imports = [
                        inputs.caelestia-shell.homeManagerModules.default
                        ./home.nix
                        ];
                      };
                  };
              }
          ];
          specialArgs = { inherit inputs; };
    };
  };
}
