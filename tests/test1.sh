#!/bin/bash -ex

# Mostly to confirm the basics is installed and setup properly. 
cd ../../voctomix

./voctocore/voctocore.py -i ../voctomix-outcasts/configs/light.ini &
sleep 5
./voctogui/voctogui.py &
../voctomix-outcasts/ingest.py &
../voctomix-outcasts/ingest.py --video-attribs "pattern=ball" --port 10001 &
../voctomix-outcasts/record-timestamp.sh &
../voctomix-outcasts/generate-cut-list.py --file foo.log

