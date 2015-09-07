%%%%% Testa 1 meter mot databasen %%%%
clear all;
close all;
clc;

Fs = 8000;
K = 32; % filter length
L = 4; % antal micar som amn ska testa f�r, dvs. antalet kurvor i grafen
M = 31;% antal brusniv�er, m�tpunkter/kurva
N = 100;% 100 ord ska testas, 50/50 h�ger/v�nster. M�ste vara ett j�mnt tal
P = 200; % antal ord(v�nster/h�ger)/avst�nd som finns att utnyttja till tester


N_REFLEC = 9; %N_REFLEC
BLOCK_LENGTH = 160; %BLOCK_LENGTH
OVERLAP = BLOCK_LENGTH/2; %OVERLAP
SUBSET_LENGTH = 12; %SUBSET_LENGTH
GAMMA = 0.5; % coefficient for pre_emhp
THRESHOLD = 4;
START_SNR = -10;
DECIBEL_STEP = 1;

result1.result11 = [];
result1.result12 = [];
result1.result13 = [];
result1.result14 = [];
result1.result11mbf = [];
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
        if  abs(rec1v(1,i).ch3(j)) > 0.005 % this value is chosen by looking at recordings
            temp1 = [temp1 rec1v(1,i).ch1(j)];
            temp2 = [temp2 rec1v(1,i).ch2(j)];
            temp3 = [temp3 rec1v(1,i).ch3(j)];
            temp4 = [temp4 rec1v(1,i).ch4(j)];
        end
    end
    variance_ = mean([var(temp1) var(temp2) var(temp3) var(temp4)]);
    decibel_v = decibel_v + pow2db(variance_)*(1/P);
end

%H�GER
decibel_h = 0;
load TEST_REC/1/h.mat
for i = 1:P % all words to iterate through
    temp1 = [];
    temp2 = [];
    temp3 = [];
    temp4 = [];
    for j = 1:length(rec1h(1,1).ch1)
        if  abs(rec1h(1,i).ch3(j)) > 0.005 % this value is chosen by looking at recordings
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
load NOISE/factory/factory.mat
load NOISE/engine/engine.mat
load NOISE/white/white.mat
load NOISE/babble/babble.mat

engine_noise = engine;
factory_noise = factory;
white_noise = white;
babble_noise = babble;

engine_orig = engine_noise;
factory_orig = factory_noise;
white_orig = white_noise;
babble_orig = babble_noise;

%increase length of noise recordings by 5
engine_noise.ch1 = [engine_noise.ch1 engine_noise.ch1 engine_noise.ch1 engine_noise.ch1 engine_noise.ch1];
engine_noise.ch2 = [engine_noise.ch2 engine_noise.ch2 engine_noise.ch2 engine_noise.ch2 engine_noise.ch2];
engine_noise.ch3 = [engine_noise.ch3 engine_noise.ch3 engine_noise.ch3 engine_noise.ch3 engine_noise.ch3];
engine_noise.ch4 = [engine_noise.ch4 engine_noise.ch4 engine_noise.ch4 engine_noise.ch4 engine_noise.ch4];

factory_noise.ch1 = [factory_noise.ch1 factory_noise.ch1 factory_noise.ch1 factory_noise.ch1 factory_noise.ch1];
factory_noise.ch2 = [factory_noise.ch2 factory_noise.ch2 factory_noise.ch2 factory_noise.ch2 factory_noise.ch2];
factory_noise.ch3 = [factory_noise.ch3 factory_noise.ch3 factory_noise.ch3 factory_noise.ch3 factory_noise.ch3];
factory_noise.ch4 = [factory_noise.ch4 factory_noise.ch4 factory_noise.ch4 factory_noise.ch4 factory_noise.ch4];

white_noise.ch1 = [white_noise.ch1 white_noise.ch1 white_noise.ch1 white_noise.ch1 white_noise.ch1];
white_noise.ch2 = [white_noise.ch2 white_noise.ch2 white_noise.ch2 white_noise.ch2 white_noise.ch2];
white_noise.ch3 = [white_noise.ch3 white_noise.ch3 white_noise.ch3 white_noise.ch3 white_noise.ch3];
white_noise.ch4 = [white_noise.ch4 white_noise.ch4 white_noise.ch4 white_noise.ch4 white_noise.ch4];

babble_noise.ch1 = [babble_noise.ch1 babble_noise.ch1 babble_noise.ch1 babble_noise.ch1 babble_noise.ch1];
babble_noise.ch2 = [babble_noise.ch2 babble_noise.ch2 babble_noise.ch2 babble_noise.ch2 babble_noise.ch2];
babble_noise.ch3 = [babble_noise.ch3 babble_noise.ch3 babble_noise.ch3 babble_noise.ch3 babble_noise.ch3];
babble_noise.ch4 = [babble_noise.ch4 babble_noise.ch4 babble_noise.ch4 babble_noise.ch4 babble_noise.ch4];

