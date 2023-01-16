#!/bin/bash
# update all repos from github
cd ..
cd ..
cd repos
ls | xargs -P10 -I{} git -C {} pull
echo " "
echo All repos up to date.