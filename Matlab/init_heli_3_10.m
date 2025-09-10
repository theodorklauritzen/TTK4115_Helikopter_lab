% FOR HELICOPTER NR 3-10
% This file contains the initialization for the helicopter assignment in
% the course TTK4115. Run this file before you execute QuaRC_ -> Build 
% to build the file heli_q8.mdl.

% Oppdatert høsten 2006 av Jostein Bakkeheim
% Oppdatert høsten 2008 av Arnfinn Aas Eielsen
% Oppdatert høsten 2009 av Jonathan Ronen
% Updated fall 2010, Dominik Breu
% Updated fall 2013, Mark Haring
% Updated spring 2015, Mark Haring


%%%%%%%%%%% Calibration of the encoder and the hardware for the specific
%%%%%%%%%%% helicopter
Joystick_gain_x = 1;
Joystick_gain_y = -1;
e_offset = 0.51;
V_s0 = 7.65;



%%%%%%%%%%% Physical constants
g = 9.81; % gravitational constant [m/s^2]
l_c = 0.46; % distance elevation axis to counterweight [m]
l_h = 0.66; % distance elevation axis to helicopter head [m]
l_p = 0.175; % distance pitch axis to motor [m]
m_c = 1.92; % Counterweight mass [kg]
m_p = 0.72; % Motor mass [kg]

%%%%%%%%%%% Calculated values
F_gf = -g*m_p;
F_gb = F_gf;
F_gc = g*m_c;

J_p = 2 * m_p * l_p^2;
J_e = m_c * l_c^2 + 2 * m_p * l_h^2;
J_l = m_c * l_c^2 + 2 * m_p * (l_h^2 + l_p^2);


L_2 = l_h*(F_gf + F_gb) + l_c * F_gc;
L_3 = -L_2/V_s0;
K_f = L_3 / l_h;
L_1 = l_p * K_f;
L_4 = l_h * K_f;

K_1 = L_1/J_p;
K_2 = L_3/J_e;
K_3 = L_4/J_l;

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
Q=[200,0,0;
    0,10,0;
    0,0,10];

R=[10,0;
    0,10];

K=lqr(A,B,Q,R);

F= [K(1,1),K(1,3);
    K(2,1),K(2,3)];
%%%%%%%%%%%%%%
stop_time = 30;

pole_1 = -0.7+1j;
pole_2 = -0.7-1j;

K_pp = pole_1 * pole_2 / K_1;
K_pd = -(pole_1 + pole_2) / K_1;

%

A=[
    0,1,0,0,0;
    0,0,0,0,0;
    0,0,0,0,0;
    -1,0,0,0,0;
    0,0,-1,0,0
];
B=[
    0,0;
    0,K_1;
    K_2,0;
    0,0;
    0,0;
];
G=[0,0;
    0,0;
    0,0;
    1,0;
    0,1
    ];
Q=[200,0,0,0,0;
    0,10,0,0,0;
    0,0,10,0,0;
    0,0,0,10,0;
    0,0,0,0,10];
R=[10,0;
    0,10];

K=lqr(A,B,Q,R);