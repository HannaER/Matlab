function output = rm_noise(input)
% remove noise from speech signal
%lp = LowPassFilter;
output = filter([1, -1, 0], [1,-0.92,0], input); % filter(b, a, x) high pass (notch) filter
%output = filter(lp.Numerator,1, output);    % low pass filter

end