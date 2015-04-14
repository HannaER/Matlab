close all;
clear all;
clc;

%hamming coefficients for DSP
N = 160;
ham = hamming(N);

%extern float const pm hamming
temp = 'extern float const pm hamming[BLOCK_LENGTH] = {';
for i = 1:length(ham)
    %if i ~= length(x)
    temp = strcat(temp,'\n\t\t', num2str(ham(i)), ', ' );
    %else
    %temp = strcat(temp, num2str(x(i)));
    %end
end
temp = strcat(temp, '\n}; \n\n', '');
file = fopen('hammingh.txt', 'w');
fprintf(file, temp);