gmx trjcat -f md*.xtc -o combine.xtc

echo 1 | gmx trjconv -f combine.xtc -s md.tpr -pbc whole -o protein.xtc

echo 1 | gmx trjconv -f protein.xtc -s md.tpr -pbc nojump -o try.xtc

echo 4 1 | gmx trjconv -f try.xtc -s md.tpr -pbc mol -center -o try1.xtc

rm protein.xtc try.xtc

echo 1 | gmx trjconv -f combine.xtc -s md.tpr -dump 0 -o protein_0ns.pdb
