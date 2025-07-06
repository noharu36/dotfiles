{inputs, ...}:

{
  nixpkgs.overlays = [
    (inputs.niri.overlays.niri)
    (import inputs.rust-overlay)
  ];
}
