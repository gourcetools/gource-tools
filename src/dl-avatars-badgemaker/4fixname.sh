#!/bin/bash
cd ..
cd pngs
ls *.gif* | sed 's/\(.*\).gif\(.png\)/mv & \1\2/' | sh
