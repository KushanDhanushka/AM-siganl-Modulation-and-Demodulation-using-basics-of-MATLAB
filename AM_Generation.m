% -------------------------------------------------------------------------
% E/18/075 ===== Dhanushka H K K
% EE357 - COMMUNICATION SYSTEMS
% AM Matlab Excercise
% AM GENERATION

%--------------------------------------------------------------------------
clear all
clc

%--------------------------------------------------------------------------
% Sampling Rate (fs in Hz) & Time Interval(dt in s)
fs = 100000;             % Sampling Frequency
dt = 1/fs;                   % Sampling Interval
t = 0:dt:(0.1-dt);         % span of time in seconds
N = length(t);              % Length of the signal                 
f = fs/2*linspace(-1,1,0.1*fs);         % span of frequencies in hertz

%------------------------------------------------------------------------
% Parameter Details For 3 cases.
Ac = 1;
ka = [0.5 0.7 1];               % Modulation index
fm = [500 1000 1000];   %in Hz
fc = [2000 5000 5000];   %in Hz

%------------------------------------------------------------------------
%Loop code...
for i =1:3
    ct = Ac*cos(2*pi*fc(i)*t);      % Carrier Signal = c(t)
    mt = cos(2*pi*fm(i)*t);         % Message Signal = m(t)
    st = Ac*(1+ka(i)*cos(2*pi*fm(i)*t)).*cos(2*pi*fc(i)*t);   % Modulated Signal =s(t)
    Sf = abs(fftshift(fft(st)));        % Frequency Spectrum of s(t)
  
    %--------------------------------------------------------------------------
     % Waveform Plots
    figure(i)       % In Time Domain
    
    subplot(3,1,1);
    plot(t,mt);
    title('Message Signal m(t) in Time Domain');
    xlabel('Time (s)');
    ylabel('m(t)');
    ylim([-1.5 1.5]);

    subplot(3,1,2);
    plot(t,ct);
    title('Carrier Signal c(t) in Time Domain');
    xlabel('Time (s)');
    ylabel('c(t)');
    ylim([-1.5 1.5]);

    subplot(3,1,3);
    plot(t,st);
    title('Modulated Signal s(t) in Time Domain');
    xlabel('Time (s)');
    ylabel('s(t)');
    ylim([-3 3]);

    figure(i+3)          % In Frequency Domain
    plot(f/1000,Sf/N);
    title('Modulated Signal S(f) in FrequencyDomain');
    xlabel('Frequency (kHz)');
    ylabel('S(f)');
end
%------------------------------------------------------------------------END
