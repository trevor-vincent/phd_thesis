paper="/home/tvincent/Dropbox/Research/Notes/BNS-Project/BNSPaper/papers-2018-BNS-M1-ParameterSpace/paper.tex"
begin=$(grep -n "section{Introduction" $paper | cut -d ":" -f1)
end=$(grep -n "begin{acknowledgements" $paper | cut -d ":" -f1)
lines=$(echo "$end - $begin + 1" | bc -l)
echo $begin $end $lines

cat chap3_header.tex > test.tex
printf "\n" >> test.tex
firstmatch="begin{abstract}"
secondmatch="end{abstract}"
sed "/$firstmatch/,/$secondmatch/!d;//d" $paper >> test.tex

cat $paper | head -n $end | tail -n $lines >> test.tex
tr -d "\015" < test.tex > test2.tex
head -n -1 test2.tex > chap3.tex
rm test.tex
rm test2.tex
ln -sf /home/tvincent/Dropbox/Research/Notes/BNS-Project/BNSPaper/papers-2018-BNS-M1-ParameterSpace/Figures Figures
sed -i 's|Figures/|chap3/Figures/|g' chap3.tex
sed -i 's|\ra|\rat|g' chap3.tex
