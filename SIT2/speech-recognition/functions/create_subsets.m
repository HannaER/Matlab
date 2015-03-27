function output = create_subsets(input, M)
s = size(input);
N_REFLEC = s(1);
N_FEATURE_VECTORS = s(2);
N_SUBSETS = M;
output = zeros(N_REFLEC, N_SUBSETS);
integer = fix(N_FEATURE_VECTORS/N_SUBSETS);
remainder = mod(N_FEATURE_VECTORS, N_SUBSETS);

start = 1;
stop = 0;
if integer  > 1
    for i = 1:N_SUBSETS
        if i <= remainder % remainder
            stop = stop + integer + 1;
            for j = 1:N_REFLEC
                for k = start:stop
                    output(j, i) = output(j, i) + input(j, k);
                end
                output(j, i) = output(j, i)/(integer + 1);
            end
            start = start + integer + 1;
        end
        if i > remainder % no remainder
            stop = stop + integer;
            for j = 1:N_REFLEC
                for k = start:stop
                    output(j, i) = output(j, i) + input(j, k);
                end
                output(j, i) = output(j, i)/(integer);
            end
            start = start + integer;
        end
    end
    
    
end

if integer <= 1
    for i = 1: N_FEATURE_VECTORS
        for j = 1: N_REFLEC
            output(j, i) = input(j, i);
        end
    end
    
end
end