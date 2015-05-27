%%%%% Testa 1, 2 och 4 meter mot databasen %%%%
clear all;
close all;
clc;

L = 4; % antal micar som amn ska testa för, dvs. anatlet kurvor i grafen
M = 50; % antal brusnivåer, mätpunkter/kurva
N = 100; % 100 ord ska testas, 50/50 höger/vänster
P = 200; % antal ord(vänster/höger)/avstånd


%% %%%%%%%%%%% 1 meter %%%%%%%%%%%%%%%%%%%%%%%%%

result11 = [];
result12 = [];
result13 = [];
result14 = [];
snr1 = []; % x-vector - the same for all 4

%calc the db of the signals as a mean. Use thresholding to only look at the
%speech(the top peaks). Use var() of the cut signal. Then use pow2db() of
%the var()-output

decibel_ = 0;
for i = 1:P % all words to iterate through
    % thresholding and cut signal
    temp = [];
%     for j = 1:Length of signal
%        if  i > threshold
%             temp = [temp signal(i)]
%         end
%     end
    variance_ = var(temp);
    decibel_ = decibel_ + pow2db(variance_)*(1/P);
    
end

% anpassa noise till decibel_ så att start värdet på SNR är 0. SNR =
% decibel_speech - decibel_noise = 0.

% Skapa snr vektorn som är x-axeln
for i = 1:M
    temp = 0; % snr = energy(signal)/energy(noise)
    snr1 = [snr1 temp]; % calc. the snr vector
end

for h = 1:L
    for i = 1:M
        wer_curr = 0;
        for j = 1:N
            snr_temp = 0;
            % beamforming
            
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
            end
        end
        s.wer = wer_curr;
        s.snr = snr1(i); % calc. the snr for this noise level
        result11 = [result11 s];
    end
end


%%%%% PLOTTA 1 meter %%%%%





%% %%%%%%%%%%% 2 meter %%%%%%%%%%%%%%%%%%%%%%%%%

result21 = [];
result22 = [];
result23 = [];
result24 = [];
snr2 = []; % x-vector - the same for all 4


%%%%% PLOTTA 2 meter %%%%%



%% %%%%%%%%%%% 4 meter %%%%%%%%%%%%%%%%%%%%%%%%%

result41 = [];
result42 = [];
result43 = [];
result44 = [];
snr4 = []; % x-vector - the same for all 4

%%%%% PLOTTA 4 meter %%%%%





