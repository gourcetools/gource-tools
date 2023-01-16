#!/bin/bash
echo "
┌─┐┌─┐┬ ┬┬─┐┌─┐┌─┐  ┌┬┐┌─┐┌─┐┬  ┌─┐
│ ┬│ ││ │├┬┘│  ├┤    │ │ ││ ││  └─┐
└─┘└─┘└─┘┴└─└─┘└─┘   ┴ └─┘└─┘┴─┘└─┘
/ Avatar Downloader /
"
mkdir -p ../../avatars
cd ..
cd ..
cd repos

for i in $(find . -maxdepth 1 -type d -not -path "."); do
    cd $i
    perl ../../src/dl-avatars/dl-avatars.pl
    cd ..
done



echo "Done"