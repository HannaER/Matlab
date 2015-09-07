function output = cut_forwards(input, b_length, overlap, threshold)
% Cut out the important values of a speech signal.

    
    
    %a = 0.99, b = 0.6 t = 5
    alfa = 0.99; % l�ngsamt integrerande f�r bakgrundsbrus
    beta = 0.8; % snabbare integrering f�r tal(korttidsenergi)

    
    first = 1;
    last = length(input);
    y = buffer(input, b_length, 0); % delar upp i block med overlap
    n_cols = length(y(1,:));
    h = hamming(length(y(:,1))); % k�r blocken genom ett hamming f�nster

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

    if first > last
        %fprintf('\nERROR!!\nfirst > last, first = %d, last = %d\n\n', first , last);
        first = 1;
        last = length(input);
        output = input(first:last);
        return;
    end
    %fprintf('\nfirst < last, first = %d, last = %d\n\n', first , last);
    output = input(first:last);
    
end
