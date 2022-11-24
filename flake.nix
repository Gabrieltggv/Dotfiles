{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux"; 
      username = "gabriel";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ({ config, ... }: {
            home = {
              stateVersion = "22.11"; inherit username; homeDirectory = "/home/${username}"; 

              file.".config/nix/nix.conf".text = ''
                experimental-features = nix-command flakes
              '';

              packages = with pkgs; [
		gcc
		neovim
        	vimPlugins.packer-nvim
	      ];
            };
	    fonts = {
		fontconfig = {
			enable = true;
		};
	    };

            programs = {
                home-manager.enable = true;
		git = {
  			enable = true;
  			userName = "gabriel torres";
			userEmail = "gabrieltggv29@gmail.com";
		};
		fish = {
			enable = true;
			plugins = [{
			    name = "z";
			    src = pkgs.fetchFromGitHub {
			      owner = "jethrokuan";
			      repo = "z";
			      rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
			      sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
			    };
			  }];
		};
	    };
          })
        ];
      };
     };
}
