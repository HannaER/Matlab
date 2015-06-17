% ordna så att det är samma gain på de två kanalerna, summera och gaina
% till rätt startnivå(0 db SNR mot talsignalen)


close all;
clear all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%% ENGINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%
env.ch1 = [];
env.ch2 = [];
env.ch3 = [];
env.ch4 = [];
enh.ch1 = [];
enh.ch2 = [];
enh.ch3 = [];
enh.ch4 = [];


%%%%%%%%%%%%% ENGINE:VÄNSTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%

ev.ev1 = audioread('\Recordings\noise\engine\vänster\2015-05-25-160351\recording1.wav');
ev.ev2 = audioread('\Recordings\noise\engine\vänster\2015-05-25-160351\recording2.wav');
ev.ev3 = audioread('\Recordings\noise\engine\vänster\2015-05-25-160351\recording3.wav');
ev.ev4 = audioread('\Recordings\noise\engine\vänster\2015-05-25-160351\recording4.wav');

N = 4;
filename = 'ev';
for i = 1:N
    filename = getfield(ev, strcat('ev', num2str(i)));
    word = filename;
    env.ch1 = [env.ch1 word(:,1)'];
    env.ch2 = [env.ch2 word(:,2)'];
    env.ch3 = [env.ch3 word(:,3)'];
    env.ch4 = [env.ch4 word(:,4)'];
end
env.name = 'vänster';
env.decibel = pow2db(mean([var(env.ch1) var(env.ch2) var(env.ch3) var(env.ch4)]));
save('NOISE\engine\v.mat', 'env');

%%%%%%%%%%%%% ENGINE:HÖGER %%%%%%%%%%%%%%%%%%%%%%%%%%%%

eh.eh1 = audioread('\Recordings\noise\engine\höger\2015-05-25-155645\recording1.wav');
eh.eh2 = audioread('\Recordings\noise\engine\höger\2015-05-25-155645\recording2.wav');
eh.eh3 = audioread('\Recordings\noise\engine\höger\2015-05-25-155645\recording3.wav');
eh.eh4 = audioread('\Recordings\noise\engine\höger\2015-05-25-155645\recording4.wav');

N = 4;
filename = 'eh';
for i = 1:N
    filename = getfield(eh, strcat('eh', num2str(i)));
    word = filename;
    enh.ch1 = [enh.ch1 word(:,1)'];
    enh.ch2 = [enh.ch2 word(:,2)'];
    enh.ch3 = [enh.ch3 word(:,3)'];
    enh.ch4 = [enh.ch4 word(:,4)'];
end
enh.name = 'höger';
enh.decibel = pow2db(mean([var(enh.ch1) var(enh.ch2) var(enh.ch3) var(enh.ch4)]));
save('NOISE\engine\h.mat', 'enh');


%%%%%%%%%%%%% ENGINE:BALANSERA:SUMMERA %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%BALANSERA
decibel_diff = env.decibel - enh.decibel;
enh = set_decibel(enh, decibel_diff);

%SUMMERA
engine.ch1 = env.ch1(1:end-30000) + enh.ch1(1:end-30000);
engine.ch2 = env.ch2(1:end-30000) + enh.ch2(1:end-30000);
engine.ch3 = env.ch3(1:end-30000) + enh.ch3(1:end-30000);
engine.ch4 = env.ch4(1:end-30000) + enh.ch4(1:end-30000);
engine.decibel = pow2db(mean([var(engine.ch1) var(engine.ch2) var(engine.ch3) var(engine.ch4)]));
engine.name = 'engine';
save('NOISE\engine\engine.mat', 'engine');

%%%%%%%%%%%%%%%%%%%%%%%%%%%% FACTORY %%%%%%%%%%%%%%%%%%%%%%%%%%%%
fav.ch1 = [];
fav.ch2 = [];
fav.ch3 = [];
fav.ch4 = [];
fah.ch1 = [];
fah.ch2 = [];
fah.ch3 = [];
fah.ch4 = [];


%%%%%%%%%%%%% FACTORY:VÄNSTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%

fv.fv1 = audioread('\Recordings\noise\factory\vänster\2015-05-25-160117\recording1.wav');
fv.fv2 = audioread('\Recordings\noise\factory\vänster\2015-05-25-160117\recording2.wav');
fv.fv3 = audioread('\Recordings\noise\factory\vänster\2015-05-25-160117\recording3.wav');
fv.fv4 = audioread('\Recordings\noise\factory\vänster\2015-05-25-160117\recording4.wav');

N = 4;
filename = 'fv';
for i = 1:N
    filename = getfield(fv, strcat('fv', num2str(i)));
    word = filename;
    fav.ch1 = [fav.ch1 word(:,1)'];
    fav.ch2 = [fav.ch2 word(:,2)'];
    fav.ch3 = [fav.ch3 word(:,3)'];
    fav.ch4 = [fav.ch4 word(:,4)'];
end
fav.name = 'vänster';
fav.decibel = pow2db(mean([var(fav.ch1) var(fav.ch2) var(fav.ch3) var(fav.ch4)]));
save('NOISE\factory\v.mat', 'fav');

%%%%%%%%%%%%% FACTORY:HÖGER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fh.fh1 = audioread('\Recordings\noise\factory\höger\2015-05-25-155404\recording1.wav');
fh.fh2 = audioread('\Recordings\noise\factory\höger\2015-05-25-155404\recording2.wav');
fh.fh3 = audioread('\Recordings\noise\factory\höger\2015-05-25-155404\recording3.wav');
fh.fh4 = audioread('\Recordings\noise\factory\höger\2015-05-25-155404\recording4.wav');

N = 4;
filename = 'fh';
for i = 1:N
    filename = getfield(fh, strcat('fh', num2str(i)));
    word = filename;
    fah.ch1 = [fah.ch1 word(:,1)'];
    fah.ch2 = [fah.ch2 word(:,2)'];
    fah.ch3 = [fah.ch3 word(:,3)'];
    fah.ch4 = [fah.ch4 word(:,4)'];
end
fah.name = 'höger';
fah.decibel = pow2db(mean([var(fah.ch1) var(fah.ch2) var(fah.ch3) var(fah.ch4)]));
save('NOISE\factory\h.mat', 'fah');


%%%%%%%%%%%%% FACTORY:BALANSERA:SUMMERA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%BALANSERA
decibel_diff = fav.decibel - fah.decibel;
fah = set_decibel(fah, decibel_diff);
%SUMMERA
factory.ch1 = fav.ch1(25800:end-4201) + fah.ch1(1:end-30000);
factory.ch2 = fav.ch2(25800:end-4201) + fah.ch2(1:end-30000);
factory.ch3 = fav.ch3(25800:end-4201) + fah.ch3(1:end-30000);
factory.ch4 = fav.ch4(25800:end-4201) + fah.ch4(1:end-30000);
factory.decibel = pow2db(mean([var(factory.ch1) var(factory.ch2) var(factory.ch3) var(factory.ch4)]));
factory.name = 'factory';
save('NOISE\factory\factory.mat', 'factory');



%%%%%%%%%%%%%%%%%%%%%%%%%%%% WHITE %%%%%%%%%%%%%%%%%%%%%%%%%%%%
whv.ch1 = [];
whv.ch2 = [];
whv.ch3 = [];
whv.ch4 = [];
whh.ch1 = [];
whh.ch2 = [];
whh.ch3 = [];
whh.ch4 = [];


%%%%%%%%%%%%% WHITE:VÄNSTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%

wv.wv1 = audioread('\Recordings\noise\white\vänster\2015-06-16-091625\recording1.wav');
wv.wv2 = audioread('\Recordings\noise\white\vänster\2015-06-16-091625\recording2.wav');
wv.wv3 = audioread('\Recordings\noise\white\vänster\2015-06-16-091625\recording3.wav');
wv.wv4 = audioread('\Recordings\noise\white\vänster\2015-06-16-091625\recording4.wav');
wv.wv5 = audioread('\Recordings\noise\white\vänster\2015-06-16-091625\recording5.wav');
wv.wv6 = audioread('\Recordings\noise\white\vänster\2015-06-16-091625\recording6.wav');
wv.wv7 = audioread('\Recordings\noise\white\vänster\2015-06-16-091625\recording7.wav');
wv.wv8 = audioread('\Recordings\noise\white\vänster\2015-06-16-091625\recording8.wav');

N = 4;
filename = 'wv';
for i = 1:N
    filename = getfield(wv, strcat('wv', num2str(i)));
    word = filename;
    whv.ch1 = [whv.ch1 word(:,1)'];
    whv.ch2 = [whv.ch2 word(:,2)'];
    whv.ch3 = [whv.ch3 word(:,3)'];
    whv.ch4 = [whv.ch4 word(:,4)'];
end
whv.name = 'vänster';
whv.decibel = pow2db(mean([var(whv.ch1) var(whv.ch2) var(whv.ch3) var(whv.ch4)]));
save('NOISE\white\v.mat', 'whv');

%%%%%%%%%%%%% WHITE:HÖGER %%%%%%%%%%%%%%%%%%%%%%%%%%%%

wh.wh1 = audioread('\Recordings\noise\white\höger\2015-06-16-090903\recording1.wav');
wh.wh2 = audioread('\Recordings\noise\white\höger\2015-06-16-090903\recording2.wav');
wh.wh3 = audioread('\Recordings\noise\white\höger\2015-06-16-090903\recording3.wav');
wh.wh4 = audioread('\Recordings\noise\white\höger\2015-06-16-090903\recording4.wav');
wh.wh5 = audioread('\Recordings\noise\white\höger\2015-06-16-090903\recording5.wav');
wh.wh6 = audioread('\Recordings\noise\white\höger\2015-06-16-090903\recording6.wav');
wh.wh7 = audioread('\Recordings\noise\white\höger\2015-06-16-090903\recording7.wav');
wh.wh8 = audioread('\Recordings\noise\white\höger\2015-06-16-090903\recording8.wav');


N = 4;
filename = 'wh';
for i = 1:N
    filename = getfield(wh, strcat('wh', num2str(i)));
    word = filename;
    whh.ch1 = [whh.ch1 word(:,1)'];
    whh.ch2 = [whh.ch2 word(:,2)'];
    whh.ch3 = [whh.ch3 word(:,3)'];
    whh.ch4 = [whh.ch4 word(:,4)'];
end
whh.name = 'höger';
whh.decibel = pow2db(mean([var(whh.ch1) var(whh.ch2) var(whh.ch3) var(whh.ch4)]));
save('NOISE\white\h.mat', 'whh');


%%%%%%%%%%%%% WHITE:BALANSERA:SUMMERA %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%BALANSERA
decibel_diff = whv.decibel - whh.decibel;
whh = set_decibel(whh, decibel_diff);

%SUMMERA
white.ch1 = whv.ch1(1:end-30000) + whh.ch1(1:end-30000);
white.ch2 = whv.ch2(1:end-30000) + whh.ch2(1:end-30000);
white.ch3 = whv.ch3(1:end-30000) + whh.ch3(1:end-30000);
white.ch4 = whv.ch4(1:end-30000) + whh.ch4(1:end-30000);
white.decibel = pow2db(mean([var(white.ch1) var(white.ch2) var(white.ch3) var(white.ch4)]));
white.name = 'white';
save('NOISE\white\white.mat', 'white');








