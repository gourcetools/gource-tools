#!/bin/bash
# START.sh


echo "        ┌─┐┌─┐┬ ┬┬─┐┌─┐┌─┐ ┌┬┐┌─┐┌─┐┬  ┌─┐";
echo "        │ ┬│ ││ │├┬┘│  ├┤───│ │ ││ ││  └─┐";
echo "        └─┘└─┘└─┘┴└─└─┘└─┘  ┴ └─┘└─┘┴─┘└─┘";
echo "     ┌─────────────┐";
echo "     │  MAIN MENU  │";
echo "   ┌─┴─────────────┴──────────────────────────┐";
echo "   │    1) Download repos from list           │";
echo "   │    2) Download repos from username       │";
echo "   │    3) Download avatars                   │";
echo "   │    4) Download ... list + avatars        │";
echo "   │    5) Download ... username + avatars    │";
echo "   ├──────────────────────────────────────────┤";
echo "   │    6) Make Gource log for each repo      │";
echo "   │    7) Color patcher                      │";
echo "   │    8) Combine all logs into combined.txt │";
echo "   ├──────────────────────────────────────────┤";
echo "   │    9) Update all repos and make new logs │";
echo "   ├──────────────────────────────────────────┤";
echo "   │    10) Gource alone                      │";
echo "   │    11) Gource + render (using ffmpeg)    │";
echo "   ├──────────────────────────────────────────┤";
echo "   │    12) Reset gource-tools 	              │";
echo "   │    13) Exit                              │";
echo "   └──────────────────────────────────────────┘";
echo -n "    └─> Enter your choice [1-13]:";

# Running a forever loop using while statement
# This loop will run untill select the exit option.
# User will be asked to select option again and again
while :
do

# reading choice
read choice

# case statement is used to compare one value with the multiple cases.
case $choice in
# Pattern 1
  1)  echo "== Download repos from list ==" 
    cd ../dl-repos
   ./dl-repos-from-list.sh
  source ../menu/START.sh ;;
# Pattern 2
  2)  echo "== Download repos from username =="
    cd ../dl-repos
   ./dl-repos-from-username.sh
  source ../menu/START.sh ;;
# Pattern 3
  3)  echo "== Download avatars =="
  cd ../dl-avatars
  ./dl-avatars.sh
  source ../menu/START.sh ;;
# Pattern 4
    4)  echo "== Download ... list + avatars =="
      cd ../dl-repos
     ./dl-repos-from-list.sh
     cd ../dl-avatars
     ./dl-avatars.sh
     source ../menu/START.sh ;;
  
# Pattern 5
  5)  echo "== Download ... username + avatars =="
      cd ../dl-repos
     ./dl-repos-from-username.sh
     cd ../dl-avatars
     ./dl-avatars.sh
     source ../menu/START.sh ;;
# Pattern 6
  6)  echo "== Make goutce logs for each repo =="
  cd ../logs-maker
   ./logs-maker.sh 
  source ../menu/START.sh ;;
# Pattern 7
  7)  echo "== Color patcher =="
  cd ../logs-colorizer
   ./color-random.sh 
  source ../menu/START.sh ;;
# Pattern 8
  8)  echo "== Combine all logs into combined.txt =="
  cd ../logs-maker
   ./logs-combiner.sh 
  source ../menu/START.sh ;;
# Pattern 9
  9)  echo "== Update all repos and make new logs =="
  cd ../update-repos
   ./update-repos.sh 
   cd ../logs-maker
   ./logs-maker.sh 
     cd ../logs-maker
   ./logs-combiner.sh 
  source ../menu/START.sh ;;
# Pattern 10
  10)  echo "== Gource alone =="
  cd ../rendering
   ./explore-configurator.sh 
  source ../menu/START.sh ;;
# Pattern 11
  11)  echo "== Gource and render =="
  cd ../rendering
   ./render-configurator.sh 
  source ../menu/START.sh ;;
# Pattern 12
  12)  echo "== Reset gource-tools =="
  cd ../reset
   ./reset.sh 
  source ../menu/START.sh ;;
# Pattern 13
  13)  echo "Exit"
      exit;;

# Default Pattern
  *) echo "     Invalid number..."
    echo "     └─> Enter your choice [1-13]:";;
esac
  echo
done
