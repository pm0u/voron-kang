#! /bin/bash
TOOL_UUIDS="0a26eaa4abf1 9b07033402f5 45cc908810ef f0955bf5bee5 5c18bff72ec4 d45eb64a55d0"
FW=$HOME/klipper/out/klipper.bin
FT="python3 $HOME/katapult/scripts/flashtool.py -i can0"
for u in $TOOL_UUIDS; do
  $FT -u "$u" -r || exit 1
done
$FT -q
for u in $TOOL_UUIDS; do
  $FT -u "$u" -f "$FW" || exit 1
done
$FT -q
