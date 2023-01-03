

#!/bin/bash
echo "
┌─┐┌─┐┬ ┬┬─┐┌─┐┌─┐  ┌┬┐┌─┐┌─┐┬  ┌─┐
│ ┬│ ││ │├┬┘│  ├┤    │ │ ││ ││  └─┐
└─┘└─┘└─┘┴└─└─┘└─┘   ┴ └─┘└─┘┴─┘└─┘
/ Color Remover /
"
cd ..
cd ..
cd logs

FILENAMES=`ls *.txt`
for FILENAME in $FILENAMES
do
sed -i 's/.\{7\}$//' $FILENAME
	echo Color removed from $FILENAME  repo 
	echo "  "

done

echo Done.

/bin/bash