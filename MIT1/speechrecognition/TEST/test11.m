%%%%% Testa 1 meter mot databasen %%%%
clear all;
close all;
clc;

Fs = 8000;
K = 16; % filter length
L = 4; % antal micar som amn ska testa för, dvs. anatlet kurvor i grafen
M = 20; % antal brusnivåer, mätpunkter/kurva
N = 100; % 100 ord ska testas, 50/50 höger/vänster. Måste vara ett jämnt tal
P = 200; % antal ord(vänster/höger)/avstånd


N_REFLEC = 9; %N_REFLEC
BLOCK_LENGTH = 160; %BLOCK_LENGTH
OVERLAP = BLOCK_LENGTH/2; %OVERLAP
SUBSET_LENGTH = 12; %SUBSET_LENGTH
GAMMA = 0.5; % coefficient for pre_emhp


%% %%%%%%%%%%% 1 meter %%%%%%%%%%%%%%%%%%%%%%%%%

result11 = [];
result12 = [];
result13 = [];
result14 = [];
snr1 = []; % x-vector - the same for all 4



%calc the db of the signals as a mean. Use thresholding to only look at the
%speech(the top peaks). Use var() of the cut signal. Then use pow2db() of
%the var()-output

%VÄNSTER
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

%HÖGER
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

% anpassa noise-signalerna till decibel_ så att start värdet på SNR är 0. SNR =
% decibel_speech - decibel_noise = 0.
load NOISE/factory/factory.mat
load NOISE/engine/engine.mat

engine_noise = engine;
factory_noise = factory;

%BALANSERA NOISE mot SNR = 0
decibel_diff = decibel_1 - engine_noise.decibel;
engine_noise = set_decibel(engine_noise, decibel_diff);
decibel_diff = decibel_1 - factory_noise.decibel;
factory_noise = set_decibel(factory_noise, decibel_diff);

%DELA UPP NOISE OM 5000 SAMPLES
factory_noise = divide_into_segments(factory_noise, 5000);
engine_noise = divide_into_segments(engine_noise, 5000);

%SKAPA SNR VEKTORN SOM ÄR X-AXELN
for i = 1:M
    snr1 = [snr1 i]; % calc. the snr vector
end

ch1=rec1v(1,1).ch1;
ch2=rec1v(1,1).ch2;
ch3=rec1v(1,1).ch3;
ch4=rec1v(1,1).ch4;
current_word = [ch1';ch2';ch3';ch4'];
noise = engine_noise;
current_word_name = '';
for h = 1:L % L = antal micar
    % räkna ut filter
    [W1] = LS_optimal(current_word + noise.segments(1,1),[zeros(1,K/2) current_word(2,1:end-K/2)],K);
    for i = 1:M % M = antal brusnivåer
        wer_curr = 0;
        deletion = 0;
        insertion = 0;
        exceptions =[];
        for j = 1:N  % N = antal ord
            % randomly pick a word which have not been used yet
            if j <= N/2 % take 'vänster'
                index = get_random_word_index(1:1:P, exceptions);
                exceptions = [exceptions index];
                ch1 = rec1v(1,index).ch1;
                ch2 = rec1v(1,index).ch2;
                ch3 = rec1v(1,index).ch3;
                ch4 = rec1v(1,index).ch4;
                current_word_name = rec1v(1).name;
            else % take 'höger'
                if j == (N/2 + 1)
                    exceptions  = []; % resetting the used indices vector exceptions
                end
                index = get_random_word_index(1:1:P, exceptions);
                exceptions = [exceptions index];
                ch1 = rec1h(1,index).ch1;
                ch2 = rec1h(1,index).ch2;
                ch3 = rec1h(1,index).ch3;
                ch4 = rec1h(1,index).ch4;
                current_word_name = rec1h(1).name;
            end
            current_word = [ch1';ch2';ch3';ch4'];            
            % beamforming
            y_1 = filter_beam((current_word+noise),W1)
            % VAD --> y/n?
            index = vad(y_1, BLOCK_LENGTH, 6);
            if index > length(y_1)/2 % !detection
                deletion = deletion + 1;
            else                     % detection
                % rm_noise
                y_2 = rm_noise(y_1);
                % pre_emph
                y_3 = pre_emph(y_2, GAMMA);
                % maybe cut the signal backwards
                y_4 = cut_backwards(y_3, OVERLAP, 6);
                % block_frame
                y_5 = block_frame(y_4, BLOCK_LENGTH, OVERLAP);
                % schur_algo
                y_6 = schur_algo(y_5, N_REFLEC);
                % create_subsets
                y_7 = create_subsets(y_6, SUBSET_LENGTH);
                % matching against database --> y/n?
                match = 'y/n?';
                matching(y_7, 'DB\db.mat', current_word_name, SUBSET_LENGTH, N_REFLEC);
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