%increase the speech recordings to 5 seconds by zeropadding

rec1v_orig = rec1v;
rec1h_orig = rec1h;
for i = 1:length(rec1v)
    rec1v(i).ch1 = [zeros((40000/2), 1); rec1v(i).ch1; zeros(((40000/2) - length(rec1v(i).ch1)),1)];
    rec1v(i).ch2 = [zeros((40000/2), 1); rec1v(i).ch2; zeros(((40000/2) - length(rec1v(i).ch2)),1)];
    rec1v(i).ch3 = [zeros((40000/2), 1); rec1v(i).ch3; zeros(((40000/2) - length(rec1v(i).ch3)),1)];
    rec1v(i).ch4 = [zeros((40000/2), 1); rec1v(i).ch4; zeros(((40000/2) - length(rec1v(i).ch4)),1)];
end

for i = 1:length(rec1h)
    rec1h(i).ch1 = [zeros((40000/2), 1); rec1h(i).ch1; zeros(((40000/2) - length(rec1h(i).ch1)),1)];
    rec1h(i).ch2 = [zeros((40000/2), 1); rec1h(i).ch2; zeros(((40000/2) - length(rec1h(i).ch2)),1)];
    rec1h(i).ch3 = [zeros((40000/2), 1); rec1h(i).ch3; zeros(((40000/2) - length(rec1h(i).ch3)),1)];
    rec1h(i).ch4 = [zeros((40000/2), 1); rec1h(i).ch4; zeros(((40000/2) - length(rec1h(i).ch4)),1)];    
end


%BALANSERA NOISE mot SNR = START_SNR
decibel_diff = decibel_1 - engine_noise.decibel - START_SNR;
engine_noise = set_decibel(engine_noise, decibel_diff);
decibel_diff = decibel_1 - factory_noise.decibel - START_SNR;
factory_noise = set_decibel(factory_noise, decibel_diff);
decibel_diff = decibel_1 - white_noise.decibel - START_SNR;
white_noise = set_decibel(white_noise, decibel_diff);
decibel_diff = decibel_1 - babble_noise.decibel - START_SNR;
babble_noise = set_decibel(babble_noise, decibel_diff);

%DELA UPP NOISE OM 40000 SAMPLES
factory_noise = divide_into_segments(factory_noise, 40000);
engine_noise = divide_into_segments(engine_noise, 40000);
white_noise = divide_into_segments(white_noise, 40000);
babble_noise = divide_into_segments(babble_noise, 40000);


%BALANSERA NOISE mot SNR = START_SNR
decibel_diff = decibel_1 - engine_orig.decibel - START_SNR;
engine_orig = set_decibel(engine_orig, decibel_diff);
decibel_diff = decibel_1 - factory_orig.decibel - START_SNR;
factory_orig = set_decibel(factory_orig, decibel_diff);
decibel_diff = decibel_1 - white_orig.decibel - START_SNR;
white_orig = set_decibel(white_orig, decibel_diff);
decibel_diff = decibel_1 - babble_orig.decibel - START_SNR;
babble_orig = set_decibel(babble_orig, decibel_diff);

%DELA UPP NOISE OM 5000 SAMPLES
factory_orig = divide_into_segments(factory_orig, 5000);
engine_orig = divide_into_segments(engine_orig, 5000);
white_orig = divide_into_segments(white_orig, 5000);
babble_orig = divide_into_segments(babble_orig, 5000);

%SKAPA SNR VEKTORN SOM �R X-AXELN
for i = 1:M
    snr1 = [snr1 (START_SNR + (i-1)*DECIBEL_STEP)]; % calc. the snr vector
end

%SKAPA VEKTORERNA MED INDEXEN SOM SKALL ANV�NDAS
exceptions = [];
exceptions2 = [];
temp = [];
for i = 1:100
    if i <= 100/2
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
index = exceptions(1);
ch1=rec1v_orig(1,index).ch1;
ch2=rec1v_orig(1,index).ch2;
ch3=rec1v_orig(1,index).ch3;
ch4=rec1v_orig(1,index).ch4;
index = exceptions(2);
ch1= ch1 + rec1h_orig(1,index).ch1;
ch2= ch2 + rec1h_orig(1,index).ch2;
ch3= ch3 + rec1h_orig(1,index).ch3;
ch4= ch4 + rec1h_orig(1,index).ch4;
word_4_wiener = [ch1';ch2';ch3';ch4'];

