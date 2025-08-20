clear; clc; close all;
s = tf('s');
G_1 = (s^2 + 10) / (8*s^4 + 210*s^2 + 900);

z = zero(G_1)
p = pole(G_1)

figure(1);
rlocus(G_1);
grid on;
title('Q2a: Root Locus')
xlabel('Re');
ylabel('Im');