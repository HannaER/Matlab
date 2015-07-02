clc;
close all;
clear all;



load NOISE/babble/babble.mat
load NOISE/white/white.mat
load NOISE/engine/engine.mat
load NOISE/factory/factory.mat


figure (1)
subplot(121)
% spectrogram(babble.ch1(1:10000))
% title('Spectrogram', 'FontWeight', 'bold');
L = length(babble.ch1(1:1000));
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(babble.ch1(1:1000),NFFT)/L;
f = 8000/2*linspace(0,1,NFFT/2+1);
plot(f,2*abs(Y(1:NFFT/2+1)),'LineWidth', 2) 
title('Amplitude Spectrum', 'FontSize', 16)
xlabel('Frequency (Hz)', 'FontSize', 16)
ylabel('|Y(f)|', 'FontSize', 16)
axis([0 4000 0 0.009]);
subplot(122)
[pxx,f] = pwelch(babble.ch1(1:1000),500,300,500,8000);
plot(f,10*log10(pxx),'LineWidth', 2)
title('Welch Power Spectrum Density Estimate', 'FontSize', 16);
xlabel('Frequency (Hz)', 'FontSize', 16)
ylabel('Magnitude (dB)', 'FontSize', 16)
axis([0 4000  -150 -50 ]);
% subplot(133)
% plot(babble.ch1(1:1000),'LineWidth', 2)
% title('Magnitude', 'FontWeight', 'bold', 'FontSize', 16);
% xlabel('Samples', 'FontSize', 16);
% ylabel('Magnitude', 'FontSize', 16);

figure (2)
subplot(121)
% spectrogram(white.ch1(1:10000))
% title('Spectrogram', 'FontWeight', 'bold');
L = length(white.ch1(1:1000));
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(white.ch1(1:1000),NFFT)/L;
f = 8000/2*linspace(0,1,NFFT/2+1);
plot(f,2*abs(Y(1:NFFT/2+1)),'LineWidth', 2) 
title('Amplitude Spectrum', 'FontSize', 16)
xlabel('Frequency (Hz)', 'FontSize', 16)
ylabel('|Y(f)|', 'FontSize', 16)
axis([0 4000 0 0.009]);
subplot(122)
%pwelch(white.ch1(1:10000))
[pxx,f] = pwelch(white.ch1(1:1000),500,300,500,8000);
plot(f,10*log10(pxx),'LineWidth', 2)
title('Welch Power Spectrum Density Estimate', 'FontSize', 16);
xlabel('Frequency (Hz)', 'FontSize', 16)
ylabel('Magnitude (dB)', 'FontSize', 16)
axis([0 4000  -150 -50 ]);

% subplot(133)
% plot(white.ch1(1:1000),'LineWidth', 2)
% title('Magnitude', 'FontWeight', 'bold', 'FontSize', 16);
% xlabel('Samples', 'FontSize', 16);
% ylabel('Magnitude', 'FontSize', 16);



figure (3)
subplot(121)
% spectrogram(factory.ch1(1:10000))
% title('Spectrogram', 'FontWeight', 'bold');
L = length(factory.ch1(1:1000));
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(factory.ch1(1:1000),NFFT)/L;
f = 8000/2*linspace(0,1,NFFT/2+1);
plot(f,2*abs(Y(1:NFFT/2+1)),'LineWidth', 2) 
title('Amplitude Spectrum', 'FontSize', 16)
xlabel('Frequency (Hz)', 'FontSize', 16)
ylabel('|Y(f)|', 'FontSize', 16)
axis([0 4000 0 0.009]);
subplot(122)
%pwelch(factory.ch1(1:10000))
[pxx,f] = pwelch(factory.ch1(1:1000),500,300,500,8000);
plot(f,10*log10(pxx),'LineWidth', 2)
title('Welch Power Spectrum Density Estimate', 'FontSize', 16);
xlabel('Frequency (Hz)', 'FontSize', 16)
ylabel('Magnitude (dB)', 'FontSize', 16)
axis([0 4000  -150 -50 ]);

% subplot(133)
% plot(factory.ch1(1:1000),'LineWidth', 2)
% title('Magnitude', 'FontWeight', 'bold', 'FontSize', 16);
% xlabel('Samples', 'FontSize', 16);
% ylabel('Magnitude', 'FontSize', 16);


figure (4)
subplot(121)
% spectrogram(engine.ch1(1:10000))
% title('Spectrogram', 'FontWeight', 'bold');
L = length(engine.ch1(1:1000));
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(engine.ch1(1:1000),NFFT)/L;
f = 8000/2*linspace(0,1,NFFT/2+1);
plot(f,2*abs(Y(1:NFFT/2+1)),'LineWidth', 2) 
title('Amplitude Spectrum', 'FontSize', 16)
xlabel('Frequency (Hz)', 'FontSize', 16)
ylabel('|Y(f)|', 'FontSize', 16)
axis([0 4000 0 0.009]);
subplot(122)
%pwelch(engine.ch1(1:10000))
[pxx,f] = pwelch(engine.ch1(1:1000),500,300,500,8000);
plot(f,10*log10(pxx),'LineWidth', 2)
title('Welch Power Spectrum Density Estimate', 'FontSize', 16);
xlabel('Frequency (Hz)', 'FontSize', 16)
ylabel('Magnitude (dB)', 'FontSize', 16)
axis([0 4000  -150 -50 ]);

% subplot(133)
% plot(engine.ch1(1:1000),'LineWidth', 2)
% title('Magnitude', 'FontWeight', 'bold', 'FontSize', 16);
% xlabel('Samples', 'FontSize', 16);
% ylabel('Magnitude', 'FontSize', 16);



