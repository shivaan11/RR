clc; clear; close all
a = 10;                          
G = RR_tf(a,[1 a]);              
D = RR_tf(1);                    
g.K = logspace(-3,3,400);        

figure(1); RR_rlocus(G, D, g); grid on
title('Root Locus of G(s)=a/(s+a)')

K = 10;                          
s_cl = -(1+K)*a;                 
hold on; plot(real(s_cl),0,'k*','MarkerSize',8)  
xlabel('Re'); ylabel('Im')

L = G*RR_tf(10);           
figure(2); RR_bode(L); grid on
sgtitle('Bode of L(s)=G(s)D(s) for design (K=10)')
subplot(2,1,1)
ylabel('Magnitude')
xlabel('Frequency (rad/s)')
subplot(2,1,2)
ylabel('Phase (deg)')
xlabel('Frequency (rad/s)')

T = L/(1+L);
g.T = 0.2;                          
figure(3); RR_step(T, g); grid on
title('Step of T(s)=L/(1+L)'); ylabel('y(t)')

figure(4); RR_bode(T); grid on
sgtitle('Bode of T(s)')
subplot(2,1,1)
ylabel('Magnitude')
xlabel('Frequency (rad/s)')
subplot(2,1,2)
ylabel('Phase (deg)')
xlabel('Frequency (rad/s)')
