clear all;clc;close all;
syms s k1 k2 k3 k4 k5 k6 ka1 ka2
%alfa = det(s*eye(4) - A + B*K)
A = [0 1 0 0 0 0; 0 0 -0.98 0 0 0; 0 0 0 1 0 0; 0 0 205.8 0 -98 0;
     0 0 0 0 0 1; 0 0 -196 0 196 0]
B = [0 ;0.5;0;-5;0;0]
C = [0 0 1 0 0 0;0 0 0 0 1 0]
D = [0;0]
F = [0 1 0 0 0 0;0 0 1 0 0 0;0 0 0 1 0 0;0 0 0 0 1 0;0 0 0 0 0 1;-180000 -126000 -63550 -13465 -1309 -59]
K_bar = [1 0 0 0 0 0]
%%rank(obsv(F,K_bar))=6
P=lyap(A,-F,-B*K_bar)
K = K_bar*inv(P)

%%part 5 feedback

A_bar = [A zeros(6,2);-C zeros(2,2)]
B_bar =[B;0;0]
F_bar = [0 1 0 0 0 0 0 0;0 0 1 0 0 0 0 0;0 0 0 1 0 0 0 0;0 0 0 0 1 0 0 0;0 0 0 0 0 1 0 0;0 0 0 0 0 0 1 0;0 0 0 0 0 0 0 1;-72000000 -57600000 -30640000 -8054000 -1125750 -89425 -4069 -99]
K_bar_bar = [1 0 0 0 0 0 0 0]
%%rank(obsv(F,K_bar))=6
P=lyap(A_bar,-F_bar,-B_bar*K_bar_bar)
K_ = K_bar_bar*inv(P) %K_=[-K ka]


%K2 = [k1 k2 k3 k4 k5 k6]
%ka = [ka1 ka2]
% part 5
% 
% F=s*det(s*eye(6)-A+B*K2)+ka*C*inv(s*eye(6)-A+B*K2)*B-s^6-59*s^5-1309*s^4-13465*s^3-63550*s^2-126000*s-180000,k1,k2,k3,k4,k5,k6,ka1,ka2==0
% S = solve(F,[k1 k2 k3 k4 k5 k6 ka1 ka2])
% simplify(S.k1)
% rank([B A;[0;0] -C])
% p = C*inv((s*eye(6)-A))*B
% solve(p(1)==0,s)