clc;
clear all;
close all;


%load tal_brus_signaler
load TEST_REC/4/v.mat
load NOISE/engine/engine.mat
load NOISE/factory/factory.mat
Xtd = rec4v;
Xbu = factory;  


% Xtd is the speech recording on 6-channels
% Xtd(1,:) gives the first mic, Xtd(2,:) gives the second
% Xhf is another speech signal, extracted the same way
% Xbu is the noise signal, extracted the same way
% Fs = 12000;
Fs = 8000;

% normalizing speech signal against largest value in signal
% sp=Xtd/max(max(abs(Xtd)));
i = 15;
ch1=Xtd(1,i).ch1;
ch2=Xtd(1,i).ch2;
ch3=Xtd(1,i).ch3;
ch4=Xtd(1,i).ch4;
sp = [ch1';ch2';ch3';ch4'];

% Cuts the noise signals to the same size as the speech signal, and
% normalizing it
% noise=Xbu(:,1:size(sp,2))/max(max(abs(Xbu(:,1:size(sp,2)))));
ch1=Xbu.ch1(:,1:size(sp,2));
ch2=Xbu.ch2(:,1:size(sp,2));
ch3=Xbu.ch3(:,1:size(sp,2));
ch4=Xbu.ch4(:,1:size(sp,2));
noise = [ch1;ch2;ch3;ch4];
L=32; %Filter length

%%%%%%%%%%%%%%%%%%%%%%  LS  Beamformer %%%%%%%%%%%%%%%%%%%%%%%

% varför nollor? varför just ch3?
[W1] = LS_opt(sp+noise,[zeros(1,L/2) sp(2,1:end-L/2)],L);

[y_ls] = filter_beam((sp+noise),W1); % Here we can filter any noise + speech sequence
% 
% soundsc(sp(2,:)+noise(2,:),Fs)
% pause(4)
% soundsc(y_ls,Fs)

%wavwrite(0.80*[y_ls]/max(max(abs(y_ls))),Fs,'y_ls.wav')

figure,plot(sp(1,:)+noise(1,:))
figure,plot(y_ls)