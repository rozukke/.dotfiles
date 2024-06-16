{ pkgs, ... }:

{
  home.packages = (with pkgs; [
    cmake
    jdk17
    clang-tools
    rust-analyzer
    lua-language-server
  ]);
}
