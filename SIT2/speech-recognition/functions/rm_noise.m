function output = rm_noise(input)
% remove noise from speech signal
%lp = LowPassFilter;
DELTA1 = 0.91;
DELTA2 = 0.5;
output = filter([1, -1, 0], [1,-DELTA1,0], input); % filter(b, a, x) high pass (notch) filter
output = filter([1, -1, 0], [1,-DELTA2,0], output);    % low pass filter

end