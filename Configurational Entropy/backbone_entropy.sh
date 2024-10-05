echo 4 | gmx trjconv -f chainA.xtc -s chainA.pdb -b 295000 -o chainA_backbone_last_5ns.xtc

echo 4 | gmx trjconv -f chainA.xtc -s chainA.pdb -dump 0 -o chainA_backbone_0ns.pdb

echo 0 0 | gmx covar -f chainA_backbone_last_5ns.xtc -s chainA_backbone_0ns.pdb -o eig_backbone.xvg -v eig_backbone.trr -ascii eig_backbone.dat

gmx anaeig -f chainA_backbone_last_5ns.xtc -v eig_backbone.trr -entropy -temp 310 -s chainA_backbone_0ns.pdb -comp eig_backbone.xvg
