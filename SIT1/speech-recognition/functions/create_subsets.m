% function output = create_subsets(input, N)
% % N the is number of featurevectors the subsets are createt with
% s = size(input); % s(2) gives the number of featurevectors 
% integer = fix(s(2)/N); % integer is the number of subsets
% remainder = mod(s(2), integer); % remainder the number of excess vectors
% output = zeros(s(1), integer);
% for i = 1:integer
%     if i <= remainder
%         for k = i + (i-1)*N : i*N + i
%             output(:, i) = output(:, i) + input(:, k);
%         end
%         output(:, i) = output(:, i)./(N + 1); % calc. mean
%     end
%     if i > remainder
%         for k = 2 + (i-1)*N : i*N  + remainder
%             output(:, i) = output(:, i) + input(:, k);
%         end
%         output(:, i) = output(:, i)./(N); % calc. mean
%     end
% end
% end


function output = create_subsets(input, M)

%M is the number of subsets the featurevectors are split into
s = size(input);
output = zeros(s(1), M);

integer = fix(s(2)/M);
remainder = mod(s(2), M);

for i = 1:M
    if i <= remainder
        for k = i + (i-1)*integer : i*integer + i
            output(:, i) = output(:, i) + input(:, k);
        end
        output(:, i) = output(:, i)./(integer + 1); % calc. mean
    end
    if i > remainder
        for k = i + (i-1)*integer : i*integer  + remainder
            output(:, i) = output(:, i) + input(:, k);
        end
        output(:, i) = output(:, i)./(integer); % calc. mean
    end
end










