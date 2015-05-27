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
save('NOISE\engine\h.mat', 'enh');


%%%%%%%%%%%%% ENGINE:BALANSERA:SUMMERA %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%BALANSERA
decibel_env = pow2db(mean([var(env.ch1) var(env.ch2) var(env.ch3) var(env.ch4)]));
decibel_enh = pow2db(mean([var(enh.ch1) var(enh.ch2) var(enh.ch3) var(enh.ch4)]));
diff =  decibel_env - decibel_enh;
if diff < 0
    env.ch1 = decibel_inc_dec(env.ch1, diff);
    env.ch2 = decibel_inc_dec(env.ch2, diff);
    env.ch3 = decibel_inc_dec(env.ch3, diff);
    env.ch4 = decibel_inc_dec(env.ch4, diff);
else
    enh.ch1 = decibel_inc_dec(enh.ch1, diff);
    enh.ch2 = decibel_inc_dec(enh.ch2, diff);
    enh.ch3 = decibel_inc_dec(enh.ch3, diff);
    enh.ch4 = decibel_inc_dec(enh.ch4, diff);
end

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
save('NOISE\factory\h.mat', 'fah');


%%%%%%%%%%%%% FACTORY:BALANSERA:SUMMERA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%BALANSERA
decibel_fav = pow2db(mean([var(fav.ch1) var(fav.ch2) var(fav.ch3) var(fav.ch4)]));
decibel_fah = pow2db(mean([var(fah.ch1) var(fah.ch2) var(fah.ch3) var(fah.ch4)]));
diff =  decibel_fav - decibel_fah;
if diff < 0
    fav.ch1 = decibel_inc_dec(fav.ch1, diff);
    fav.ch2 = decibel_inc_dec(fav.ch2, diff);
    fav.ch3 = decibel_inc_dec(fav.ch3, diff);
    fav.ch4 = decibel_inc_dec(fav.ch4, diff);
else
    fah.ch1 = decibel_inc_dec(fah.ch1, diff);
    fah.ch2 = decibel_inc_dec(fah.ch2, diff);
    fah.ch3 = decibel_inc_dec(fah.ch3, diff);
    fah.ch4 = decibel_inc_dec(fah.ch4, diff);
end

%SUMMERA
factory.ch1 = fav.ch1(25800:end-4201) + fah.ch1(1:end-30000);
factory.ch2 = fav.ch2(25800:end-4201) + fah.ch2(1:end-30000);
factory.ch3 = fav.ch3(25800:end-4201) + fah.ch3(1:end-30000);
factory.ch4 = fav.ch4(25800:end-4201) + fah.ch4(1:end-30000);
factory.decibel = pow2db(mean([var(factory.ch1) var(factory.ch2) var(factory.ch3) var(factory.ch4)]));
factory.name = 'factory';
save('NOISE\factory\factory.mat', 'factory');









