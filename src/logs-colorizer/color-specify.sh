#!/bin/bash
echo "
┌─┐┌─┐┬ ┬┬─┐┌─┐┌─┐  ┌┬┐┌─┐┌─┐┬  ┌─┐
│ ┬│ ││ │├┬┘│  ├┤    │ │ ││ ││  └─┐
└─┘└─┘└─┘┴└─└─┘└─┘   ┴ └─┘└─┘┴─┘└─┘
/ Select Color patcher /
"


FILENAMES=`ls *.txt`

for FILENAME in $FILENAMES
do
	echo In HEX without "#" what color for $FILENAME ?
read COLOR
	echo Color is $COLOR.
sed -i "/:[0-9]*\$/ ! s/\$/|$COLOR/" $FILENAME
	echo  $COLOR applied to $FILENAME succesfully. 
	echo "  "

done

echo Done

/bin/bash