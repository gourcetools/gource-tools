echo "
┌─┐┌─┐┬ ┬┬─┐┌─┐┌─┐  ┌┬┐┌─┐┌─┐┬  ┌─┐
│ ┬│ ││ │├┬┘│  ├┤    │ │ ││ ││  └─┐
└─┘└─┘└─┘┴└─└─┘└─┘   ┴ └─┘└─┘┴─┘└─┘
/ Logs Combiner /
"

cd ..
cd ..
cd logs


# Combine logs
cat *.txt | sort -n > ACombinedLog.txt

# Remove possible double entries
sed -i '$!N; /^\(.*\)\n\1$/!P; D' ACombinedLog.txt

echo Done