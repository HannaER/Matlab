function G = beampattern(H, d, Fs, F, A)
% BEAMPATTERN Beam pattern for a uniform linear sensor array.
% G = BEAMPATTERN(H, d, Fs, F, A) computes the beam pattern for a uniform
%   linear sensor array filter and sum beamformer.
%
% Input parameters:
%
% H (real or complex matrix, size LxK)
%   This is a vector with beamformer filter weights, where L is the length
%   of the beamformer filters, and K is the number of channels.
%
% d (real scalar)
%   This is the sensor separation for the uniform linear sensor array,
%   measured in meters.
%
% Fs (real scalar)
%   The sampling frequency in Hz.
%
% F (real vector)
%   The frequencies for which the beam pattern is computed. The
%   range of frequencies are from 0 to Fs/s. Frequencies outside the range
%   reflects the symmetry of signal and sampling frequencies.
%
% A (real vector)
%   The directions for which the beam pattern is computed. The direction is
%   the angle in degrees relative the broadside of the sensor array. The
%   range of angles are from -90 to 90 degrees. Angles outside the range
%   reflects the symmetry of the uniform linear sensor array.
%
% Output parameters:
%
% G (real matrix, size MxN)
%   The beam pattern G is calculated for all frequencies Fm in F, and for
%   all directions Dn in D, where the number of frequencies in F is M, and
%   the number of angles in D is N.
%
%   The value G(m, n) is the gain of the sensor array for frequency F(m)
%   and direction D(n).
%
% Example application:
%
% Let us assume you have two channels, K=2, with two filters h0 and h1 each
% of size Lx1. The microphones are positioned 4 cm apart. You wish to
% compute the beam pattern for all directions and all frequencies.
%
% H = [h0, h1];           % the columns of H are beamformer filters
% d = 0.04;               % 4 cm sensor spacing
% Fs = 8000;              % 8 kHz sampling rate
% F = (0:200)/201 * Fs/2; % evaluate at 201 frequencies from 0 to Fs/2
% A = (-90:90);           % evaluate at 181 angles from -90 to 90 degrees
% G = beampattern(H, d, Fs, F, A);
%
% You can then plot your result.
%
% imagesc(A, F, G);
% axis('xy');
% xlabel('Direction [degrees]');
% ylabel('Frequency [Hz]');
% colorbar;
%
% For a simple beamformer, try h0=1 and h1=1. This beamformer have no
% temporal selectivity (the filters Hk(z)=1, so all frequencies passes),
% but some spatial selectivity. The beam pattern shows a beam centered at
% the angle A=0 degrees, where signals are in phase and adds
% constructively.
%
% At other angles, the beam pattern shows less gain, where signals are
% out of phase and adds destructively.
%
% By setting F and/or A to a single value, the beam pattern for that
% frequency or in that direction can be computed. Say you want to compute
% the beam pattern only at a certain frequency, say 2000 Hz.
%
% G = beampattern(H, d, Fs, 2000, A);
% plot(A, G);
% xlabel('Direction [degrees]');
% ylabel('Gain');

w = 2*pi*F(:)/Fs;
c = 344;

K = size(H, 2);
M = numel(F);
N = numel(A);

Hw = zeros(M, K);

for k = 1:K
    Hw(:, k) = polyval(H(:, k), exp(-1i*w));
end

G = zeros(M, N);
dk = d*(0:K-1) - d*(K-1)/2;

for n = 1:N
    dt = sind(A(n))*dk*Fs / c;
    G(:, n) = abs(sum(exp(1i*w*dt) .* Hw, 2));
end

end













