function output = get_random_word_index(range, exception)
% range is the range of indices which one random index should be
% retrieved from, i.e. range = [1 2 3 4]
% excpetion is a vector of indices which should be excluded when
% randomly picking an index, i.e. exception = [2 4]
% output is the randomly picked index, i.e. output is either 1 or 3 in
% this example.
output = randsample(setdiff(range, exception),1);
end