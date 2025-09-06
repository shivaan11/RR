clc; clear; close all;

% Plant and Pade 8,8
G = RR_tf(1, [1 0 100]);
d = 0.005;
F88 = RR_pade(d, 8, 8);
Gd = F88 * G;

% same controller as part 2, as well as K
z2 = 9.7;
p1 = 10;
D = RR_tf([1 0 z2^2], [1 2*p1 p1^2]);

K  = 300;
D2 = K * D;

% root locus
g.K = logspace(-3,5,900);
figure(1); RR_rlocus(Gd, D, g); grid on
title('Part 4: Root locus of  G(s)F_{8,8}(s)D_2(s)')

% step response
T = (Gd*D2) / (1 + Gd*D2);
figure(2); RR_step(T); grid on
title('Part 4: Step Response (K = 300)')

