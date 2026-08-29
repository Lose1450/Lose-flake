{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
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
    nixosConfigurations.Remielle = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; #understand that this line is redundant
        specialArgs = { inherit inputs; };
        modules = [
            ./configuration.nix
            inputs.home-manager.nixosModules.home-manager
            ./caelestia.nix
            {
                home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    users.lose = import ./home.nix;
                    backupFileExtension = "backup";
                  };
              }
          ];
    };
  };
}
