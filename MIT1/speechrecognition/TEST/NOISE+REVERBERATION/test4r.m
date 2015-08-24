%%%%% Testa 4 meter mot databasen %%%%
clear all;
close all;
clc;

Fs = 8000;
K = 32; % filter length
L = 4; % antal micar som amn ska testa för, dvs. antalet kurvor i grafen
M = 62;% antal brusnivåer, mätpunkter/kurva
N = 100;% 100 ord ska testas, 50/50 höger/vänster. Måste vara ett jämnt tal
P = 200; % antal ord(vänster/höger)/avstånd som finns att utnyttja till tester


N_REFLEC = 9; %N_REFLEC
BLOCK_LENGTH = 160; %BLOCK_LENGTH
OVERLAP = BLOCK_LENGTH/2; %OVERLAP
SUBSET_LENGTH = 12; %SUBSET_LENGTH
GAMMA = 0.5; % coefficient for pre_emhp
THRESHOLD = 4;
START_SNR = -10;
DECIBEL_STEP = 0.5;


%%%%%%%%%%% 4 meter %%%%%%%%%%%%%%%%%%%%%%%%%

result4r.result41 = [];
result4r.result42 = [];
result4r.result43 = [];
result4r.result44 = [];
result4r.result41mbf = [];
snr4 = []; % x-vector - the same for all 4



%calc the db of the signals as a mean. Use thresholding to only look at the
%speech(the top peaks). Use var() of the cut signal. Then use pow2db() of
%the var()-output

%VÄNSTER
decibel_v = 0;
load TEST_REC/r4/v.mat
for i = 1:P % all words to iterate through
    temp1 = [];
    temp2 = [];
    temp3 = [];
    temp4 = [];
    for j = 1:length(rec4vr(1,1).ch1)
        if  abs(rec4vr(1,i).ch3(j)) > 0.0004 % this value is chosen by looking at recordings
            temp1 = [temp1 rec4vr(1,i).ch1(j)];
            temp2 = [temp2 rec4vr(1,i).ch2(j)];
            temp3 = [temp3 rec4vr(1,i).ch3(j)];
            temp4 = [temp4 rec4vr(1,i).ch4(j)];
        end
    end
    variance_ = mean([var(temp1) var(temp2) var(temp3) var(temp4)]);
    decibel_v = decibel_v + pow2db(variance_)*(1/P);
end

%HÖGER
decibel_h = 0;
load TEST_REC/r4/h.mat
for i = 1:P % all words to iterate through
    temp1 = [];
    temp2 = [];
    temp3 = [];
    temp4 = [];
    for j = 1:length(rec4hr(1,1).ch1)
        if  abs(rec4hr(1,i).ch3(j)) > 0.0004 % this value is chosen by looking at recordings
            temp1 = [temp1 rec4hr(1,i).ch1(j)];
            temp2 = [temp2 rec4hr(1,i).ch2(j)];
            temp3 = [temp3 rec4hr(1,i).ch3(j)];
            temp4 = [temp4 rec4hr(1,i).ch4(j)];
        end
    end
    variance_ = mean([var(temp1) var(temp2) var(temp3) var(temp4)]);
    decibel_h = decibel_h + pow2db(variance_)*(1/P);
end

decibel_4 = mean([decibel_v decibel_h]);

% anpassa noise-signalerna till decibel_ så att start värdet på SNR är 0. SNR =
% decibel_speech - decibel_noise = 0.
load NOISE/factory/factory.mat
load NOISE/engine/engine.mat
load NOISE/white/white.mat
load NOISE/babble/babble.mat

engine_noise = engine;
factory_noise = factory;
white_noise = white;
babble_noise = babble;

%BALANSERA NOISE mot SNR = START_SNR
decibel_diff = decibel_4 - engine_noise.decibel - START_SNR;
engine_noise = set_decibel(engine_noise, decibel_diff);
decibel_diff = decibel_4 - factory_noise.decibel - START_SNR;
factory_noise = set_decibel(factory_noise, decibel_diff);
decibel_diff = decibel_4 - white_noise.decibel - START_SNR;
white_noise = set_decibel(white_noise, decibel_diff);
decibel_diff = decibel_4 - babble_noise.decibel - START_SNR;
babble_noise = set_decibel(babble_noise, decibel_diff);

