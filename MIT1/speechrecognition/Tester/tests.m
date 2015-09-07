%% plot till rapporten%

load Hanna_db/original/h6.mat
input = rec;
gamma = 0.5;
L = 160;
D = 80;


input = input.*10;
input_0 = rm_noise(input);
input_1 = pre_emph(input_0, gamma);
b_length = L;
    alfa = 0.99; % långsamt integrerande för bakgrundsbrus
    beta = 0.8; % snabbare integrering för tal(korttidsenergi)
    threshold = 5;

    first = 1;
    last = length(input_1);
    y = buffer(input_1, b_length, 0); % delar upp i block med overlap
    n_cols = length(y(1,:));
    h = hamming(length(y(:,1))); % kör blocken genom ett hamming fönster

    energy = [];
    for i = 1:n_cols % calc. the energy of each block by sum([a^2  b^2 c^2])
        y(:,i) = y(:,i).*h;
        energy = [energy, sum(abs(y(:,i)).^2)]; 
    end
    P_L = energy(1); 
    P_S = energy(1);
    %FORWARD
    for i = 1:n_cols
        P_L = alfa*P_L + (1 - alfa)*energy(i);
        P_S = beta*P_S + (1 - beta)*energy(i);
        R = P_S/P_L;
        if R > threshold              
            first = i*b_length;%((i-4)*b_length);
            break;
        end
    end    
    if first < 1
        first = 1;
    end

figure (1)
subplot(211);
plot(input_1(first:last), 'k','LineWidth', 1.5);
title('The recordning before cutting');
set(gca, 'fontsize', 12);

    P_L = energy(n_cols); 
    P_S = energy(n_cols); 
    %BACKWARD
    for i = fliplr(1:n_cols)
        P_L = alfa*P_L + (1 - alfa)*energy(i);
        P_S = beta*P_S + (1 - beta)*energy(i);
        R = P_S/P_L;
        if R > threshold
            last = i*b_length;  %(i + 2) * b_length;
            break;
        end       
    end
    
    if last > length(input)
        last = length(input);
    end
    if first > last
        fprintf('\nERROR!!\nfirst > last, first = %d, last = %d\n\n', first , last);
        first = 1;
        last = length(input);
        output = input(first:last);
        return;
    end
    fprintf('\nfirst < last, first = %d, last = %d\n\n', first , last);
    output = input_1(first:last);
  

subplot(212);
plot(output, 'k','LineWidth', 1.5);
title('The recording after cutting');
xlabel('Samples','FontSize', 16);
ylabel('Amplitude','FontSize', 16);
set(gca, 'fontsize', 12);


%%
% testing create_subset
clc;
clear all;
close all;
%input = [11 21 31 41 51 61 71 81 91 101 111 121 131 141 151; 12 22 32 42 52 62 72 82 92 102 112 122 132 142 152; 13 23 33 43 53 63 73 83 93 103 113 123 133 143 153];
%input = [11 21 31 41 51 61 71 81 91 101 111 121 131 141 151 161; 12 22 32 42 52 62 72 82 92 102 112 122 132 142 152 162; 13 23 33 43 53 63 73 83 93 103 113 123 133 143 153 163];
%input = [1 2 3 4 5; 1 2 3 4 5; 1 2 3 4 5]; % test N_FEATURE_VECTORS < N_SUBSETS
input = [1 2 3 4 5 6; 1 2 3 4 5 6; 1 2 3 4 5 6]; % test N_FEATURE_VECTORS <= N_SUBSETS
M  = 6;
s = size(input)
N_REFLEC = s(1);
N_FEATURE_VECTORS = s(2);
N_SUBSETS = M
output = zeros(N_REFLEC, N_SUBSETS); % output(rad, kolumn)
integer = fix(N_FEATURE_VECTORS/N_SUBSETS)
remainder = mod(N_FEATURE_VECTORS, N_SUBSETS)

start = 1;
stop = 0;
if integer  > 1
    for i = 1:N_SUBSETS
        if i <= remainder % remainder
            stop = stop + integer + 1;
            for j = 1:N_REFLEC
                for k = start:stop
                    output(j, i) = output(j, i) + input(j, k);
                end
                output(j, i) = output(j, i)/(integer + 1);
            end
            start = start + integer + 1;
        end
        if i > remainder % no remainder
            stop = stop + integer;
            for j = 1:N_REFLEC
                for k = start:stop
                    output(j, i) = output(j, i) + input(j, k);
                end
                output(j, i) = output(j, i)/(integer);
            end
            start = start + integer;
        end
    end
    
    
end

if integer <= 1
    for i = 1: N_FEATURE_VECTORS
        for j = 1: N_REFLEC
            output(j, i) = input(j, i);
        end
    end
    
end




%%
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


plot(ham, 'k', 'LineWidth', 2)
set(gca, 'fontsize', 12);
ylabel('Amplitude', 'FontSize', 16);
xlabel('Samples', 'FontSize', 16);
title('Hamming window', 'FontSize', 16);

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