noise_orig =  factory_orig;% white_orig;  %  babble_orig;  % engine_orig;%        
index = exceptions2(1);
ch1 = noise_orig.segments(1,index).ch1 + noise_orig.segments(1,index + 1).ch1;
ch2 = noise_orig.segments(1,index).ch2 + noise_orig.segments(1,index + 1).ch2;
ch3 = noise_orig.segments(1,index).ch3 + noise_orig.segments(1,index + 1).ch3;
ch4 = noise_orig.segments(1,index).ch4 + noise_orig.segments(1,index + 1).ch4;
noise_4_wiener = [ch1;ch2;ch3;ch4];

noise = factory_noise;% white_noise;  %babble_noise;  % engine_noise;%       
noise = set_decibel(noise, DECIBEL_STEP);
noise_orig = set_decibel(noise_orig, DECIBEL_STEP);
current_word_name = '';
noise_original = noise;
noise_orig_original = noise_orig;

for h = 1:L % L = antal micar
    % r�kna ut filter
    display(strcat(num2str(h), ' mic(s)'));
    noise = noise_original;
    noise_orig = noise_orig_original;
    for i = 1:M % M = antal brusniv�er
        wer_curr = 0;
        deletion = 0;
        substitution = 0;
        right = 0;
        left = 0;
        no_match = 0;
        %set noise decibel level, update segments,
        noise = set_decibel(noise, -DECIBEL_STEP);
        noise = divide_into_segments(noise, 40000);
        current_snr = decibel_1 - noise.decibel;
        noise_orig = set_decibel(noise_orig, -DECIBEL_STEP);
        noise_orig = divide_into_segments(noise_orig, 5000);
        index = exceptions2(1);
        %display('testtest')
        ch1 = noise_orig.segments(1,index).ch1 + noise_orig.segments(1,index + 1).ch1;
        ch2 = noise_orig.segments(1,index).ch2 + noise_orig.segments(1,index + 1).ch2;
        ch3 = noise_orig.segments(1,index).ch3 + noise_orig.segments(1,index + 1).ch3;
        ch4 = noise_orig.segments(1,index).ch4 + noise_orig.segments(1,index + 1).ch4;
        noise_4_wiener = [ch1;ch2;ch3;ch4];
        W1 = LS_optimal(word_4_wiener(1:h,:) + noise_4_wiener(1:h,:),[zeros(1,K/2) word_4_wiener(2,1:end-K/2)],K);
        for j = 1:N  % N = antal ord
            % randomly pick a word which have not been used yet
            index = exceptions(j);
            if j <= N/2 % take 'v�nster'
                ch1 = rec1v(1,index).ch1;
                ch2 = rec1v(1,index).ch2;
                ch3 = rec1v(1,index).ch3;
                ch4 = rec1v(1,index).ch4;
                current_word_name = rec1v(1).name;
            else % take 'h�ger'
                ch1 = rec1h(1,index).ch1;
                ch2 = rec1h(1,index).ch2;
                ch3 = rec1h(1,index).ch3;
                ch4 = rec1h(1,index).ch4;
                current_word_name = rec1h(1).name;
            end
            w.ch1 = ch1;
            w.ch2 = ch2;
            w.ch3 = ch3;
            w.ch4 = ch4;
            current_word = [ch1';ch2';ch3';ch4'];
            current_word = current_word(1:h,:); % pick out the # of channel = # mics
            % pick the next noise segment, pick out # of mics to be used
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
            if vad_index > (length(y_1)*3)/2 % !detection
                deletion = deletion + 1;
            else                         % detection
                % rm_noise
                y_2 = rm_noise(y_1);
                % pre_emph
                y_3 = pre_emph(y_2, GAMMA);
                % cut the signal forwards and backwards
                y_4 = cut_forwards(y_3, BLOCK_LENGTH, OVERLAP, THRESHOLD);
                y_4 = cut_backwards(y_4, BLOCK_LENGTH, OVERLAP, THRESHOLD);
                %put the signal in blocks
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
                    if strcmp(reason, 'h�ger') == 1
                        right = right + 1;
                    elseif strcmp(reason, 'v�nster') == 1
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
        eval(['result1.result1' num2str(h) ' = [ result1.result1' num2str(h)  ' s];']);
    end
end




