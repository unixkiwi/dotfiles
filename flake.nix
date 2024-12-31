{
  description = "unixkiwi's flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
  };
       
  outputs = { self, nixpkgs, home-manager, stylix, ... }:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./configuration.nix
          home-manager.nixosModules.home-manager 
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.backupFileExtension = "hm-bkp";
                      
            home-manager.users.kiwi = import ./home.nix;
          }
          stylix.nixosModules.stylix
        ];
      };              
    };
  };
}
