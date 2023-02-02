clear
echo ""
echo ""
echo "     ┌─┐┌─┐┬ ┬┬─┐┌─┐┌─┐  ┌┬┐┌─┐┌─┐┬  ┌─┐		";
echo "     │ ┬│ ││ │├┬┘│  ├┤    │ │ ││ ││  └─┐		";
echo "     └─┘└─┘└─┘┴└─└─┘└─┘   ┴ └─┘└─┘┴─┘└─┘		";
echo "";
echo "";






## Move to gource logs, list all the .txt
cd ../../logs/
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
echo  Seconds per day?
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


cd ../src/rendering/
mkdir -p ../../renders
cd ../../logs/
gource \
    $1 \
    --1920x1080 \
    --stop-at-end \
    --loop-delay-seconds 10 \
    --user-image-dir ../avatars/raw/ \
    --start-date "$STARTDATE" \
    --stop-date "$STOPDATE" \
    --seconds-per-day "$SPD" \
    -r 30 \
    --file-idle-time 0 \
    -padding 1.3 \
    --bloom-intensity 0.25 \
    --hide "progress,mouse,filenames,root" \
    --user-font-size 15 \
    --dir-name-position 1 --dir-font-size 20 --dir-name-depth 2 \
    -o - | ffmpeg -y -r 30 -probesize 42M -f  image2pipe -vcodec ppm -i - -vcodec libx264 -preset veryfast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 ../renders/gource.mp4

echo "Done"
cd ../src/rendering/

