echo 9 | gmx trjconv -f chainA.xtc -s chainA.pdb -b 295000 -o chainA_sidechain_last_5ns.xtc

echo 9 | gmx trjconv -f chainA.xtc -s chainA.pdb -dump 0 -o chainA_sidechain_0ns.pdb

echo 0 0 | gmx covar -f chainA_sidechain_last_5ns.xtc -s chainA_sidechain_0ns.pdb -o eig_sidechain.xvg -v eig_sidechain.trr -ascii eig_sidechain.dat

gmx anaeig -f chainA_sidechain_last_5ns.xtc -v eig_sidechain.trr -entropy -temp 310 -s chainA_sidechain_0ns.pdb -comp eig_sidechain.xvg
