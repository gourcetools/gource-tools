#!/bin/bash
echo "
┌─┐┌─┐┬ ┬┬─┐┌─┐┌─┐  ┌┬┐┌─┐┌─┐┬  ┌─┐
│ ┬│ ││ │├┬┘│  ├┤    │ │ ││ ││  └─┐
└─┘└─┘└─┘┴└─└─┘└─┘   ┴ └─┘└─┘┴─┘└─┘
/ Random Color patcher /
"
cd ..
cd ..
cd logs

FILENAMES=`ls *.txt`
for FILENAME in $FILENAMES
do
sed -i "/:[0-9]*\$/ ! s/\$/|$(printf '%02X%02X%02X\n' $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)))/" $FILENAME
	echo $FILENAME  repo patched with random color
	echo "  "

done

echo Done.

/bin/bash