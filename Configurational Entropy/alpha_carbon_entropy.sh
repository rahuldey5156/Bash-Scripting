echo 3 | gmx trjconv -f chainA.xtc -s chainA.pdb -b 295000 -o chainA_CA_last_5ns.xtc

echo 3 | gmx trjconv -f chainA.xtc -s chainA.pdb -dump 0 -o chainA_CA_0ns.pdb

echo 0 0 | gmx covar -f chainA_CA_last_5ns.xtc -s chainA_CA_0ns.pdb -o eig_CA.xvg -v eig_CA.trr -ascii eig_CA.dat

gmx anaeig -f chainA_CA_last_5ns.xtc -v eig_CA.trr -entropy -temp 310 -s chainA_CA_0ns.pdb -comp eig_CA.xvg
