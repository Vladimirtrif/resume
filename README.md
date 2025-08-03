### My Resume typeset in latex

Credit to Aras Gungore's resume template: [link](https://github.com/arasgungore/arasgungore-CV/tree/main)

#### Creating your own resume

You could install latex, install the packages, and copy my .tex file.  
However, I use the nix package manager to handle dependencies and as a build system.  
All you need is to install the nix package manager: [nix website](https://nixos.org/download/)  
This command builds the pdf from the .tex file:  
`nix run`  
This command puts you in an isolated dev environment with all of the dependencies (latex, packages, etc):  
`nix develop`  
  
This project uses the flakes feature. Flake.nix declares the dependencies and defines the build.  
Some things of note, to change pdf output name you need to edit the build resume script in Flake.nix
