{ pkgs, ... }:

pkgs.devShell.mkShell {
  name = "flasher";
  packages = with pkgs; [
    # Toolchain required for C + Rust binaries building
    binutils
    gcc

    # Nightly Rust toolchain
    bacon
    cargo-flamegraph
    hyperfine
    (rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
      # Extensions which ease your development process
      extensions = [ "rust-analyzer" "rust-src" ];
    }))
  ];
}
