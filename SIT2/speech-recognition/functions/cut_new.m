function [ output, energy ] = cut_new( input, b_length)
% Cut out the important values of a speech signal.
    % cut(signal, b_length, overlap, threshold)
    % b_length = block length
    % overlap = amount of overlap in samples
    
    alfa = 1;
    beta = 1;
    E = 1;
    
    y = buffer(input, b_length, 0); % delar upp i block med overlap
    n_cols = length(y(1,:));
    h = hamming(length(y(:,1))); % k�r blocken genom ett hamming f�nster

    energy = [];
    for i = 1:n_cols % calc. the energy of each block by sum([a^2  b^2 c^2])
        y(:,i) = y(:,i).*h;
        energy = [energy, sum(abs(y(:,i)).^2)]; 
    end
    
    first = 0;
    E_old = sum(abs(y(:,1)).^2); % set the starting energy
    E_noise = E_old;
    k = 1; % scaling factor, should be adaptive in soem sence
    
    %FORWARD
    for i = 1:n_cols
        temp_energy = sum(abs(y(:,i)).^2);
        E = E_old*(1 - alfa) + E_noise*alfa;
        if temp_energy > E*k % Snabba �ndringar
            if E > 36 % L�ngsamma �ndringar
                first = i*b_length;%((i-4)*b_length);
                break;
            end
        else
        end
        E_noise = temp_energy; 
    end
    
    
    if first < 1
        first = 1;
    end
    last = n_cols * b_length;
    E_old = sum(abs(y(:,n_cols)).^2);
    E_noise = E_old;
    k = 1; %scaling factor
    
    %BACKWARD
    for i = fliplr(1:n_cols)
        temp_energy = sum(abs(y(:,i)).^2);
        E = E_old*(1 - alfa) + E_noise*alfa; % 
        if temp_energy > E*k % Snabba �ndringar
            if E > 36 % L�ngsamma �ndringar
            last = i*b_length;  %(i + 2) * b_length;
            break;
            end
        else
        end
        E_noise = temp_energy;
    end
    
    if last > length(input)
        last = length(input);
    end
    
     output = y(first:last);
    
end

