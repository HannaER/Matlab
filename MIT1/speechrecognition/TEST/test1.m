%%%%% Testa 1, 2 och 4 meter mot databasen %%%%

L = 4; % antal micar som amn ska testa för, dvs. anatlet kurvor i grafen
M = 50; % antal brusnivåer, mätpunkter/kurva
N = 100; % 100 ord ska testas, 50/50 höger/vänster

%%%%%%%%%%%%% 1 meter %%%%%%%%%%%%%%%%%%%%%%%%%

result11 = [];
result12 = [];
result13 = [];
result14 = [];

for h = 1:L
    for i = 1:M
        wer_curr = 0;
        snr_curr = 0;
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
        s.snr = snr_curr*(1/N); % dela med antal ord 
    end
end


%%%%% PLOTTA 1 meter %%%%%





%%%%%%%%%%%%% 2 meter %%%%%%%%%%%%%%%%%%%%%%%%%



%%%%% PLOTTA 2 meter %%%%%



%%%%%%%%%%%%% 4 meter %%%%%%%%%%%%%%%%%%%%%%%%%



%%%%% PLOTTA 4 meter %%%%%





