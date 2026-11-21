{
  description = "CatML flake";

  outputs =
    { nixpkgs, ... }:
    {
      devShells.x86_64-linux =
        let
          pkgs = import nixpkgs {
            system = "x86_64-linux";
          };
        in
        {
          default = pkgs.mkShell {
            packages =
              with pkgs;
              with pkgs.ocamlPackages;
              [
                ocaml
                dune
                menhir
                utop
              ];
          };
        };
    };
}
