{ config, pkgs, ... }: {
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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.copySystemConfiguration = true;
  system.stateVersion = "26.11";
};
