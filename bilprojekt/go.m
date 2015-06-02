clc;
clear all;
close all;


load tal_brus_signaler

% Xtd is the speech recording on 6-channels
% Xtd(1,:) gives the first mic, Xtd(2,:) gives the second
% Xhf is another speech signal, extracted the same way
% Xbu is the noise signal, extracted the same way
% Fs = 12kHz

% normalizing speech signal against largest value in signal
sp=Xtd/max(max(abs(Xtd)));

% Cuts the noise signals to the same size as the speech signal, and
% normalizing it
noise=Xbu(:,1:size(sp,2))/max(max(abs(Xbu(:,1:size(sp,2)))));

L=16; %Filter length

%%%%%%%%%%%%%%%%%%%%%%  LS  Beamformer %%%%%%%%%%%%%%%%%%%%%%%

% varför nollor? varför just ch3?
[W1] = LS_opt(sp+noise,[zeros(1,L/2) sp(3,1:end-L/2)],L);

[y_ls] = filt_beam((sp+noise),W1); % Here we can filter any noise + speech sequence

% soundsc(sp(3,:)+n(3,:),Fs)
% soundsc(y_ls,Fs)

%wavwrite(0.80*[y_ls]/max(max(abs(y_ls))),Fs,'y_ls.wav')

figure,plot(sp(1,:)+noise(1,:))
figure,plot(y_ls)