function output = pre_emph(input, GAMMA)
% pre-emphasis of input signal
output = filter([1 -GAMMA], 1, input); %filter(b, a, x)

end