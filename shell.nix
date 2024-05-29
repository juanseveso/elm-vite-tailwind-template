{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs
    pkgs.nodePackages.node2nix
    pkgs.just
    pkgs.elmPackages.elm
    pkgs.elmPackages.elm-format
    pkgs.elmPackages.elm-json

  ];

  shellHook = ''
    # Run node2nix if node-env.nix does not exist
    if [ ! -f node-env.nix ]; then
      echo "Generating Nix expressions from package-lock.json"
      node2nix -l package-lock.json
    fi

    # Install node_modules if it does not exist
    if [ ! -d node_modules ]; then
      echo "Installing npm dependencies"
      npm install
    fi
  '';
}
