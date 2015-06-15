% ordna så att det är samma gain på de två kanalerna, summera och gaina
% till rätt startnivå(0 db SNR mot talsignalen)


close all;
clear all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%% WHITE %%%%%%%%%%%%%%%%%%%%%%%%%%%%
wv.ch1 = [];
wv.ch2 = [];
wv.ch3 = [];
wv.ch4 = [];
wh.ch1 = [];
wh.ch2 = [];
wh.ch3 = [];
wh.ch4 = [];


%%%%%%%%%%%%% WHITE:VÄNSTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%


noise = wgn(930000, 4, 40);
wv.ch1 = [wv.ch1 noise(:,1)'];
wv.ch2 = [wv.ch2 noise(:,2)'];
wv.ch3 = [wv.ch3 noise(:,3)'];
wv.ch4 = [wv.ch4 noise(:,4)'];

wv.name = 'vänster';
wv.decibel = pow2db(mean([var(wv.ch1) var(wv.ch2) var(wv.ch3) var(wv.ch4)]));
save('NOISE\white\v.mat', 'wv');

%%%%%%%%%%%%% WHITE:HÖGER %%%%%%%%%%%%%%%%%%%%%%%%%%%%

noise = wgn(930000, 4, 40);
wh.ch1 = [wh.ch1 noise(:,1)'];
wh.ch2 = [wh.ch2 noise(:,2)'];
wh.ch3 = [wh.ch3 noise(:,3)'];
wh.ch4 = [wh.ch4 noise(:,4)'];

wh.name = 'höger';
wh.decibel = pow2db(mean([var(wh.ch1) var(wh.ch2) var(wh.ch3) var(wh.ch4)]));
save('NOISE\white\h.mat', 'wh');


%%%%%%%%%%%%% WHITE:BALANSERA:SUMMERA %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%BALANSERA
decibel_diff = wv.decibel - wh.decibel;
wh = set_decibel(wh, decibel_diff);

%SUMMERA
white.ch1 = wv.ch1 + wh.ch1;
white.ch2 = wv.ch2 + wh.ch2;
white.ch3 = wv.ch3 + wh.ch3;
white.ch4 = wv.ch4 + wh.ch4;
white.decibel = pow2db(mean([var(white.ch1) var(white.ch2) var(white.ch3) var(white.ch4)]));
white.name = 'white';
save('NOISE\white\white.mat', 'white');










