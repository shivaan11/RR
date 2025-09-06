clc; clear; close all;

G = RR_tf(1, [1 0 100]);
z2 = 9.7;
p1 = 10;
D = RR_tf([1 0 z2^2], [1 2*p1 p1^2]);

K  = 300;
D2 = K * D;

g.K = logspace(-3,4,800);       
figure(1); RR_rlocus(G, D, g); grid on
title("Part 2: Root Locus of G(s)D_2(s)")

T0 = (G*D2) / (1 + G*D2);

figure(2); RR_step(T0); grid on
title("Part 2: Step Response of G(s)D_2(s)")

