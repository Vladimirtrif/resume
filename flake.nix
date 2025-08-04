{
  description = "Latex packages for resume";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      latexEnv = pkgs.texlive.combine {
        inherit (pkgs.texlive)
          scheme-basic
          symbol
          titlesec
          marvosym
          enumitem
          hyperref
          fancyhdr
          babel-english
          tabulary
          hyphenat
          fontawesome
          xunicode
          ;
      };
    in
    {
      # Dev shell (if needed to debug)
      devShells.${system}.default = pkgs.mkShell {
        packages = [ latexEnv ];
        shellHook = ''
          echo "Entering LaTeX dev environment"
        '';
      };

      # Nix run to build resume for me
      apps.${system}.default = {
        type = "app";
        program =
          (pkgs.writeShellApplication {
            name = "build-resume";
            runtimeInputs = [ latexEnv ];
            text = ''
              mkdir -p ./log
              pdflatex --jobname=Vladimir-Trifonov-SWE-Resume --output-directory=./log/ Resume.tex
              mv ./log/Vladimir-Trifonov-SWE-Resume.pdf ./
            '';
          })
          + "/bin/build-resume";
      };
    };
}
