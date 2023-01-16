#!/bin/bash



echo "Enter a Github username: " 
read username

mkdir -p ../../repos
cd ../../repos
curl -s https://api.github.com/users/$username/repos | grep "clone_url" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone 
echo "  Done downloading all repos."