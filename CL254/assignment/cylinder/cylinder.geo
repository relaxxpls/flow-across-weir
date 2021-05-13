SetFactory("OpenCASCADE");
L=4;
H=2;
R=0.5;
NL=40;
NH=NL/L*H;
NR=NL/L*3.141*R;
N1=NL/L*(L/3-R);
N2=NL/L*(2*L/3-R);

Rectangle(1) = {0, 0, 0, L, H, 0};
Disk(2) = {L/3, 0, 0, R, R};
Disk(3) = {L/3, H, 0, R, R};
Disk(4) = {2*L/3, H/2, 0, R, R};

BooleanDifference{ Surface{1}; Delete; }{ Surface{3}; Delete; }
BooleanDifference{ Surface{1}; Delete; }{ Surface{2}; Delete; }
BooleanDifference{ Surface{1}; Delete; }{ Surface{4}; Delete; }
//+
Extrude {0, 0, 0.5} {
  Surface{1}; Layers{3}; Recombine;
}

Physical Surface("inlet") = {4};
Physical Surface("outlet") = {7};
Physical Surface("sym") = {2, 5, 9, 6};
Physical Surface("fw") = {3, 10, 8};
Physical Surface("fb") = {11, 1};
Physical Volume("vol") = {1};

Transfinite Curve {22, 10, 13, 28} = NH Using Progression 1;
Transfinite Curve {8, 18, 12, 26} = N1 Using Progression 1;
Transfinite Curve {11, 24, 15, 31} = N2 Using Progression 1;
Transfinite Curve {9, 20, 14, 30} = NR Using Progression 1;
Transfinite Curve {7, 33} = 2*NR Using Progression 1;
