clc; clear; close all;

G = RR_tf(1,[1 0 100]);
z1=10; p1=10;
D = RR_tf([1 0 z1^2],[1 2*p1 p1^2]);

K=300; % For 15% overshoot, we pick zeta = 0.5

D1 = K * D;

g.K = logspace(-3,4,600);
figure(1); RR_rlocus(G,D,g);
grid on
title("Part 1: Root Locus of G(s)D1(s)")

figure(2); RR_step(G*D1/(1+G*D1)); grid on
title("Part 1: Step Response of G(s)D1(s) with K = 300")
