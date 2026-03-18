# voron-kang config

StealthChanger Voron 350 Klipper config with Beacon-on-shuttle probing and KTC tool management.

## Entry points

- Main config: [`printer.cfg`](printer.cfg)
- Shared config includes: [`configs/configs.cfg`](configs/configs.cfg)
- Macro includes: [`macros/macros.cfg`](macros/macros.cfg)
- Toolchanger includes: [`toolchanger/toolchanger-include.cfg`](toolchanger/toolchanger-include.cfg)

## Interesting bits

- Hybrid tool offset calibration (Nudge XY + Beacon contact Z): [`toolchanger/calibrate-offsets.cfg`](toolchanger/calibrate-offsets.cfg)
  - Public commands:
    - `TC_GET_PROBE_POSITION`
    - `TC_FIND_ALL_TOOL_OFFSETS`
    - `TC_FIND_TOOL_OFFSETS TOOL=...`
    - `TC_SET_CONTACT_PROBE_POSITION X=... Y=...`
- Nudge:
  - [`configs/nudge.cfg`](configs/nudge.cfg)
  - [`configs/variables.cfg`](configs/variables.cfg)
- Toolchanger homing override (empty shuttle homing compatible): [`toolchanger/homing.cfg`](toolchanger/homing.cfg)
- Tool-aware shaper helpers (select ADXL chip from mounted/selected tool, multi tool input shaping): [`macros/toolchanger-input-shaper.cfg`](macros/toolchanger-input-shaper.cfg)
- Orca Slicer build plate → Beacon model mapping with fallback and warning: [`macros/build_plate.cfg`](macros/build_plate.cfg)
- Nozzle thermal expansion Z compensation (per active tool, applied at print start): [`macros/thermal_expansion_comp.cfg`](macros/thermal_expansion_comp.cfg)
- M109 deadband override — skips temperature wait if already within ±2.5°C of target: [`toolchanger/toolchanger-macros.cfg`](toolchanger/toolchanger-macros.cfg)

## Notes and changes

- Tool offsets are intended to be KTC-native (`SET_TOOL_PARAMETER` + `SAVE_TOOL_PARAMETER`) rather than legacy `save_variables` per-tool offsets.
- `configs/temps.cfg` is included via [`configs/configs.cfg`](configs/configs.cfg) for Mainsail-visible temperature sensors.
- Bed uses dual loop PID: outer sensor = build plate surface (PB0), inner sensor = heater pad (PB1). Outer loop controls to surface temp; inner PID values in SAVE_CONFIG.
- Extruders use `pid_v` (velocity-form PID) for faster temperature stabilization on tool changes.
