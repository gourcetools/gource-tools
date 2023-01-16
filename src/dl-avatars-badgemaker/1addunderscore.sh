cd ..
cd raw
for f in *\ *; do mv "$f" "${f// /_}"; done
cd ..
cd converter