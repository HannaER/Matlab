%%%%% Testa 1, 2 och 4 meter mot databasen %%%%

L = 4; % antal micar som amn ska testa f�r, dvs. anatlet kurvor i grafen
M = 50; % antal brusniv�er, m�tpunkter/kurva
N = 100; % 100 ord ska testas, 50/50 h�ger/v�nster

%%%%%%%%%%%%% 1 meter %%%%%%%%%%%%%%%%%%%%%%%%%

result11 = [];
result12 = [];
result13 = [];
result14 = [];
snr1 = []; % x-vector - the same for all 4
%calc the mean energy of the signal and calc the snr vector
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





