{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell rec {
  name = "java17-shell";
  buildInputs = with pkgs; [
    jdk17
    gradle
  ];

  shellHook = ''
    export JAVA_HOME=${pkgs.jdk17}
    PATH="${pkgs.jdk17}/bin:$PATH"
  '';
}
