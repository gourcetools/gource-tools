cd ../../.renders/
ffmpeg -i *.mp4 -vcodec libx264 -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -pix_fmt yuv420p -strict experimental -r 30 -t 2:20 -acodec aac -vb 2048k -minrate 2048k -maxrate 4096k -bufsize 4096k -ar 44100 -ac 2 twitter.mp4

$SHELL