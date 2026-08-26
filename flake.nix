{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = inputs: {
    nixosConfigurations.Remielle = inputs.nixpkgs.lib.nixosSystem {
        modules = [ ./configuration.nix ];
    };
  };
}
