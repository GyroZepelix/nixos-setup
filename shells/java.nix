{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell rec {
  name = "java-shell";
  buildInputs = with pkgs; [
    jdk21 
    gradle
  ];

  shellHook = ''
    export JAVA_HOME=${pkgs.jdk21}
    PATH="${pkgs.jdk21}/bin:$PATH"
  '';
}
