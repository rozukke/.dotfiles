{ pkgs, ... }:

{
  home.packages = (with pkgs; [
    cargo
    rustc
    cmake
    jdk17
    # LSP
    clang-tools
    rust-analyzer
    lua-language-server
  ]);
}
