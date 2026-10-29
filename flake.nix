{
  description = "NixOS configuration for a hardened jump server (jumppi) reachable over the NetBird mesh VPN";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    nixosModules.default = { config, pkgs, ... }: {
      imports = [
        ./hardware-configuration.nix
        ./user-configuration.nix
        ./services-configuration.nix
      ];

      boot.loader.grub.enable = false;
      boot.loader.generic-extlinux-compatible.enable = true;
      networking.hostName = "jumppi";
      networking.networkmanager.enable = true;
      time.timeZone = "Europe/Berlin";
      i18n.defaultLocale = "en_US.UTF-8";
      console = {
        font = "Lat2-Terminus16";
        keyMap = "de";
      };

      # system.copySystemConfiguration = true;
      system.stateVersion = "26.11";
    };

    nixosConfigurations.jumppi = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [ self.nixosModules.default ];
    };

    packages.aarch64-linux.jumppi =
        self.nixosConfigurations.jumppi.config.system.build.toplevel;
  };
}
