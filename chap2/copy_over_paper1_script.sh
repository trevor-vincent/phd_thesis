paper="/home/tvincent/Dropbox/Research/Notes/EllipticSolver/PaperALL/FourthVersion/paper.tex"
begin=$(grep -n "section{Introduction" $paper | cut -d ":" -f1)
end=$(grep -n "begin{acknowledgements" $paper | cut -d ":" -f1)
lines=$(echo "$end - $begin + 1" | bc -l)
echo $begin $end $lines

cat chap2_header.tex > test.tex
cat $paper | head -n $end | tail -n $lines >> test.tex
tr -d "\015" < test.tex > test2.tex
head -n -1 test2.tex > chap2.tex
rm test.tex
rm test2.tex
