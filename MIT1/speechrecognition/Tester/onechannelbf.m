

clc;
close all;


Fs = 8000;
K = 32; % filter length
L = 4; % antal micar som amn ska testa för, dvs. antalet kurvor i grafen
M = 15;%20; % antal brusnivåer, mätpunkter/kurva
N = 100;%100; % 100 ord ska testas, 50/50 höger/vänster. Måste vara ett jämnt tal
P = 200; % antal ord(vänster/höger)/avstånd som finns att utnyttja till tester


N_REFLEC = 9; %N_REFLEC
BLOCK_LENGTH = 160; %BLOCK_LENGTH
OVERLAP = BLOCK_LENGTH/2; %OVERLAP
SUBSET_LENGTH = 12; %SUBSET_LENGTH
GAMMA = 0.5; % coefficient for pre_emhp
THRESHOLD = 4;
START_SNR = -10;
DECIBEL_STEP = 2;


load 'wordstest.mat'
words = t1;

load 'noisestest.mat'
noise = t2;


load 'test.mat'

s = result1.result11(1,3).words.ch1;
n = result1.result11(1,3).noise.ch1;
x = s + n';
current_word_name = 'vänster';
wer = 0;
plot(s);
hold on;
plot(n, 'r');
y_1 = filter_beam(x',W1);
% y_1 = x;
figure(2)
plot(y_1);
figure(1)
pwelch(s)
figure(2)
pwelch(x)
figure(3)
pwelch(y_1)
figure(4)
pwelch(n)

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
    y_4 = cut_backwards(y_3,BLOCK_LENGTH, OVERLAP, THRESHOLD);
    % block_frame
    y_5 = block_frame(y_4, BLOCK_LENGTH, OVERLAP);
    % schur_algo
    y_6 = schur_algo(y_5, N_REFLEC);
    % create_subsets
    y_7 = create_subsets(y_6, SUBSET_LENGTH);
    
    match = matching(y_7, 'DB\db.mat', current_word_name, SUBSET_LENGTH, N_REFLEC)
    if strcmp(match, 'yes') == 1
        wer = wer + 1;
        
    end
    
end






% i = 1;
% h = 1;
% noise_i = noise(1,i);
% noise_i.ch1 = noise_i.ch1./1000;
% noise_i.ch2 = noise_i.ch2./1000;
% noise_i.ch3 = noise_i.ch3./1000;
% noise_i.ch4 = noise_i.ch4./1000;
% 
% ch1 = words(1,i).ch1;
% ch2 = words(1,i).ch2;
% ch3 = words(1,i).ch3;
% ch4 = words(1,i).ch4;
% 
% wer = 0;
% current_word = [ch1';ch2';ch3';ch4'];
% 
% ch1 = noise_i.ch1;
% ch2 = noise_i.ch2;
% ch3 = noise_i.ch3;
% ch4 = noise_i.ch4;
% 
% wer = 0;
% current_noise = [ch1;ch2;ch3;ch4];
% current_word_name = 'vänster';
% word_4_wiener = current_word;
% noise_4_wiener = current_noise;
% % beamforming
% W1 = LS_optimal(word_4_wiener(1:h,:) + noise_4_wiener(1:h,:),[zeros(1,K/2) word_4_wiener(2,1:end-K/2)],K);
% 
% y_1 = filter_beam((current_word+current_noise),W1);
%y_1 = current_word(1,:) + current_noise(1,:);
% soundsc(current_word(1,:));
% pause(1);
% soundsc(current_noise(1,:));
% pause(1);
% soundsc(y_1)
% 
% plot(current_word(1,:));
% hold on;
% plot(current_noise(1,:), 'r')
% 
% % VAD --> y/n?
% index = vad(y_1, BLOCK_LENGTH, 6);
% if index > length(y_1)/2 % !detection
%     deletion = deletion + 1;
% else                     % detection
%     % rm_noise
%     y_2 = rm_noise(y_1);
%     % pre_emph
%     y_3 = pre_emph(y_2, GAMMA);
%     % maybe cut the signal backwards
%     y_4 = cut_backwards(y_3,BLOCK_LENGTH, OVERLAP, THRESHOLD);
%     % block_frame
%     y_5 = block_frame(y_4, BLOCK_LENGTH, OVERLAP);
%     % schur_algo
%     y_6 = schur_algo(y_5, N_REFLEC);
%     % create_subsets
%     y_7 = create_subsets(y_6, SUBSET_LENGTH);
%     
%     match = matching(y_7, 'DB\db.mat', current_word_name, SUBSET_LENGTH, N_REFLEC)
%     if strcmp(match, 'yes') == 1
%         wer = wer + 1;
%         
%     end
%     
% end
% 
