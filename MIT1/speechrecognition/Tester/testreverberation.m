clc;
close all;
clear all;




load TEST_REC/1/v.mat % rec1v
load TEST_REC/1/h.mat % rec1h

load TEST_REC/2/v.mat % rec2v
load TEST_REC/2/h.mat % rec2h

load TEST_REC/4/v.mat % rec4v
load TEST_REC/4/h.mat % rec4h


t1 = rec1v(1);
distance = 1;
x = 4;
y = 6;
z = 3;
sx = 3;
sy = 5;
sz = 1;
mx = sx;
my = sy + distance;
mz = sz;

N_taps = 16;
N_images = 2;% M [1x1] - real valed and positive integer scalar that corresponds to the number of images in all directions taken. I.e. total number of images is M^3 8.
Fs = 8000;

RC = 0.5; % room absorption coefficient, satisfying 0<RC<1.
Rsource = [sx sy sz]'; % xyz
Rmic = [mx my mz]';
Lroom = [x y z]';
[Hdirect, Hreverb] = cIRFEstimationIM(Rsource, Rmic, Lroom, N_taps, Fs, RC, N_images);


soundsc(t1.ch1 ,8000);










