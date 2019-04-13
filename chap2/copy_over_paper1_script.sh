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
cp /home/tvincent/Dropbox/Research/Notes/EllipticSolver/PaperALL/FourthVersion/custom_includes.tex .
ln -sf /home/tvincent/Dropbox/Research/Notes/EllipticSolver/PaperALL/FourthVersion/figures figures
sed -i 's|figures/|chap2/figures/|g' chap2.tex
sed -i 's|DomainImages/|chap2/DomainImages/|g' chap2.tex
ln -sf /home/tvincent/Dropbox/Research/Notes/EllipticSolver/PaperALL/FourthVersion/DomainImages DomainImages
sed -i 's|Cockburn.B1998,||g' chap2.tex

sed -i '/multigrid_hiearchy_begin/,/multigrid_hiearchy_end/{//!d}' chap2.tex
sed -i '/multigrid_hiearchy_begin/r multigrid_hiearchy_image.tex' chap2.tex
