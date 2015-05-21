%%%%% Testa 1, 2 och 4 meter mot databasen %%%%
clear all;
close all;
clc;

L = 4; % antal micar som amn ska testa för, dvs. anatlet kurvor i grafen
M = 50; % antal brusnivåer, mätpunkter/kurva
N = 100; % 100 ord ska testas, 50/50 höger/vänster
P = 180; % antal ord(vänster/höger) / avstånd
%%%%%%%%%%%%% 1 meter %%%%%%%%%%%%%%%%%%%%%%%%%

result11 = [];
result12 = [];
result13 = [];
result14 = [];
snr1 = []; % x-vector - the same for all 4
%calc the mean energy of the signal
mean_energy_signal_1 = 0;
load TEST_REC\1\v.mat;
load TEST_REC\1\h.mat;
mean_h = 0;
mean_v = 0;
mean_1 = 0;
for i = 1:P
    mean_h = mean_h + rec1h(1,i).energy*(1/P);
    mean_v = mean_v + rec1v(1,i).energy*(1/P);
    mean_1 = (mean_h + mean_v)*(1/2);
end
%calc the snr vector
for i = 1:M
    temp = 0; % snr = energy(signal)/energy(noise)
    snr1 = [snr1 temp]; % calc. the snr vector
end
for h = 1:L
    for i = 1:M
        wer_curr = 0;
        snr_curr = 0; % noise energy
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
            snr_curr = snr_curr + snr_temp;
        end
        s.wer = wer_curr;
        s.snr = 0; % calc. the snr for this noise level
    end
end


%%%%% PLOTTA 1 meter %%%%%





%%%%%%%%%%%%% 2 meter %%%%%%%%%%%%%%%%%%%%%%%%%



%%%%% PLOTTA 2 meter %%%%%



%%%%%%%%%%%%% 4 meter %%%%%%%%%%%%%%%%%%%%%%%%%



%%%%% PLOTTA 4 meter %%%%%





