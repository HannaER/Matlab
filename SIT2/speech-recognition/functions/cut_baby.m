function [ output, norms ] = cut_baby( input, b_length, threshold )
% Cut out the important values of a speech signal.
    % cut(signal, b_length, overlap, threshold)
    % b_length = block length
    % overlap = amount of overlap in samples
    % threshold = when to start listening. Around 1.
    
    y = buffer(input, b_length, 0);
    
    n_cols = length(y(1,:));
    h = hamming(length(y(:,1)));

    norms = [];
    for i = 1:n_cols
        y(:,i) = y(:,i).*h;
        norms = [norms, sum(abs(y(:,i)))]; 
    end

    counter = 0;
    first = 0;
    threshold = sum(abs((y(:,1))));
    for i = 1:n_cols
        temp = y(:,i);
        new_threshold = sum(abs(temp))*0.05 + threshold*0.95;
        if new_threshold > 1.12*threshold % 1.09
            counter = counter+9;
            if counter > 45
                first = ((i-4)*b_length);
                break;
            end
        else 
            counter = counter-10;
            if counter<0
                counter=0;
            end
        end
        threshold = new_threshold;
    end
    
    
    if first < 1
        first = 1;
    end
    last = n_cols * b_length;
    threshold = sum(abs(y(:,n_cols)));
    counter = 0;
    for i = fliplr(1:n_cols)
        temp = y(:,i);
        new_threshold = sum(abs(temp))*0.05 + threshold*0.95;
        if new_threshold > 1.12 * threshold
            counter = counter+9;
            if counter > 45
            last = (i + 2) * b_length;
            break;
            end
        else
            counter = counter-10;
            if counter<0
                counter = 0;
            end
        end
        threshold = new_threshold;
    end
    
    if last > length(input)
        last = length(input);
    end
    
     output = y(first:last);
    
end

