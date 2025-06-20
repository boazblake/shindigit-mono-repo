{
  description = "Shindigit monorepo (frontend + backend + Docker + Caddy + TypeScript + Node)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    # Optionally, add nodejs overlays or versions here if you need a specific version
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        nodejs = pkgs.nodejs_20; # Adjust version as needed
        docker-compose = pkgs.docker-compose;
        docker = pkgs.docker;
        caddy = pkgs.caddy;
        # Add more tools as needed (yarn, pnpm, etc.)
      in {
          devShells.default = pkgs.mkShell {
            buildInputs = [
              nodejs
              pkgs.nodePackages.npm
              pkgs.nodePackages.typescript
              pkgs.nodePackages.ts-node
              pkgs.nodePackages.eslint
              docker-compose
              docker
              caddy
              pkgs.git
              # pkgs.nodePackages.vite  # <-- REMOVE or COMMENT THIS LINE!
            ];
              shellHook = ''
                export COMPOSE_BAKE=true
                echo "COMPOSE_BAKE is enabled for docker compose builds."
                echo "Welcome to the Shindigit development shell!"
                echo "Node: $(node --version), npm: $(npm --version)"
                echo "You have Docker, Caddy, TypeScript, and all Node tools available."
              '';
          };

        # Optional: expose Docker Compose and Caddy as packages
        packages = {
          caddy = caddy;
          docker-compose = docker-compose;
        };

        # Optional: formatter
        formatter = pkgs.alejandra;
      });
}
