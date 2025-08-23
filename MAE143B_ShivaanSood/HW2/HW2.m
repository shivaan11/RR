%% Part 1 - Taken from HW2 PDF
clear; close all; clc;

d=12; a0=.02; 
G=RR_pade(d,2,2)*RR_tf(1,[1/a0 1]); D=1; P=1/0.5;

figure(1), RR_rlocus(G), axis([-.4 .3 -.3 .3]), grid on
title('Root Locus of G(s) with Padé(2,2)')
xlabel('Re'), ylabel('Im')

figure(2), g.T=200; RR_step(35+10*P*G*D/(1+G*D),g); axis([0 200 32 55])
title('Step Response of T(s) = Y/R, Padé(2,2)')
xlabel('Time (s)'), ylabel('Temp y(t) (°C)')

figure(3); RR_step(35+10*P*D/(1+G*D),g); axis([0 200 40 60])
title('Step Response of S_u(s) = U/R, Padé(2,2)')
xlabel('Time (s)'), ylabel('Valve Input u(t) (°C)')

%% Boring Solution
clear; close all; clc;

d=12; a0=.02; 
T0 = 35; T1 = 45; P = 1/0.5; g.T = 220;

G_2 = RR_pade(d,2,2)*RR_tf(1,[1/a0 1]);

K = 0.765;
D = K;

figure(1), RR_step(T0+(T1-T0)*P*(G_2*D/(1+G_2*D)),g), axis([0 220 32 55]), grid on;
title(sprintf('Boring: T(s)=GD/(1+GD), D=K, K=%.2f, Padé(2,2)',K));
xlabel('Time (s)'); ylabel('Temperature y(t) (°C)');

figure(2), RR_step(T0+(T1-T0)*P*(D/(1+G_2*D)),g), axis([0 220 40 60]), grid on;
title(sprintf('Boring: S_u(s)=D/(1+GD), D=K, K=%.2f, Padé(2,2)',K));
xlabel('Time (s)'); ylabel('u(t) (°C)');

G_16 = RR_pade(d,16,13)*RR_tf(1,[1/a0 1]);

figure(3), RR_step(T0+(T1-T0)*P*(G_16*D/(1+G_16*D)),g), axis([0 220 32 55]), grid on;
title(sprintf('Boring: T(s), D=K, K=%.2f, Padé(16,13)',K));
xlabel('Time (s)'); ylabel('Temperature y(t) (°C)');

figure(4), RR_step(T0+(T1-T0)*P*(D/(1+G_16*D)),g), axis([0 220 40 60]), grid on;
title(sprintf('Boring: S_u(s), D=K, K=%.2f, Padé(16,13)',K));
xlabel('Time (s)'); ylabel('u(t) (°C)');

%% Creative
clear; close all; clc;

d=12; a0=.02; 
T0 = 35; T1 = 45; P = 1/0.5; g.T = 220;

G_2 = RR_pade(d,2,2)*RR_tf(1,[1/a0 1]);

Kc = 0.7; ti = 60;
D = Kc*(1+RR_tf(1,[ti 0]));

figure(1), RR_step(T0+(T1-T0)*P*(G_2*D/(1+G_2*D)),g), axis([0 220 32 55]), grid on;
title(sprintf('Creative (PI): T(s), Kc=%.2f, Ki=%.0f, Padé(2,2)',Kc, ti));
xlabel('Time (s)'); ylabel('Temperature y(t) (°C)');

figure(2), RR_step(T0+(T1-T0)*P*(D/(1+G_2*D)),g), axis([0 220 40 60]), grid on;
title(sprintf('Creative (PI): S_u(s), Kc=%.2f, Ki=%.0f, Padé(2,2)',Kc, ti));
xlabel('Time (s)'); ylabel('u(t) (°C)');

G_16 = RR_pade(d,16,13)*RR_tf(1,[1/a0 1]);

figure(3), RR_step(T0+(T1-T0)*P*(G_16*D/(1+G_16*D)),g), axis([0 220 32 55]), grid on;
title('Creative (PI): T(s), Padé(16,13)');
xlabel('Time (s)'); ylabel('Temperature y(t) (°C)');

figure(4), RR_step(T0+(T1-T0)*P*(D/(1+G_16*D)),g), axis([0 220 40 60]), grid on;
title('Creative (PI): S_u(s), Padé(16,13)');
xlabel('Time (s)'); ylabel('u(t) (°C)');
