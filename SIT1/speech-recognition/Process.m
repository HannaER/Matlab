function F = Process(myRec2, Freq)
% Processing the signal by filtering and dividing into block. Input needed
% is the recorded signal and sample frequency.

%% Display prerecorded sound
%{
figure(1)
plot(myRec2);
title('Audio Recording 1')
xlabel('Duration time (ms)')
ylabel('Amplitude')
%}

%% FFT Rec

%{
L = 8000;  % Length of signal
Fs = 8000; % Sample rate

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(myRec2,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
figure(2)
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of High Pitch Recording')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

%}

%% High pass filtering

hp_filter_coef = HighPassFilter(Freq);
filterRec = filter(hp_filter_coef.Numerator, 1, myRec2);

figure(1)
hold on
plot(filterRec, 'r');
title('Audio Recording 1')
xlabel('Duration time (ms)')
ylabel('Amplitude')

%% BlockFraming
Y = BlockFrame(filterRec);
Frame = filter(hamming(10),1,Y);

%% FFT Filtered Rec
%{
for k=1:4
    figure(k)


L = 8000;  % Length of signal
Fs = 8000; % Sample rate

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(filterRec(:, k),NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of Recording 1')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

end

for k=1:4
    figure(k+4)


L = 8000;  % Length of signal
Fs = 8000; % Sample rate

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(filterRec2(:, k),NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of Recording 1')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

end
%}
%%

F = Frame;

end