# voron-kang config

StealthChanger Voron 350 Klipper config with Beacon-on-shuttle probing and KTC tool management.

## Entry points

- Main config: [`printer.cfg`](printer.cfg)
- Shared config includes: [`configs/configs.cfg`](configs/configs.cfg)
- Macro includes: [`macros/macros.cfg`](macros/macros.cfg)
- Toolchanger includes: [`toolchanger/toolchanger-include.cfg`](toolchanger/toolchanger-include.cfg)

## Interesting bits

- Hybrid tool offset calibration (Nudge XY + Beacon contact Z): [`macros/offsets.cfg`](macros/offsets.cfg)
  - Public commands:
    - `TC_GET_PROBE_POSITION`
    - `TC_FIND_ALL_TOOL_OFFSETS`
    - `TC_FIND_TOOL_OFFSETS TOOL=...`
    - `TC_SET_CONTACT_PROBE_POSITION X=... Y=...`
- Nudge + persistent probe location state:
  - [`configs/nudge.cfg`](configs/nudge.cfg)
  - [`configs/nudge_variables.cfg`](configs/nudge_variables.cfg)
- Beacon config and contact tuning: [`configs/beacon.cfg`](configs/beacon.cfg)
- Toolchanger homing override (empty shuttle vs mounted tool behavior): [`toolchanger/homing.cfg`](toolchanger/homing.cfg)
- Tool-aware shaper helpers (select ADXL chip from mounted/selected tool): [`macros/toolchanger-input-shaper.cfg`](macros/toolchanger-input-shaper.cfg)
- Tool definitions (`T0`..`T5`) and per-tool hardware: [`toolchanger/tools/`](toolchanger/tools/)

## Notes

- Tool offsets are intended to be KTC-native (`SET_TOOL_PARAMETER` + `SAVE_TOOL_PARAMETER`) rather than legacy `save_variables` per-tool offsets.
- `configs/temps.cfg` is included via [`configs/configs.cfg`](configs/configs.cfg) for Mainsail-visible temperature sensors.
