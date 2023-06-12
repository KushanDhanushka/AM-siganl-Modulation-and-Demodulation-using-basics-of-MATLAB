% -------------------------------------------------------------------------
% E/18/075 ===== Dhanushka H K K
% EE357 - COMMUNICATION SYSTEMS
% AM Matlab Excercise 
% AM DEMODULATION

%--------------------------------------------------------------------------
clear all
clc

%--------------------------------------------------------------------------
% Sampling Rate (fs in Hz) & Time Interval(dt in s)
fs = 50000;
dt = 1/fs;
%Setting the Time Span
t = 0:dt:(0.5-dt);

%------------------------------------------------------------------------
% CASE (i)
figure(1)
Ac = 1;
ka = 1;
fm = 1000; %in Hz
fc = 5000; %in Hz

mt = cos(2*pi*fm*t);
st = Ac*(1+ka*cos(2*pi*fm*t)).*cos(2*pi*fc*t); % s(t) = Ac.[1+ka.m(t)]cos(2.pi.fc.t) in Time Domain

% Through Squarer__
at = 2*(st.^2);
plot(t,at);

figure(2)
N = length(at); % Length of the signal                 
f = fs/2*linspace(-1,1,0.5*fs);
Af = abs(fftshift(fft(at))); % using Fast Fourier Transform
plot(f,Af/N);
title('Modulated Signal S(f) in FrequencyDomain');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

% LPF
figure(3)
order = 50; % filter order
f_cutoff = 1000;
LPfilt = fir1(order, 2*f_cutoff/fs);
hout = filter(LPfilt,1,at); % with unity denominator 
plot(t,hout);

figure(4)
N = length(hout); % Length of the signal                 
f = fs/2*linspace(-1,1,0.5*fs); % span of frequencies in hertz
Yf = abs(fftshift(fft(hout))); % using Fast Fourier Transform
plot(f,Yf/N);
title('Modulated Signal S(f) in FrequencyDomain');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

figure(5)
xt = sqrt(hout)-1;
plot(t,xt);

figure(6)
N = length(xt); % Length of the signal                 
f = fs/2*linspace(-1,1,0.5*fs); % span of frequencies in hertz
Xf = abs(fftshift(fft(xt))); % using Fast Fourier Transform
plot(f,Xf/N);







