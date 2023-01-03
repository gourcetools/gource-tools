clear
echo ""
echo ""
echo "     ┌─┐┌─┐┬ ┬┬─┐┌─┐┌─┐  ┌┬┐┌─┐┌─┐┬  ┌─┐		";
echo "     │ ┬│ ││ │├┬┘│  ├┤    │ │ ││ ││  └─┐		";
echo "     └─┘└─┘└─┘┴└─└─┘└─┘   ┴ └─┘└─┘┴─┘└─┘		";
echo "";
echo "";






## Move to gource logs, list all the .txt
cd ..
cd ..
cd logs
set -- *.txt

while true; do
    i=0
    for pathname do
        i=$(( i + 1 ))
        printf '%d) %s\n' "$i" "$pathname" >&2
    done

    printf ' └─> Select file to render: ' >&2
    read -r reply

    number=$(printf '%s\n' "$reply" | tr -dc '[:digit:]')

    if [ "$number" = "0" ]; then
        echo ' !' >&2
        exit
    elif [ "$number" -gt "$#" ]; then
        echo ' Invalid number ' >&2
    else
        break
    fi
done

shift "$(( number - 1 ))"
file=$1

# select menu





clear
echo ""
echo ""
echo "     ┌─┐┌─┐┬ ┬┬─┐┌─┐┌─┐  ┌┬┐┌─┐┌─┐┬  ┌─┐		";
echo "     │ ┬│ ││ │├┬┘│  ├┤    │ │ ││ ││  └─┐		";
echo "     └─┘└─┘└─┘┴└─└─┘└─┘   ┴ └─┘└─┘┴─┘└─┘		";
echo "";
echo "";
echo "Selected file: $1";
echo "          ";
echo "          ";


echo Start at YYYY-MM-DD ?
read STARTDATE
echo "          ";
echo "  Gotcha, we start the recording from $STARTDATE - hope you're well."


echo  End at YYYY-MM-DD ?
read STOPDATE
echo "  Let's do this."

echo "          ";
echo  Seconds per day? 8.57  1.93 
read SPD
echo "          ";
echo "Oki Doki."

echo "          ";
echo "          ";
echo "┬─┐┌─┐┌┐┌┌┬┐┌─┐┬─┐┬┌┐┌┌─┐";
echo "├┬┘├┤ │││ ││├┤ ├┬┘│││││ ┬";
echo "┴└─└─┘┘└┘─┴┘└─┘┴└─┴┘└┘└─┘";
echo "          ";
echo "          ";


gource \
    $1 \
    --1920x1080 \
    --stop-at-end \
    --loop-delay-seconds 10 \
    --user-image-dir ../avatars/ \
    --start-date "$STARTDATE" \
    --stop-date "$STOPDATE" \
    --seconds-per-day "$SPD" \
    -r 30 \
    --file-idle-time 0 \
    -padding 1.3 \
    --bloom-intensity 0.25 \
    --hide "progress,mouse,filenames,root" \
    --user-font-size 15 \
    --dir-name-position 1 --dir-font-size 15 --dir-name-depth 1 \
    -o - | ffmpeg -y -r 30 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset veryfast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 ../.renders/gource.mp4

echo "Done"
$SHELL 




sleep 3



echo "Rendering done  ";
echo "          ";
echo "┌─┐┬ ┬┌┬┐  ┌┬┐┬ ┬┌─┐ ";
echo "├─┘│ │ │    │ ├─┤├┤  ";
echo "┴  └─┘ ┴    ┴ ┴ ┴└─┘ ";
echo "┌┬┐┬ ┬┌─┐┬┌─┐  ┌─┐┌┐┌";
echo "││││ │└─┐││    │ ││││";
echo "┴ ┴└─┘└─┘┴└─┘  └─┘┘└┘";
echo "          ";
echo "          ";
echo "          ";

cd ..
cd ..
cd .renders

ffmpeg -i gource.mp4 -i ../_audio.mp3 -map 0 -map 1:a -c:v copy -shortest gourcesound.mp4

ffmpeg -i gourcesound.mp4 -filter_complex \
  "fade=in:st=0:d=5, fade=out:st=55:d=5; \
   afade=in:st=0:d=10 , afade=out:st=50:d=10" \
 -c:v libx264 -c:a aac gourcesoundfade.mp4


echo "          ";
echo "┌─┐┌─┐┌─┐┬  ┬ ┬                 ";
echo "├─┤├─┘├─┘│  └┬┘                 ";
echo "┴ ┴┴  ┴  ┴─┘ ┴                  ";
echo "┌─┐┌─┐┌┬┐┌─┐  ┌─┐┌─┐┌─┐┌─┐┌─┐┌┬┐";
echo "├┤ ├─┤ ││├┤   ├┤ ├┤ ├┤ ├┤ │   │ ";
echo "└  ┴ ┴─┴┘└─┘  └─┘└  └  └─┘└─┘ ┴ ";
echo "          ";
echo "          ";
echo "          ";

ffmpeg -i gourcesoundfade.mp4 -af "afade=t=out:st=10:d=50"  $1.mp4


# RENAME FILE TO REMOVE TXT
ls *.txt* | sed 's/\(.*\).txt\(.mp4\)/mv & \1\2/' | sh



rm gourcesoundfade.mp4
rm gourcesound.mp4
rm gource.mp4
start . ## OPEN FOLDER IN EXPLORER
echo "┌┬┐┌─┐┌┐┌┌─┐              ";
echo " │││ ││││├┤               ";
echo "─┴┘└─┘┘└┘└─┘             ";
echo "          ";
echo "          ";
echo "          ";




clear
echo "                ";
echo "                ";
echo "     ┌─┐┌─┐┬ ┬┬─┐┌─┐┌─┐  ┌┬┐┌─┐┌─┐┬  ┌─┐		";
echo "     │ ┬│ ││ │├┬┘│  ├┤    │ │ ││ ││  └─┐		";
echo "     └─┘└─┘└─┘┴└─└─┘└─┘   ┴ └─┘└─┘┴─┘└─┘		";
echo "                ";
echo " ┌──────────────────────────────────────────────────────┐";
echo " │  Render done!         	                        │";
echo " │  File located inside /renders folder 	        │";
echo " └──────────────────────────────────────────────────────┘";
read -n 1 -r -s -p "       └─> Press any key for Main Menu."

# this will fire after the key is pressed
cd ..
cd src
cd Menu_interface
source Gource-tools-Main.sh ;
