{ pkgs, ... }:

{
  starship.enable = true;
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [
    # pkgs.doom-emacs
    pkgs.git
    pkgs.curl
    pkgs.jq
    pkgs.openjdk17
    # pkgs.minecraft
    pkgs.gopacked
    pkgs.ferium
    pkgs.minecraftServers.vanilla-1-19
    # pkgs.minecraft-server-hibernation
    pkgs.mcstatus
    pkgs.mcrcon
    # pkgs.lunar-client
    # pkgs.home-assistant-component-tests.minecraft_server
    # pkgs.jetbrains.jdk
    pkgs.jetbrains.idea-community
    pkgs.jetbrains-mono
  ];
  languages.go.enable = true;
  languages.java.enable = true;
  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";

  enterShell = ''
    hello
    git --version
  '';
  scripts.silly-example.exec = ''
    ${pkgs.curl}/bin/curl "https://httpbin.org/get?$1" | ${pkgs.jq}/bin/jq '.args'
  '';

  processes = {
    silly-example.exec = "while true; do echo hello && sleep 1; done";
    ping.exec = "ping example.com";
  };
  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
