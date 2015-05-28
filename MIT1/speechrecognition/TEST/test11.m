%%%%% Testa 1 meter mot databasen %%%%
clear all;
close all;
clc;

L = 4; % antal micar som amn ska testa f�r, dvs. anatlet kurvor i grafen
M = 20; % antal brusniv�er, m�tpunkter/kurva
N = 100; % 100 ord ska testas, 50/50 h�ger/v�nster
P = 200; % antal ord(v�nster/h�ger)/avst�nd


%% %%%%%%%%%%% 1 meter %%%%%%%%%%%%%%%%%%%%%%%%%

result11 = [];
result12 = [];
result13 = [];
result14 = [];
snr1 = []; % x-vector - the same for all 4

%calc the db of the signals as a mean. Use thresholding to only look at the
%speech(the top peaks). Use var() of the cut signal. Then use pow2db() of
%the var()-output



%V�NSTER
decibel_v = 0;
load TEST_REC/1/v.mat
for i = 1:P % all words to iterate through
    temp1 = [];
    temp2 = [];
    temp3 = [];
    temp4 = [];
    for j = 1:length(rec1v(1,1).ch1)
        if  rec1v(1,i).ch3(j) > 0.005 % this value is chosen by looking at recordings
            temp1 = [temp1 rec1v(1,i).ch1(j)];
            temp2 = [temp2 rec1v(1,i).ch2(j)];
            temp3 = [temp3 rec1v(1,i).ch3(j)];
            temp4 = [temp4 rec1v(1,i).ch4(j)];
        end
    end
    variance_ = mean([var(temp1) var(temp2) var(temp3) var(temp4)]);
    decibel_v = decibel_v + pow2db(variance_)*(1/P);
end

%H�ger
decibel_h = 0;
load TEST_REC/1/h.mat
for i = 1:P % all words to iterate through
    temp1 = [];
    temp2 = [];
    temp3 = [];
    temp4 = [];
    for j = 1:length(rec1h(1,1).ch1)
        if  rec1h(1,i).ch3(j) > 0.005 % this value is chosen by looking at recordings
            temp1 = [temp1 rec1h(1,i).ch1(j)];
            temp2 = [temp2 rec1h(1,i).ch2(j)];
            temp3 = [temp3 rec1h(1,i).ch3(j)];
            temp4 = [temp4 rec1h(1,i).ch4(j)];
        end
    end
    variance_ = mean([var(temp1) var(temp2) var(temp3) var(temp4)]);
    decibel_h = decibel_h + pow2db(variance_)*(1/P);
end

decibel_1 = mean([decibel_v decibel_h]);
% anpassa noise-signalerna till decibel_ s� att start v�rdet p� SNR �r 0. SNR =
% decibel_speech - decibel_noise = 0.
load NOISE/engine/engine.mat
load NOISE/factory/factory.mat
engine_noise = engine;
factory_noise = factory;

%BALANSERA NOISE mot SNR = 0
decibel_diff = decibel_1 - engine_noise.decibel
engine_noise = set_decibel(engine_noise, decibel_diff);
decibel_diff = decibel_1 - factory_noise.decibel
factory_noise = set_decibel(factory_noise, decibel_diff);

% Skapa snr vektorn som �r x-axeln
for i = 1:M
    snr1 = [snr1 i]; % calc. the snr vector
end



for h = 1:L
    for i = 1:M
        wer_curr = 0;
        deletion = 0;
        insertion = 0;
        for j = 1:N
            
            % beamforming
            
            % VAD --> y/n?
            if strcmp(match,'y') ~= 1
                deletion = deletion + 1;
            else
                % rm_noise
                % pre_emph
                % maybe cut the signal again
                % block_frame
                % schur_algo
                % create_subsets
                
                % matching against database --> y/n?
                match = 'y/n?';
                if strcmp(match,'y') == 1
                    wer_curr = wer_curr + 1;
                else
                    insertion = insertion + 1;
                end
            end
        end
        s.wer = wer_curr;
        s.deletion = deletion;
        s.insertion = insertion;
        result11 = [result11 s];
    end
end


%PLOTTA








