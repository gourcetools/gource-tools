#!/bin/bash



mkdir -p ../../repos

grep . ../../config/repos-list.txt | while read line ; do
    cd .. ;
    cd .. ;
    cd repos ; 
    git clone $line ;
    echo "  Cloning $line";
    cd .. ;
    cd src ;
    cd dl-repos
  done


echo Done downloading all repos.
