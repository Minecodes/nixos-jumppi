{ config, lib, pkgs, modulesPath, ... }:

{
  users.users.pi = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      ###          !!!!  Please replace this SSH key   !!!!         ###
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAoYzQl2cSQCl2NEWY0/dt8LkHre11guZ7HQOtUKPBpL"
    ];
    extraGroups = [ "wheel" "networkmanager" "netbird-wt0" ];
    packages = with pkgs; [
      # Management tools
      tree
      vim
      neovim
      nano
      htop
      git

      # web tools
      curl
      wget
      httpie
      netbird

      # network tools
      nmap
      netcat
      iperf
      tcpdump

      # DNS tools
      mtr
      dnsutils
    ];
  };

  environment.systemPackages = with pkgs; [
    # Management tools
    vim
    neovim
    nano
    htop
    git

    # web tools
    curl
    wget
    httpie
    netbird

    # network tools
    nmap
    netcat
    iperf
    tcpdump

    # DNS tools
    mtr
    dnsutils
  ];

  security.sudo.wheelNeedsPassword = false;
}
