function fft_(input, L, fs, x)

% L =  Length of signal
% Fs =  Sample rate
% subplot number

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(input,NFFT)/L;
f = fs/2*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
subplot (x)
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of High Pitch Recording')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

end