%DELA UPP NOISE OM 5000 SAMPLES
factory_noise = divide_into_segments(factory_noise, 5000);
engine_noise = divide_into_segments(engine_noise, 5000);
white_noise = divide_into_segments(white_noise, 5000);
babble_noise = divide_into_segments(babble_noise, 5000);

%SKAPA SNR VEKTORN SOM ÄR X-AXELN
for i = 1:M
    snr4 = [snr4 (START_SNR + (i-1)*DECIBEL_STEP)]; % calc. the snr vector
end

%SKAPA VEKTORERNA MED INDEXEN SOM SKALL ANVÄNDAS
exceptions = [];
exceptions2 = [];
temp = [];
for i = 1:N
    if i <= N/2
        index = get_random_word_index(1:1:P, exceptions);
        exceptions = [exceptions index];
    else
        index = get_random_word_index(1:1:P, temp);
        temp = [temp index];
    end
    index = get_random_word_index(1:1:length(engine_noise.segments), [exceptions2]);
    exceptions2 = [exceptions2 index];
    
end
exceptions = [exceptions temp];


%GET ONE WORD AND NOISE FOR THE LS_OPTIMAL FILTER FUNCTION
%index = get_random_word_index(1:1:P, []);
index = exceptions(1);
ch1=rec4vr(1,index).ch1;
ch2=rec4vr(1,index).ch2;
ch3=rec4vr(1,index).ch3;
ch4=rec4vr(1,index).ch4;
index = exceptions(2);
ch1= ch1 + rec4hr(1,index).ch1;
ch2= ch2 + rec4hr(1,index).ch2;
ch3= ch3 + rec4hr(1,index).ch3;
ch4= ch4 + rec4hr(1,index).ch4;
word_4_wiener = [ch1';ch2';ch3';ch4'];

