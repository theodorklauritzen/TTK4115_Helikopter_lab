clear; clc;
init_heli_3_10

A=[
    0,1,0;
    0,0,0;
    0,0,0
];
B=[
    0,0;
    0,K_1;
    K_2,0
];

Co = ctrb(A, B)

rank(Co)

