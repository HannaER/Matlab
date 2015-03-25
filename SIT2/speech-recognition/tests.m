close all;
clear all;
clc;

%hamming coefficients for DSP
N = 160;
ham = hamming(N);


temp = '';
for i = 1:length(ham) 
    %if i ~= length(x) 
    temp = strcat(temp, 'h[',num2str( i -1) , ']= ', num2str(ham(i)), '; \n' );
    %else
        %temp = strcat(temp, num2str(x(i)));        
    %end
end



%%
close all;
clear all;
clc;
sample = 160;
tot_sample = 7 * sample;
load newH4.mat;
x = rec;
%x = rec(5000:end);
x = x(8100:end);
% x = buffer(x, 160, 80);
% x = x(:,2:8);

figure (1)
subplot 221
plot(x)
title('original signal');

x1 = rm_noise(x);
subplot 222
plot(x1)
title('after rm noise');
x2 = pre_emph(x1);
subplot 223
plot(x2);
title('after pre emph');

[x3, norms] = cut_baby(x2, 160, 8);
subplot 224
plot(x3)
title('after cut');
soundsc(x3)







%%
close all;
clear all;
clc;

load task5.mat
x = t1;
x = x(1000:1900);
temp = '';
for i = 1:length(x) 
    %if i ~= length(x) 
    temp = strcat(temp, 'x[',num2str( i -1) , ']= ', num2str(x(i)), '; \n' );
    %else
        %temp = strcat(temp, num2str(x(i)));        
    %end
end

figure (1)
plot(x, 'g');
hold on;
temp1 = rm_noise(x);
%plot(temp1);
temp1 = pre_emph(temp1);
plot(temp1, 'm');
legend('original','after rm noise and pre emph');


%%
test = [1 2 3 4 4 5 6 7 8 9];


string = 'Viktor_db/database/testfile.mat';
save(string, 'test')





%%
clc;
close all;
clear all;

for i = 1:10
    i
    for k = 1: 5
        k
        if k == 3
            break;           
        end
        
    end
    
end






%%
close all;
clear all;
clc;
load task5.mat

add_to_db(t1, 'testfile', 160, 80, 10, 16000, 1)







%%
close all;
clear all;
clc;

% freqz(([1,-.9], 1); %pre
freqz([1, -1], [1,-0.93]);

load task5.mat;
figure
plot(t1)
y = filter([1, -1], [1,-0.92], t1);
hold on
plot(y, 'r');
legend('no filter','after high pass filter');




%%
clear all;
close all;
clc;

load testfile.mat
input = input_4;
M = 8; % number of subsections the featurevectors are split into
s = size(input);
t = zeros(s(1), M);

integer = fix(s(2)/M);
remainder = mod(s(2), M);

for i = 1:M
    if i <= remainder
        for k = i + (i-1)*integer : i*integer + i
            t(:, i) = t(:, i) + input(:, k);
        end
        t(:, i) = t(:, i)./(integer + 1);
    end
    if i > remainder
        for k = i + (i-1)*integer : i*integer  + remainder
            t(:, i) = t(:, i) + input(:, k);
        end
        t(:, i) = t(:, i)./(integer);
    end
    
end



