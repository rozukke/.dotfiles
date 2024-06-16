{
  description = "rozukke's NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Specific model support
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    # Very hacky fingerprint support
    nixos-06cb-009a-fingerprint-sensor = {
      url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, ... }:
    # Set env for the rest of the build
    let
      # Config used for basic system setup
      sysconfig = {
        system = "x86_64-linux";
        hostname = "nixos";
        timezone = "Australia/Melbourne";
        locale = "en_AU.UTF-8";
      };

      # User settings for account & preferences
      userconfig = rec {
        username = "artemis";
        name = "Artemis Rosman";
        email = "73006620+rozukke@users.noreply.github.com";
        term = "foot";
        browser  = "firefox";
        font = "JetBrains Mono";
        editor = "nvim";
        spawnEditor = "nvim";
        home = /home/${username};

        # Comment out if not using T480s
        fprint = home + /calib-data.bin;


      };


      # Package repo setup 
      pkgs = import inputs.nixpkgs {
        system = sysconfig.system;
        config.allowUnfree = true;
      };

    in {

      # Instruction to build system contained in lib
      nixosConfigurations = {
        ${sysconfig.hostname} = inputs.nixpkgs.lib.nixosSystem {
          system = sysconfig.system;
          modules = [ 
	    ./configuration.nix
	    # Hardware config
	    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480s

	    # # Used to enrol fingerprints
	    # inputs.nixos-06cb-009a-fingerprint-sensor.nixosModules.open-fprintd
	    # inputs.nixos-06cb-009a-fingerprint-sensor.nixosModules.python-validity
	  ];
          specialArgs = {
            inherit pkgs;
            inherit sysconfig;
            inherit userconfig;
            inherit inputs;
          };
        };
      };

      # Instruction to build dotfiles and preferences
      homeConfigurations = {
        ${userconfig.username} = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
          extraSpecialArgs = {
            inherit pkgs;
            inherit sysconfig;
            inherit userconfig;
            inherit inputs;
          };
        };
      };

    };
}
