clc; clear; close all;
T = 0.01;
wc = 2*pi/T;
numFunc = [105*wc^4];
denFunc = [1, 10*wc, 45*wc^2, 105*wc^3, 105*wc^4];
theta4 = [1 10 45 105 105];

poles = wc * roots(theta4)

Func = RR_tf(numFunc, denFunc);

figure(1)
RR_bode(Func); grid on
sgtitle('Bode Plot for Q2')
subplot(2,1,1)
ylabel('Magnitude')
xlabel('Frequency (rad/s)')
subplot(2,1,2)
ylabel('Phase (deg)')
xlabel('Frequency (rad/s)')