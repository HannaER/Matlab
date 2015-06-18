function [hdirect, hreverb] = IRFEstimationIM(Rsource, Rmic, Lroom, N, FS, RC, M)
% [hdirect, hreverb] = IRFEstimationIM(Rsource, Rmic, Lroom, N, FS, RC, M)
% Benny Sällberg 071114
%
% The method computes two composants of a room Impulse Response Function
% (IRF) according to the image method. The two composants of the room IRF
% comprise the direct path component in hdirect and all reverberant
% reflections in hreverb. This function is a wrapper function to the
% C-implementation funciton cIRFEstimationIM.c, and corresponding binary
% mex-file cIRFEstimationIM.mexw32.
%
% Input parameters
%
% Rsource [3x1] - real valued and positive coordinates (x,y,z) for the
% source's position in m. Note that each element of this vector must
% satisfy 0<Rsource[k]<Lroom[k], for k = 1,2,3, i.e. the source should be
% positioned within the room. 
%
% Rmic [3x1] - real valued and positive coordinates (x,y,z) for the
% microphone's position in m. Note that each element of this vector must
% satisfy 0<Rmic[k]<Lroom[k], for k = 1,2,3, i.e. the source should be
% positioned within the room. In addition should Rmic[k] <> Rsource[k] for
% all k.
%
% Lroom [3x1] - real valued and positive dimensions
% (width_x,depth_y,height_z) of the room itself in m.
%
% N [1x1] - real valued and positive integer scalar that corresponds to
% the desired number of taps in the synthesized impulse response function.
%
% FS [1x1] - real valued and positive scalar that corresponds to the
% sampling frequency in Hz.
%
% RC [1x1] - real valued and positive scalar that corresponds to the room
% absorption coefficient, satisfying 0<RC<1.
%
% M [1x1] - real valed and positive integer scalar that corresponds to the
% number of images in all directions taken. I.e. total number of images is
% M^3 8.
%
% Output parameters
%
% hdirect [Nx1] - real valued IRF corresponding to the direct path
% composant of the synthesized room IRF. 
%
% reverb [Nx1] - real valued IRF corresponding to the reverberant composant
% of the synthesized room IRF. 
% 

[Hdirect, Hreverb] = cIRFEstimationIM(Rsource, Rmic, Lroom, N, FS, RC, M);

hdirect = real(ifft([Hdirect; conj(flipud(Hdirect(2:end-1)))]));
hdirect = hdirect(1:N);

hreverb = real(ifft([Hreverb; conj(flipud(Hreverb(2:end-1)))]));
hreverb = hreverb(1:N);
