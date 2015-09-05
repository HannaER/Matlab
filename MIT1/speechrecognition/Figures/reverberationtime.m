clc,
close all;
clear all;


distance = 1;%2,4
x = 4;
y = 6;
z = 3;
mx = 2;
my = 1;
mz = 1;
sx = mx;
sy = my + distance;
sz = mz;


N_taps = 5000;
N_images = 10;% M [1x1] - real valed and positive integer scalar that corresponds to the number of images in all directions taken. I.e. total number of images is M^3 8.
Fs = 16000;

RC = 0.5; % room absorption coefficient, satisfying 0<RC<1.
Rsource = [sx sy sz]'; % xyz
Rmic = [mx my mz]';
Lroom = [x y z]';
[Hdirect, Hreverb] = IRFEstimationIM(Rsource, Rmic, Lroom, N_taps, Fs, RC, N_images);

figure
plot(log(abs(Hdirect/0.08))*20);
figure
plot(log10(abs(Hreverb/0.08))*20)