for h = 1:1 % L = antal micar
    % r�kna ut filter
    display('1 mic - bf');
    noise = noise_original;
    noise_orig = noise_orig_original;
    for i = 1:M % M = antal brusniv�er
        wer_curr = 0;
        deletion = 0;
        substitution = 0;
        right = 0;
        left = 0;
        no_match = 0;
        %set noise decibel level, update segments,
        noise = set_decibel(noise, -DECIBEL_STEP);
        noise = divide_into_segments(noise, 40000);
        current_snr = decibel_1 - noise.decibel;
        for j = 1:N  % N = antal ord
            % randomly pick a word which have not been used yet
            index = exceptions(j);
            if j <= N/2 % take 'v�nster'
                ch1 = rec1v(1,index).ch1;
                ch2 = rec1v(1,index).ch2;
                ch3 = rec1v(1,index).ch3;
                ch4 = rec1v(1,index).ch4;
                current_word_name = rec1v(1).name;
            else % take 'h�ger'
                ch1 = rec1h(1,index).ch1;
                ch2 = rec1h(1,index).ch2;
                ch3 = rec1h(1,index).ch3;
                ch4 = rec1h(1,index).ch4;
                current_word_name = rec1h(1).name;
            end
            w.ch1 = ch1;
            w.ch2 = ch2;
            w.ch3 = ch3;
            w.ch4 = ch4;
            current_word = [ch1';ch2';ch3';ch4'];
            current_word = current_word(1:h,:); % pick out the # of channel = # mics
            % pick the next noise segment, pick out # of mics to be used
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
                % cut the signal 
                y_4 = cut_forwards(y_3, BLOCK_LENGTH, OVERLAP, THRESHOLD);
                y_4 = cut_backwards(y_4, BLOCK_LENGTH, OVERLAP, THRESHOLD);  
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
                    if strcmp(reason, 'h�ger') == 1
                        right = right + 1;
                    elseif strcmp(reason, 'v�nster') == 1
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
        eval(['result1.result11mbf = [result1.result11mbf s];']);
    end
end


display('finished test');
display('saving results');
save('TEST\REALTIME SIMULATION\result1.mat', 'result1','-v7.3');
display('plotting');



temp = (START_SNR + M*DECIBEL_STEP + 10);
%PLOTTA
figure (1)
subplot(2,2,1)
y = extractfield(result1.result11, 'wer');
plot(snr1,y);
title('One mic  + noise - bf');
xlabel('SNR [dB]');
ylabel('Recognition rate [%]');

subplot(2,2,2)
y = extractfield(result1.result12, 'wer');
plot(snr1,y, 'r');
title('Two mics + noise + bf');
xlabel('SNR [dB]');
ylabel('Recognition rate [%]');

subplot(2,2,3)
y = extractfield(result1.result13, 'wer');
plot(snr1, y, 'g');
title('Three mics + noise + bf');
xlabel('SNR [dB]');
ylabel('Recognition rate [%]');

subplot(2,2,4)
y = extractfield(result1.result14, 'wer');
plot(snr1, y, 'm');
title('Four mics + noise + bf');
xlabel('SNR [dB]');
ylabel('Recognition rate [%]');


figure (2)
y = extractfield(result1.result11mbf, 'wer');
plot(snr1, y, 'k-o', 'LineWidth', 1.5);
hold on;
y = extractfield(result1.result11, 'wer');
plot(snr1,y, 'k-x', 'LineWidth', 1.5);
y = extractfield(result1.result12, 'wer');
plot(snr1,y, 'k-s', 'LineWidth', 1.5);
y = extractfield(result1.result13, 'wer');
plot(snr1, y, 'k-d', 'LineWidth', 1.5);
y = extractfield(result1.result14, 'wer');
plot(snr1, y, 'k-p', 'LineWidth', 1.5);

title('1 meter', 'FontSize', 16);
legend( '1 mic  + noise - bf', '1 mic  + noise + bf','2 mics + noise + bf','3 mics + noise + bf','4 mics + noise + bf', 'Location', 'SouthEast');
xlabel('SNR [dB]', 'FontSize', 16);
ylabel('Recognition Rate [%]', 'FontSize', 16);
set(gca, 'fontsize', 12);
axis([START_SNR (START_SNR + (M-1)*DECIBEL_STEP) 0 100]);

figure (3)
y = extractfield(result1.result11mbf, 'deletion');
plot(snr1, y, 'k-o', 'LineWidth', 1.5);
hold on;
y = extractfield(result1.result11, 'deletion');
plot(snr1,y, 'k-x', 'LineWidth', 1.5);
y = extractfield(result1.result12, 'deletion');
plot(snr1,y, 'k-s', 'LineWidth', 1.5);
y = extractfield(result1.result13, 'deletion');
plot(snr1, y, 'k-d', 'LineWidth', 1.5);
y = extractfield(result1.result14, 'deletion');
plot(snr1, y, 'k-p', 'LineWidth', 1.5);

title('1 meter: Errors: Deletions ', 'FontSize', 16);
legend( '1 mic  + noise - bf', '1 mic  + noise + bf','2 mics + noise + bf','3 mics + noise + bf','4 mics + noise + bf', 'Location', 'SouthEast');
xlabel('SNR [dB]', 'FontSize', 16);
ylabel('Deletions [%]', 'FontSize', 16);
set(gca, 'fontsize', 12);
axis([START_SNR (START_SNR + (M-1)*DECIBEL_STEP) 0 100]);