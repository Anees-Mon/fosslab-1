#!/bin/sh
wget -q "https://ktu.edu.in/eu/att/attachments.htm?download=file&id=hMcUg%2FGA7hU0MOUh4%2FFRxndixG2o4goWV%2B7LYFH48bc%3D" -O S1.pdf
wget -q "https://ktu.edu.in/eu/att/attachments.htm?download=file&id=B28XbixhL2qNkNOb51le3Q%2BfFwQNveszAdAr7o%2FUwqY%3D" -O S2.pdf
wget -q "http://14.139.184.212/ask/c4b/c4b.txt" -O cs4blist.txt
pdftotext -layout S1.pdf S1.txt
pdftotext -layout S2.pdf S2.txt

cut  -f4,5 cs4blist.txt>c4b.txt
awk '{ print($1,$2,$3)}' c4b.txt >c4b1.txt
tr -d '\040\012'<S1.txt>S1t.txt
tr -d '\040\012'<S2.txt>S2t.txt
sed -i 's/MDL16CS/\nMDL16CS/g' S1t.txt
sed -i 's/MDL16CS/\nMDL16CS/g' S2t.txt
sed -i 's/TCE16CS/\nTCE16CS/g' S1t.txt
sed -i 's/TCE16CS/\nTCE16CS/g' S2t.txt
sed -i 's/ELECTRONICSANDBIOMEDICAL/\nELECTRONICSANDBIOMEDICAL/g' S1t.txt
sed -i 's/ELECTRONICSANDBIOMEDICAL/\nELECTRONICSANDBIOMEDICAL/g' S2t.txt
grep 'MDL16CS' S1t.txt >S11.txt       #S11.txt contains mark list of cs students
grep 'MDL16CS' S2t.txt >S21.txt
grep 'MDL16CS' c4b1.txt >c4bf.txt
sed -i 's/MA101/  :Ma101/g' S11.txt
sed -i 's/CY100/  :CY100/g' S21.txt
join  c4bf.txt S11.txt>joins1.txt
join  c4bf.txt S21.txt>joins2.txt
column -t -s $':' joins1.txt >joins11.txt
column -t -s $':' joins2.txt >joins21.txt
sed -i 's/(O)/ 10/g' joins21.txt
sed -i 's/(A+)/ 9/g' joins21.txt
sed -i 's/(A)/ 8.5/g' joins21.txt
sed -i 's/(B+)/ 8/g' joins21.txt
sed -i 's/(B)/ 7/g' joins21.txt
sed -i 's/(C)/ 6/g' joins21.txt
sed -i 's/(P)/ 5/g' joins21.txt
sed -i 's/(F)/ 0/g' joins21.txt
sed -i 's/CY100/  4/g' joins21.txt
sed -i 's/MA102/4/g' joins21.txt
sed -i 's/BE100/4/g' joins21.txt
sed -i 's/BE102/3/g' joins21.txt
sed -i 's/EC100/3/g' joins21.txt
sed -i 's/CS100/ 3/g' joins21.txt
sed -i 's/,CS120/ 1/g' joins21.txt
sed -i 's/EC110/1/g' joins21.txt
sed -i 's/CY110/1/g' joins21.txt
sed -i 's/,/ /g' joins21.txt

sed -i 's/(O)/ 10/g' joins11.txt
sed -i 's/(A+)/ 9/g' joins11.txt
sed -i 's/(A)/ 8.5/g' joins11.txt
sed -i 's/(B+)/ 8/g' joins11.txt
sed -i 's/(B)/ 7/g' joins11.txt
sed -i 's/(C)/ 6/g' joins11.txt
sed -i 's/(P)/ 5/g' joins11.txt
sed -i 's/(F)/ 0/g' joins11.txt
sed -i 's/Ma101/4/g' joins11.txt
sed -i 's/PH100/4/g' joins11.txt
sed -i 's/BE110/3/g' joins11.txt
sed -i 's/BE10105/3/g' joins11.txt
sed -i 's/BE103/3/g' joins11.txt
sed -i 's/EE100/3/g' joins11.txt
sed -i 's/PH110/1/g' joins11.txt
sed -i 's/EE110/1/g' joins11.txt
sed -i 's/CS110/ 1/g' joins11.txt
sed -i 's/,/ /g' joins11.txt
awk '{ print ($1" "$2" "$3":"($4 * $5 + $6 * $7 + $8* $9 + $10 * $11 + $12 * $13 + $14 * $15 + $16 * $17 + $18 * $19 + $20 * $21) /23) }' joins11.txt>s1sgpa1.txt
awk '{ print ($1" "$2" "$3":"($4 * $5 + $6 * $7 + $8* $9 + $10 * $11 + $12 * $13 + $14 * $15 + $16 * $17 + $18 * $19 + $20 * $21) /23) }' joins21.txt>s2sgpa1.txt
column -t -s $':' s1sgpa1.txt > s1sgpa.txt
column -t -s $':' s2sgpa1.txt > s2sgpa.txt
cut -d ':' -f2 s2sgpa1.txt>s2sgpa3.txt
paste s1sgpa.txt s2sgpa3.txt |awk '{ print ($1" "$2" "$3"  :"($4*23 + $5*24) /47) }'|column -t -s $':'>cgpa.txt
echo
echo  *****************CGPA OF CS4B STUDENTS******************
echo
cat cgpa.txt
rm c4b*.txt
rm joins*.txt
rm *.pdf
rm S*.txt
rm s1sgpa1.txt
rm s2sgpa1.txt
rm s2sgpa3.txt
rm cs4blist.txt
