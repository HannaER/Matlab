
% load 'Hanna_db\database\r15.mat'
% current_word_name = 'höger';
% SUBSET_LENGTH = 12;
% N_REFLEC = 9;
% input = db;
% load 'DB\db.mat'


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
THRESHOLD = 4;
load TEST_REC/1/v.mat
load TEST_REC/1/h.mat
load TEST_REC/2/v.mat
load TEST_REC/2/h.mat
load TEST_REC/4/v.mat
load TEST_REC/4/h.mat

exceptions =[];
current_word_name = '';

wer = 0;
for i = 1:N
    
    %%% 1 meter %%%
    % index = get_random_word_index(1:1:P, exceptions);
    % exceptions = [exceptions index];
    % ch1 = rec1v(1,index).ch1;
    % ch2 = rec1v(1,index).ch2;
    % ch3 = rec1v(1,index).ch3;
    % ch4 = rec1v(1,index).ch4;
    % current_word_name = rec1v(1).name;
    %
%     index = get_random_word_index(1:1:P, exceptions);
%     exceptions = [exceptions index];
%     ch1 = rec1h(1,index).ch1;
%     ch2 = rec1h(1,index).ch2;
%     ch3 = rec1h(1,index).ch3;
%     ch4 = rec1h(1,index).ch4;
%     current_word_name = rec1h(1).name;
    
    
    %%% 2 meter %%%
%     index = get_random_word_index(1:1:P, exceptions);
%     exceptions = [exceptions index];
%     ch1 = rec2v(1,index).ch1;
%     ch2 = rec2v(1,index).ch2;
%     ch3 = rec2v(1,index).ch3;
%     ch4 = rec2v(1,index).ch4;
%     current_word_name = rec2v(1).name;
    
%     index = get_random_word_index(1:1:P, exceptions);
%     exceptions = [exceptions index];
%     ch1 = rec2h(1,index).ch1;
%     ch2 = rec2h(1,index).ch2;
%     ch3 = rec2h(1,index).ch3;
%     ch4 = rec2h(1,index).ch4;
%     current_word_name = rec2h(1).name;
%     
    
    %%% 4 meter %%%
%     index = get_random_word_index(1:1:P, exceptions);
%     exceptions = [exceptions index];
%     ch1 = rec4v(1,index).ch1;
%     ch2 = rec4v(1,index).ch2;
%     ch3 = rec4v(1,index).ch3;
%     ch4 = rec4v(1,index).ch4;
%     current_word_name = rec4v(1).name;
%     
%     index = get_random_word_index(1:1:P, exceptions);
%     exceptions = [exceptions index];
%     ch1 = rec4h(1,index).ch1;
%     ch2 = rec4h(1,index).ch2;
%     ch3 = rec4h(1,index).ch3; 
%     ch4 = rec4h(1,index).ch4;
%     current_word_name = rec4h(1).name;
%     
    current_word = [ch1';ch2';ch3';ch4'];
    % beamforming
    % y_1 = filter_beam((current_word+noise),W1)
    y_1 = current_word(3,:);
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
        
        match = matching(y_7, 'DB\db.mat', current_word_name, SUBSET_LENGTH, N_REFLEC);
        if strcmp(match, 'yes') == 1
           wer = wer + 1; 
            
        end
        
    end
end
wer