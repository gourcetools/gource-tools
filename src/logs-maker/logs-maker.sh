#!/bin/bash
mkdir -p ../../logs
cd ..
cd ..
cd repos

for i in $(find . -maxdepth 1 -type d -not -path "."); do
    cd $i
    gource --output-custom-log $i.txt
	sed -i -E "s#(.+)\|#\1|/${i}#" $i.txt
    mv $i.txt ../../logs
    echo "Making log for $i"
    cd ..
done



echo Done.