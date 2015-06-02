function output = divide_into_segments(input, length)
% input is a 4 channel recording'
% length is the number of samples in each segment
startindex = 1;
for i = 1:size(input.ch1,2)/length
    input.segments(1,i).ch1 = input.ch1(startindex:startindex + length - 1);
    input.segments(1,i).ch2 = input.ch2(startindex:startindex + length - 1);
    input.segments(1,i).ch3 = input.ch3(startindex:startindex + length - 1);
    input.segments(1,i).ch4 = input.ch4(startindex:startindex + length - 1);
    startindex = startindex  + length - 1;
end
output = input
end