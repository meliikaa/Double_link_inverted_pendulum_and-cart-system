clc;
clear all;
%% Parametrs
m1 = 2
m2 = 0.1
m3 = 0.1
r1 = 0.1
r2 = 0.1
g = 9.8
M = 2*m2^2 + m1*m3 + 2*m2*m3 + 2*m1*m2 + m1*m3
%% State Space
A = [0 1 0 0 0 0; 0 0 (-((m2+m3)*g)/m1) 0 0 0; 0 0 0 1 0 0; 0 0 ((M*g)/(2*r1*m1*m2)) 0 (-(m3*g)/(r1*m2)) 0;
     0 0 0 0 0 1; 0 0 (-((m2+m3)*g)/(r2*m2)) 0 (((m2+m3)*g)/(r2*m2)) 0]
B = [0 ;(1/m1);0;(-1/(r1*m1));0;0]
C = [0 0 1 0 0 0;0 0 0 0 1 0]
D = [0;0]
sys = ss(A,B,C,D)
%% Part 4 : Jordan
[V,j]=jordan(A)
%%J = ss2ss(sys,inv(V))
A_J = jordan(A)
B_J = inv(V)*B
C_J = C*V
D_J = D
sysj = ss(A_J,B_J,C_J,D_J)
%% Part 5 :Transfer Function & Pole-Zero Map
s = tf('s')
%G = ss2tf(A,B,C,D)
G = C*inv(s*eye(6)-A)*B+D
P = pole(G)
Z = tzero(G)
pzmap(G) 
%% Part 6 : Internal Stability
%s = tf('s')
syms s
eig_A = eig(A)
w = isstable(sys)
%% Part 7 : BIBO Stability
P = pole(sys)
%% Part 8 : fi
syms t s
fi = (inv(s*eye(6)-A))
fi_t =ilaplace(fi)
%fi_t = expm(A*t)

u = 1/s
x_0 = [1;0;0;0;0;0]
X = fi*x_0 + fi*B*u
Y = C*fi*x_0 + C*fi*B*u +D *u
X_t = ilaplace(X)
Y_t = ilaplace(Y)
%% Part 9 :Specify the initial conditions 
Vi = V ;
Wi_T = inv(V);
x0_1 = [0;0;0;1;0;0];
c_1 = Wi_T*x0_1;
x0_2 = [0;0;1;0;0;0];
c_2 = Wi_T*x0_2;
%% Part 10 : Kalman
 n = 6
 % Cheking Controlability & observability
 n1 = rank(ctrb(A,B))
 if(n1 == n)
     disp("System is controllable")
 else
     disp("System is not fully controllable")
 end
 n2 = rank(obsv(A,C))
 if(n2 == n)
     disp("System is observable")
 else
     disp("System is not fully observable")
 end
% Create Unique Conversion Matrix
rref_obsv = rref(obsv(A,C))
T_k = [0 0 1 0 0 0;0 0 0 1 0 0;0 0 0 0 1 0;0 0 0 0 0 1;1 1 0 0 0 0;0 1 0 0 0 0]
% Kalman Analysis
A_k = T_k*A*inv(T_k)
B_k = T_k*B
C_k = C*inv(T_k)
A_bar_o = A_k(1:n2,1:n2)
A_bar_o_bar = A_k(n2 + 1:n,n2 + 1:n)
A_bar_21 = A_k(n2 + 1:n,1:n2)
A_bar_0 = A_k(1:n2,n2 + 1:n)
B_bar_o = B_k(1:n2,:)
B_bar_o_bar = B_k(n2 + 1:n,:)
C_bar_o = C_k(:,1:n2)

%% Part 11 : Minimal Realization
sys = ss(A,B,C,D)
sysr = ss(A_bar_o,B_bar_o,C_bar_o,D)
%sysr = minreal(sys)
if(rank(sys.A) == rank(sysr.A))
   disp("The Realization is minimal")
else
   disp("The Realization is not minimal")
end;
eig_o = eig(A_bar_o)         % observable poles 
eig_o_bar = eig(A_bar_o_bar) % unobservable poles




