{
  description = "System config for NIX";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }: 
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      lib = nixpkgs.lib;

    in {
      homeManagerConfigurations = {
        hasibur = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./users/hasibur/home.nix
            {
              home = {
                username = "hasibur";
                homeDirectory = "/home/hasibur";
              };
            }
          ];
        };
      };


      nixosConfigurations = {
        # hostname
        nixos = lib.nixosSystem {
          inherit system;
          modules = [
            ./system/configuration.nix
          ];
        };
      };
    };
  
}
