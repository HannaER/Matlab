function index = vad( input, b_length, threshold)
% Cut out the important values of a speech signal.
    % cut(signal, b_length, overlap, threshold)
    % b_length = block length
    % overlap = amount of overlap in samples
    
    
    %a = 0.99, b = 0.6 t = 5
    alfa = 0.99; % långsamt integrerande för bakgrundsbrus
    beta = 0.8; % snabbare integrering för tal(korttidsenergi)

    first = 1;
 %   last = length(input);
    y = buffer(input, b_length, 0); % delar upp i block med overlap
    n_cols = length(y(1,:));
    h = hamming(length(y(:,1))); % kör blocken genom ett hamming fönster

    energy = [];
    for i = 1:n_cols % calc. the energy of each block by sum([a^2  b^2 c^2])
        y(:,i) = y(:,i).*h;
        energy = [energy, sum(abs(y(:,i)).^2)]; 
    end
    P_L = energy(1); 
    P_S = energy(1);
    %FORWARD
    for i = 1:n_cols
        P_L = alfa*P_L + (1 - alfa)*energy(i);
        P_S = beta*P_S + (1 - beta)*energy(i);
        R = P_S/P_L;
        if R > threshold              
            first = (i - 4)*b_length;
            break;
        end
    end    
    if first < 1
        first = 1;
    end

    index = first;
    
end

