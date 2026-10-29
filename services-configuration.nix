{ config, lib, pkgs, modulesPath, ... }:

{
  # Activating SystemD resolved for NetBird
  services.resolved.enable = true;

  # Hardend OpenSSH configuration
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  # NetBird configuration
  services.netbird.clients.wt0 = {
    port = 51821;
    openFirewall = true;
    openInternalFirewall = true;
  };
}
