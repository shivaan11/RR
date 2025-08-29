clc; clear; close all;
a = 10;
G = RR_tf(a,[1 a]);
D  = RR_tf(10);

T = 0.01;
wc = 2*pi/T;
numFunc = [105*wc^4];
denFunc = [1, 10*wc, 45*wc^2, 105*wc^3, 105*wc^4];
theta4 = [1 10 45 105 105];
Func = RR_tf(numFunc, denFunc);

L1 = G*D*Func;
T1 = L1/(1+L1);

T2 = (G*D)/(1+G*D*Func);

g.T = 0.2;
figure(1)
RR_step(T1, g); hold on
RR_step(T2, g); grid on
title('Q3b: Closed-loop step responses')
ylabel('y(t)'); xlabel('t (s)')

