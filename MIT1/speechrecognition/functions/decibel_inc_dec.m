function output = decibel_inc_dec(input, decibel_diff)
% output, input =  are vectors of the signal in magnitude
% decibel_diff =  is the difference in decibels which is to be applied to
% input

inc = 10^(decibel_diff*0.5/10);
output = input*inc;

end