noise = babble_noise;  % engine_noise;  %factory_noise; % white_noise;  %
index = exceptions2(1);
ch1 = noise.segments(1,index).ch1 + noise.segments(1,index + 1).ch1;
ch2 = noise.segments(1,index).ch2 + noise.segments(1,index + 1).ch2;
ch3 = noise.segments(1,index).ch3 + noise.segments(1,index + 1).ch3;
ch4 = noise.segments(1,index).ch4 + noise.segments(1,index + 1).ch4;
noise_4_wiener = [ch1;ch2;ch3;ch4];
%
% noise = factory_noise;
%
% ch1_w = [];
% ch2_w = [];
% ch3_w = [];
% ch4_w = [];
%
%
% ch1_n = [];
% ch2_n = [];
% ch3_n = [];
% ch4_n = [];
%
% for i = 1:N
%     index_w = exceptions(i);
%     index_n = exceptions2(i);
%     if i <= N/2
%         ch1_w = [ch1_w rec4vr(1,index_w).ch1'];
%         ch2_w = [ch2_w rec4vr(1,index_w).ch2'];
%         ch3_w = [ch3_w rec4vr(1,index_w).ch3'];
%         ch4_w = [ch4_w rec4vr(1,index_w).ch4'];
%
%     else
%         ch1_w = [ch1_w rec4hr(1,index_w).ch1'];
%         ch2_w = [ch2_w rec4hr(1,index_w).ch2'];
%         ch3_w = [ch3_w rec4hr(1,index_w).ch3'];
%         ch4_w = [ch4_w rec4hr(1,index_w).ch4'];
%
%     end
%     ch1_n = [ch1_n noise.segments(1,index_n).ch1];
%     ch2_n = [ch2_n noise.segments(1,index_n).ch2];
%     ch3_n = [ch3_n noise.segments(1,index_n).ch3];
%     ch4_n = [ch4_n noise.segments(1,index_n).ch4];
%
% end
%
% % word_4_wiener = [[ch1_w(1:5000*N/4) ch1_w(5000*N*3/4:end)];[ch2_w(1:5000*N/4) ch2_w(5000*N*3/4:end)];[ch3_w(1:5000*N/4) ch3_w(5000*N*3/4:end)];[ch4_w(1:5000*N/4) ch4_w(5000*N*3/4:end)]];
% % noise_4_wiener = [[ch1_n(1:5000*N/4) ch1_n(5000*N*3/4:end)];[ch2_n(1:5000*N/4) ch2_n(5000*N*3/4:end)];[ch3_n(1:5000*N/4) ch3_n(5000*N*3/4:end)];[ch4_n(1:5000*N/4) ch4_n(5000*N*3/4:end)]];
% word_4_wiener = [ch1_w(1:4*5000);ch2_w(1:4*5000);ch3_w(1:4*5000);ch4_w(1:4*5000)];
% noise_4_wiener = [ch1_n(1:4*5000);ch2_n(1:4*5000);ch3_n(1:4*5000);ch4_n(1:4*5000)];
% % word_4_wiener = [ch1_w;ch2_w;ch3_w;ch4_w];
% % noise_4_wiener = [ch1_n;ch2_n;ch3_n;ch4_n];

noise = set_decibel(noise, DECIBEL_STEP);
current_word_name = '';
noise_orig = noise;

for h = 1:L % L = antal micar
    % räkna ut filter
    %   W1 = LS_optimal(word_4_wiener(1:h,:) + noise_4_wiener(1:h,:),[zeros(1,K/2) word_4_wiener(2,1:end-K/2)],K);
    display(strcat(num2str(h), ' mic(s)'));
    noise = noise_orig;
    for i = 1:M % M = antal brusnivåer
        wer_curr = 0;
        deletion = 0;
        substitution = 0;
        right = 0;
        left = 0;
        no_match = 0;
        %set noise decibel level, update segments,
        noise = set_decibel(noise, -DECIBEL_STEP);
        noise = divide_into_segments(noise, 5000);
        current_snr = decibel_4 - noise.decibel;
        index = exceptions2(1);
        ch1 = noise.segments(1,index).ch1 + noise.segments(1,index + 1).ch1;
        ch2 = noise.segments(1,index).ch2 + noise.segments(1,index + 1).ch2;
        ch3 = noise.segments(1,index).ch3 + noise.segments(1,index + 1).ch3;
        ch4 = noise.segments(1,index).ch4 + noise.segments(1,index + 1).ch4;
        noise_4_wiener = [ch1;ch2;ch3;ch4];
        W1 = LS_optimal(word_4_wiener(1:h,:) + noise_4_wiener(1:h,:),[zeros(1,K/2) word_4_wiener(2,1:end-K/2)],K);
        for j = 1:N  % N = antal ord
            % randomly pick a word which have not been used yet
            index = exceptions(j);
            if j <= N/2 % take 'vänster'
                ch1 = rec4vr(1,index).ch1;
                ch2 = rec4vr(1,index).ch2;
                ch3 = rec4vr(1,index).ch3;
                ch4 = rec4vr(1,index).ch4;
                current_word_name = rec4vr(1).name;
            else % take 'höger'
                ch1 = rec4hr(1,index).ch1;
                ch2 = rec4hr(1,index).ch2;
                ch3 = rec4hr(1,index).ch3;
                ch4 = rec4hr(1,index).ch4;
                current_word_name = rec4hr(1).name;
            end
            w.ch1 = ch1;
            w.ch2 = ch2;
            w.ch3 = ch3;
            w.ch4 = ch4;
            current_word = [ch1';ch2';ch3';ch4'];
            current_word = current_word(1:h,:); % pick out the # of channel = # mics
            % randomly pick a noise segment(no exceptions), pick out # of mics to be used
            noise_index = exceptions2(j);
            ch1 = noise.segments(noise_index).ch1;
            ch2 = noise.segments(noise_index).ch2;
            ch3 = noise.segments(noise_index).ch3;
            ch4 = noise.segments(noise_index).ch4;
            n.ch1 = ch1;
            n.ch2 = ch2;
            n.ch3 = ch3;
            n.ch4 = ch4;
            noise_4_beam = [ch1;ch2;ch3;ch4];
            noise_4_beam = noise_4_beam(1:h,:); % pick out the # of channels = # mics
            % beamforming
            y_1 = filter_beam((current_word + noise_4_beam),W1);
            % VAD --> y/n?
            vad_index = vad(y_1, BLOCK_LENGTH, THRESHOLD);
            if vad_index > length(y_1)/2 % !detection
                deletion = deletion + 1;
            else                         % detection
                % rm_noise
                y_2 = rm_noise(y_1);
                % pre_emph
                y_3 = pre_emph(y_2, GAMMA);
                % maybe cut the signal backwards
                y_4 = cut_backwards(y_3, BLOCK_LENGTH, OVERLAP, THRESHOLD);
                % block_frame
                y_5 = block_frame(y_4, BLOCK_LENGTH, OVERLAP);
                % schur_algo
                y_6 = schur_algo(y_5, N_REFLEC);
                % create_subsets
                y_7 = create_subsets(y_6, SUBSET_LENGTH);
                % matching against database --> y/n?
                [match, reason] = matching(y_7, 'DB\db.mat', current_word_name, SUBSET_LENGTH, N_REFLEC);
                if strcmp(match,'yes') == 1
                    wer_curr = wer_curr + 1;
                else
                    substitution = substitution + 1;
                    if strcmp(reason, 'höger') == 1
                        right = right + 1;
                    elseif strcmp(reason, 'vänster') == 1
                        left = left + 1;
                    else
                        no_match = no_match + 1;
                    end
                end
            end
        end
        s.wer = wer_curr;
        s.deletion = deletion;
        s.substitution = substitution;
        s.snr = current_snr;
        s.right = right;
        s.left = left;
        s.wrong_word = right + left;
        s.no_match = no_match;
        eval(['result4r.result4' num2str(h) ' = [ result4r.result4' num2str(h)  ' s];']);
    end
end


for h = 1:1 % L = antal micar
    % räkna ut filter
    %   W1 = LS_optimal(word_4_wiener(1:h,:) + noise_4_wiener(1:h,:),[zeros(1,K/2) word_4_wiener(2,1:end-K/2)],K);
    display('1 mic - bf');
    noise = noise_orig;
    for i = 1:M % M = antal brusnivåer
        wer_curr = 0;
        deletion = 0;
        substitution = 0;
        right = 0;
        left = 0;
        no_match = 0;
        %set noise decibel level, update segments,
        noise = set_decibel(noise, -DECIBEL_STEP);
        noise = divide_into_segments(noise, 5000);
        current_snr = decibel_4 - noise.decibel;
        for j = 1:N  % N = antal ord
            % randomly pick a word which have not been used yet
            index = exceptions(j);
            if j <= N/2 % take 'vänster'
                ch1 = rec4vr(1,index).ch1;
                ch2 = rec4vr(1,index).ch2;
                ch3 = rec4vr(1,index).ch3;
                ch4 = rec4vr(1,index).ch4;
                current_word_name = rec4vr(1).name;
            else % take 'höger'
                ch1 = rec4hr(1,index).ch1;
                ch2 = rec4hr(1,index).ch2;
                ch3 = rec4hr(1,index).ch3;
                ch4 = rec4hr(1,index).ch4;
                current_word_name = rec4hr(1).name;
            end
            w.ch1 = ch1;
            w.ch2 = ch2;
            w.ch3 = ch3;
            w.ch4 = ch4;
            current_word = [ch1';ch2';ch3';ch4'];
            current_word = current_word(1:h,:); % pick out the # of channel = # mics
            % randomly pick a noise segment(no exceptions), pick out # of mics to be used
            noise_index = exceptions2(j);
            ch1 = noise.segments(noise_index).ch1;
            ch2 = noise.segments(noise_index).ch2;
            ch3 = noise.segments(noise_index).ch3;
            ch4 = noise.segments(noise_index).ch4;
            n.ch1 = ch1;
            n.ch2 = ch2;
            n.ch3 = ch3;
            n.ch4 = ch4;
            noise_4_beam = [ch1;ch2;ch3;ch4];
            noise_4_beam = noise_4_beam(1:h,:); % pick out the # of channels = # mics
            % no beamforming
            y_1 = current_word(h,:) + noise_4_beam(h,:);
            % VAD --> y/n?
            vad_index = vad(y_1, BLOCK_LENGTH, THRESHOLD);
            if vad_index > length(y_1)/2 % !detection
                deletion = deletion + 1;
            else                         % detection
                % rm_noise
                y_2 = rm_noise(y_1);
                % pre_emph
                y_3 = pre_emph(y_2, GAMMA);
                % maybe cut the signal backwards
                y_4 = cut_backwards(y_3, BLOCK_LENGTH, OVERLAP, THRESHOLD);
                % block_frame
                y_5 = block_frame(y_4, BLOCK_LENGTH, OVERLAP);
                % schur_algo
                y_6 = schur_algo(y_5, N_REFLEC);
                % create_subsets
                y_7 = create_subsets(y_6, SUBSET_LENGTH);
                % matching against database --> y/n?
                [match, reason] = matching(y_7, 'DB\db.mat', current_word_name, SUBSET_LENGTH, N_REFLEC);
                if strcmp(match,'yes') == 1
                    wer_curr = wer_curr + 1;
                else
                    substitution = substitution + 1;
                    if strcmp(reason, 'höger') == 1
                        right = right + 1;
                    elseif strcmp(reason, 'vänster') == 1
                        left = left + 1;
                    else
                        no_match = no_match + 1;
                    end
                end
            end
        end
        s.wer = wer_curr;
        s.deletion = deletion;
        s.substitution = substitution;
        s.snr = current_snr;
        s.right = right;
        s.left = left;
        s.wrong_word = right + left;
        s.no_match = no_match;
        eval(['result4r.result41mbf = [result4r.result41mbf s];']);
    end
end


display('finished test');
display('saving results');
save('TEST\NOISE\result4r.mat', 'result4r','-v7.3');
display('plotting');



temp = (START_SNR + M*DECIBEL_STEP + 10);
%PLOTTA
figure (1)
subplot(2,2,1)
y = extractfield(result4r.result41, 'wer');
plot(snr4,y);
title('One mic  + noise + reverberation - bf');
xlabel('SNR [dB]');
ylabel('Recognition rate [%]');

subplot(2,2,2)
y = extractfield(result4r.result42, 'wer');
plot(snr4,y, 'r');
title('Two mics + noise + reverberation + bf');
xlabel('SNR [dB]');
ylabel('Recognition rate [%]');

subplot(2,2,3)
y = extractfield(result4r.result43, 'wer');
plot(snr4, y, 'g');
title('Three mics + noise + reverberation + bf');
xlabel('SNR [dB]');
ylabel('Recognition rate [%]');

subplot(2,2,4)
y = extractfield(result4r.result44, 'wer');
plot(snr4, y, 'm');
title('Four mics + noise + reverberation + bf');
xlabel('SNR [dB]');
ylabel('Recognition rate [%]');



figure (2)
y = extractfield(result4r.result41mbf, 'wer');
plot(snr4, y, 'k-o', 'LineWidth', 1.5);
hold on;
y = extractfield(result4r.result41, 'wer');
plot(snr4,y, 'k-x', 'LineWidth', 1.5);
y = extractfield(result4r.result42, 'wer');
plot(snr4,y, 'k-s', 'LineWidth', 1.5);
y = extractfield(result4r.result43, 'wer');
plot(snr4, y, 'k-d', 'LineWidth', 1.5);
y = extractfield(result4r.result44, 'wer');
plot(snr4, y, 'k-p', 'LineWidth', 1.5);

title('4 meters', 'FontSize', 16);
legend( '1 mic  + noise + reverberation - bf', '1 mic  + noise + reverberation + bf','2 mics + noise + reverberation + bf','3 mics + noise + reverberation + bf','4 mics + noise + reverberation + bf', 'Location', 'SouthEast');
xlabel('SNR [dB]', 'FontSize', 16);
ylabel('Recognition Rate [%]', 'FontSize', 16);
set(gca, 'fontsize', 12);
axis([START_SNR (START_SNR + (M-1)*DECIBEL_STEP) 0 100]);



