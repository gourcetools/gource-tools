#!/bin/bash



grep . ../../.config/.ReposList.txt | while read line ; do
    cd .. ;
    cd .. ;
    cd repos ; 
    git clone $line ;
    echo "  Cloning $line";
    cd .. ;
    cd src ;
    cd Repos_Downloader
  done


echo Done downloading all repos.

/bin/bash