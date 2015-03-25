
function add_to_db(input, string, L, D, P, M, fs, gamma, sound)

% ADD_TO_DB  = (input, string, L, D, P, fs, sound)
%   Adds a sound signals features vectors in the library, saved as a .mat file.
%   *input* is the soundsignal as a columnvector
%   *string* is the name of the file,
%   *L* is the length of the blocks, *D* is the overlap,
%   *P* is the number of reflections coefficients,
%   *sound* set to 1 to listen to the signal along the steps
%   *fs* is the sample frequency the input signal was sampled with
%   *threshold* is the threshold the cut function uses



if sound == 1
    %soundsc(input, fs)
    figure (1)
    subplot(221)
    plot(input)
    title('Original recording')
    xlabel('Samples');
    ylabel('Amplitude');
    
    figure (2)
    fft_(input, length(input), fs, 221)
end



% removing low frequency noise with filter(-s)
input_0 = rm_noise(input);



if sound ==1
    %pause(3)
    %soundsc(input_0, fs);
    figure (1)
    subplot(222)
    plot(input_0)
    title('After high and low pass filtering')
    xlabel('Samples');
    ylabel('Amplitude');
    
    figure (2)
    fft_(input_0, length(input_0), fs, 222)
end

% pre-emhasis filter with a = 0.95-98, function
input_1 = pre_emph(input_0, gamma);


if sound ==1
    %pause(3)
    %soundsc(input_1, fs);
    figure (1)
    subplot(223)
    plot(input_1)
    title('After pre-emphasis')
    xlabel('Samples');
    ylabel('Amplitude');
    
    figure (2)
    fft_(input_1, length(input_1), fs, 223)
end

% Remove unecessary parts of signal at beginning and end
[input_2, norm] = cut_baby(input_1, L, D);

if sound == 1
    %pause(3)
    soundsc(input_2, fs);
    
    figure (1)
    subplot(224)
    plot(input_2)
    title('After cutting the signal')
    xlabel('Samples');
    ylabel('Amplitude');
    
    figure (2)
    
    fft_(input_2, length(input_2), fs, 224)
end

% Add zeros such that there will be a multiple of L samples
%input_3 = [input_2' zeros(1, L - mod(length(input_2), L))];


% Block framing the signal
input_4 = block_frame(input_2, L, D);


% Schur-algorithm -> create matrix form database
input_5 = schur_algo(input_4, P);


% Divide into subsets and calculate the mean of the coefficients

db = create_subsets(input_5, M);


string = strcat(string, '.mat');
%string = strcat('databases/', string);

save(string, 'db');
end