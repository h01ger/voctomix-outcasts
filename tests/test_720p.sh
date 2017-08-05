#!/bin/bash -ex

# Mostly to confirm the basics is installed and setup properly.
cd ../../voctomix

./voctocore/voctocore.py -i ../voctomix-outcasts/configs/test_720p.ini &
sleep 5
./voctogui/voctogui.py &
../voctomix-outcasts/ingest.py --debug &
../voctomix-outcasts/ingest.py --video-attribs "pattern=ball" --port 10001 &
./example-scripts/gstreamer/record-mixed-av.sh &
./example-scripts/control-server/generate-cut-list.py
