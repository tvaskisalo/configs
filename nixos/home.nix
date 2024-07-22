{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home = {
    username = "tvaskisalo";
    homeDirectory = "/home/tvaskisalo";
  };

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  programs = {
    # basic configuration of git, please change to your own
    git = {
      enable = true;
      userName = "tvaskisalo";
      userEmail = "tapani.vaskisalo@outlook.com";
    };

    # starship - an customizable prompt for any shell
    starship = {
      enable = true;
      # custom settings
      settings = {
        add_newline = false;
        aws.disabled = true;
        gcloud.disabled = true;
        line_break.disabled = true;
      };
    };

    # alacritty - a cross-platform, GPU-accelerated terminal emulator
    alacritty = {
      enable = true;
      # custom settings
      settings = {
        colors = {
          bright = {
            black = "0x1c61c2";
            blue = "0x00ff00";
            cyan = "0x0abdc6";
            green = "0xd300c4";
            magenta = "0x711c91";
            red = "0xff0000";
            white = "0xd7d7d5";
            yellow = "0xf57800";
          };

          cursor = {
            cursor = "#FFD700";
            text = "#2F343F";
          };

          normal = {
            black = "0x123e7c";
            blue = "0x123e7c";
            cyan = "0x0abdc6";
            green = "0xd300c4";
            magenta = "0x711c91";
            red = "0xff0000";
            white = "0xd7d7d5";
            yellow = "0xf57800";
          };
          primary = {
            background = "#121220";
            foreground = "#ff1C8D";
          };
        };
        window = { opacity = 0.75; };
        font = { size = 10; };
        scrolling.multiplier = 5;
        selection.save_to_clipboard = true;
      };
    };

    bash = {
      enable = true;
      enableCompletion = true;
      # TODO add your custom bashrc here
      bashrcExtra = ''
        export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      '';

      # set some aliases, feel free to add more or remove some
      shellAliases = { k = "kubectl"; };
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
