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

decibel_env = pow2db(mean([var(env.ch1) var(env.ch2) var(env.ch3) var(env.ch4)]));
decibel_enh = pow2db(mean([var(enh.ch1) var(enh.ch2) var(enh.ch3) var(enh.ch4)]));
ratio = decibel_enh/decibel_env;
count = 1;
while(abs(ratio - 1) > 0.0001)    
    decibel_env = pow2db(mean([var(env.ch1) var(env.ch2) var(env.ch3) var(env.ch4)]));
    decibel_enh = pow2db(mean([var(enh.ch1) var(enh.ch2) var(enh.ch3) var(enh.ch4)]));
    ratio = decibel_enh/decibel_env;
    if ratio < 1
        env.ch1 = sqrt(ratio)*env.ch1;
        env.ch2 = sqrt(ratio)*env.ch2;
        env.ch3 = sqrt(ratio)*env.ch3;
        env.ch4 = sqrt(ratio)*env.ch4;
    else
        enh.ch1 = sqrt(ratio)*enh.ch1;
        enh.ch2 = sqrt(ratio)*enh.ch2;
        enh.ch3 = sqrt(ratio)*enh.ch3;
        enh.ch4 = sqrt(ratio)*enh.ch4;
    end   
    count = count + 1;
end

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


decibel_fav = pow2db(mean([var(fav.ch1) var(fav.ch2) var(fav.ch3) var(fav.ch4)]));
decibel_fah = pow2db(mean([var(fah.ch1) var(fah.ch2) var(fah.ch3) var(fah.ch4)]));
ratio = decibel_fah/decibel_fav;
count = 1;
while(abs(ratio - 1) > 0.0001)    
    decibel_fav = pow2db(mean([var(fav.ch1) var(fav.ch2) var(fav.ch3) var(fav.ch4)]));
    decibel_fah = pow2db(mean([var(fah.ch1) var(fah.ch2) var(fah.ch3) var(fah.ch4)]));
    ratio = decibel_fah/decibel_fav;
    if ratio < 1
        fav.ch1 = sqrt(ratio)*fav.ch1;
        fav.ch2 = sqrt(ratio)*fav.ch2;
        fav.ch3 = sqrt(ratio)*fav.ch3;
        fav.ch4 = sqrt(ratio)*fav.ch4;
    else
        fah.ch1 = sqrt(ratio)*fah.ch1;
        fah.ch2 = sqrt(ratio)*fah.ch2;
        fah.ch3 = sqrt(ratio)*fah.ch3;
        fah.ch4 = sqrt(ratio)*fah.ch4;
    end   
    count = count + 1;
end




