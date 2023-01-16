## Create CURRENTDATE & LASTYEAR variable ##
CURRENTDATE=`date +"%Y-%m-%d"`
LASTYEAR=`date -d '-365day' +"%Y-%m-%d"`
echo Current Date: ${CURRENTDATE}
echo Last LASTYEAR ${LASTYEAR}





gource \
    ../../logs/ACombinedLog.txt \
    --1920x1080  \
    --stop-at-end \
    --loop-delay-seconds 10 \
    --user-image-dir ../../avatars \
    --start-date "$LASTYEAR" \
    -r 60 \
    --seconds-per-day "0.16" \
    --padding 1.15 \
    --bloom-intensity 0.5 \
    --hide "progress,mouse,filenames,root" \
    --camera-mode overview \
    --user-font-size 13 \
    --dir-name-position 1 --dir-font-size 20 \
    --dir-name-depth 1 \
    --file-filter ".svg" \
    --file-filter "node_modules" \
    --file-filter ".ts" \
    -o - | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx265 -preset slow -pix_fmt yuv420p -crf 22 -bf 0 ../../.renders/LASTYEARK4K-$LASTYEAR.mp4
