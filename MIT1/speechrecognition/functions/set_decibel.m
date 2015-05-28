function output = set_decibel(input, decibel_diff )
% input is balanced to the same decibel difference decibel_diff
% output is the balanced input
% input and output are for 4-channel signals as a struct

input.ch1 = decibel_inc_dec(input.ch1, decibel_diff);
input.ch2 = decibel_inc_dec(input.ch2, decibel_diff);
input.ch3 = decibel_inc_dec(input.ch3, decibel_diff);
input.ch4 = decibel_inc_dec(input.ch4, decibel_diff);
input.decibel = pow2db(mean([var(input.ch1) var(input.ch2) var(input.ch3) var(input.ch4)]));
output = input;

end