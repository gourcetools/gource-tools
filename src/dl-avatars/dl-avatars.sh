#!/bin/bash
echo "
┌─┐┌─┐┬ ┬┬─┐┌─┐┌─┐  ┌┬┐┌─┐┌─┐┬  ┌─┐
│ ┬│ ││ │├┬┘│  ├┤    │ │ ││ ││  └─┐
└─┘└─┘└─┘┴└─└─┘└─┘   ┴ └─┘└─┘┴─┘└─┘
/ Avatar Downloader /
"

cd ..
cd ..
cd repos

for i in $(find . -maxdepth 1 -type d -not -path "."); do
    cd $i
    perl ../../src/Avatars_Downloader/Download_avatars.pl
    cd ..
done



echo "Done"
/bin/bash