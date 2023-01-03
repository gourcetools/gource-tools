cd ..
cd raw

for f in *.png; do
  convert ./"$f" ./"${f%.png}.gif"
  echo Converting 
done

rm *png

cd..
cd converter