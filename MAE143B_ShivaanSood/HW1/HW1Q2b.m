clear; clc; close all;

s = tf('s');
G = (s^2 + 10)/(8*s^4 + 210*s^2 + 900);

p = pole(G);
wp = sort(abs(imag(p)));
w1 = wp(1);
w2 = wp(2);

damp = 0.1;

N1 = (s^2 + w1^2) / (s^2 + 2*damp*w1*s + w1^2);
N2 = (s^2 + w2^2) / (s^2 + 2*damp*w2*s + w2^2);
D1 = minreal(N1*N2);

fprintf('D1(0) = %.4f \n', dcgain(D1));

w1_span = w1*[0.95 1 1.05];
w2_span = w2*[0.95 1 1.05];
magD1_w1 = squeeze(abs(freqresp(D1, w1_span)));
magD1_w2 = squeeze(abs(freqresp(D1, w2_span)));
