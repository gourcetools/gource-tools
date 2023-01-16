cd ..
cd ..
cd logs


echo "Enter username: ";
read username

grep -i $username ACombinedLog.txt

#sed -i "/username/d" ACombinedLog.txt

#To delete all lines EXCEPT those matching the provided pattern you need to use the ! modifier:
sed -i "/$username/!d" ACombinedLog.txt

#tail ACombinedLog.txt