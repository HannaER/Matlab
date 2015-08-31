
%% FIGURES
clear all;
close all;
clc;

Fs = 8000;
K = 32; % filter length
L = 4; % antal micar som amn ska testa för, dvs. antalet kurvor i grafen
M = 62;% antal brusnivåer, mätpunkter/kurva
N = 100;% 100 ord ska testas, 50/50 höger/vänster. Måste vara ett jämnt tal
P = 200; % antal ord(vänster/höger)/avstånd som finns att utnyttja till tester


N_REFLEC = 9; %N_REFLEC
BLOCK_LENGTH = 160; %BLOCK_LENGTH
OVERLAP = BLOCK_LENGTH/2; %OVERLAP
SUBSET_LENGTH = 12; %SUBSET_LENGTH
GAMMA = 0.5; % coefficient for pre_emhp
THRESHOLD = 4;
START_SNR = -10;
DECIBEL_STEP = 0.5;
snr1 = []; % x-vector - the same for all 4
%SKAPA SNR VEKTORN SOM ÄR X-AXELN
for i = 1:M
    snr1 = [snr1 (START_SNR + (i-1)*DECIBEL_STEP)]; % calc. the snr vector
end


cases.list = [];
%%%%%%%%%% NOISE %%%%%%%%%%

%%% WHITE, FACTORY, ENGINE AND BABBLE  %%%
load 'TEST\NOISE\white1.mat'
w1 = result1;
s.case = w1;
eval(['cases.list = [cases.list s];']);
load 'TEST\NOISE\white2.mat'
w2 = result2;
s.case = w2;
eval(['cases.list = [cases.list s];']);
load 'TEST\NOISE\white4.mat'
w4 = result4;
s.case = w4;
eval(['cases.list = [cases.list s];']);

load 'TEST\NOISE\factory1.mat'
f1 = result1;
s.case = f1;
eval(['cases.list = [cases.list s];']);
load 'TEST\NOISE\factory2.mat'
f2 = result2;
s.case = f2;
eval(['cases.list = [cases.list s];']);
load 'TEST\NOISE\factory4.mat'
f4 = result4;
s.case = f4;
eval(['cases.list = [cases.list s];']);


load 'TEST\NOISE\engine1.mat'
e1 = result1;
s.case = e1;
eval(['cases.list = [cases.list s];']);
load 'TEST\NOISE\engine2.mat'
e2 = result2;
s.case = e2;
eval(['cases.list = [cases.list s];']);
load 'TEST\NOISE\engine4.mat'
e4 = result4;
s.case = e4;
eval(['cases.list = [cases.list s];']);


load 'TEST\NOISE\babble1.mat'
b1 = result1;
s.case = b1;
eval(['cases.list = [cases.list s];']);
load 'TEST\NOISE\babble2.mat'
b2 = result2;
s.case = b2;
eval(['cases.list = [cases.list s];']);
load 'TEST\NOISE\babble4.mat'
b4 = result4;
s.case = b4;
eval(['cases.list = [cases.list s];']);

set(0,'DefaultFigureWindowStyle','docked')
names = {'w1', 'w2', 'w4', 'f1', 'f2', 'f4', 'e1', 'e2', 'e4', 'b1', 'b2', 'b4'};
j = 1;
for i = 1:length(cases.list)
    setup = cases.list(i).case;
    figure('Name', names{i});
    resultCase = strcat('result', num2str(j), '1mbf');
    y = extractfield(setup.(resultCase), 'wer');
    plot(snr1, y, 'k-o', 'LineWidth', 1.5);
    hold on;
    resultCase = strcat('result', num2str(j), '1');
    y = extractfield(setup.(resultCase), 'wer');
    plot(snr1,y, 'k-x', 'LineWidth', 1.5);
    resultCase = strcat('result', num2str(j), '2');
    y = extractfield(setup.(resultCase), 'wer');
    plot(snr1,y, 'k-s', 'LineWidth', 1.5);
    resultCase = strcat('result', num2str(j), '3');
    y = extractfield(setup.(resultCase), 'wer');
    plot(snr1, y, 'k-d', 'LineWidth', 1.5);
    resultCase = strcat('result', num2str(j), '4');
    y = extractfield(setup.(resultCase), 'wer');
    plot(snr1, y, 'k-p', 'LineWidth', 1.5);
    
    if(j == 1)
        title(strcat(num2str(j), ' meter'), 'FontSize', 16);
    else
        title(strcat(num2str(j), ' meters'), 'FontSize', 16);
    end
    l1 = legend( '1 mic   + noise - bf', '1 mic   + noise + bf','2 mics + noise + bf','3 mics + noise + bf','4 mics + noise + bf', 'Location', 'NorthWest');
    xlabel('SNR [dB]', 'FontSize', 16);
    ylabel('Recognition Rate [%]', 'FontSize', 16);
    set(gca, 'fontsize', 12);
    set(l1 , 'FontSize', 14);
    axis([START_SNR (START_SNR + (M-1)*DECIBEL_STEP) 0 100]);
    %saveas(gcf, ['Figures/RESULTS/', names{i},'.eps']);
   
    
    if(j == 1)
        j = 2;
    elseif(j == 2)
        j = 4;
    elseif(j == 4)
        j = 1;
    end
end

%%%%%%%%%% NOISE + REVERBERATION %%%%%%%%%%


casesr.list = [];


%%% WHITE, FACTORY, ENGINE AND BABBLE  %%%

load 'TEST\NOISE+REVERBERATION\white1.mat'
w1r = result1r;
s.case = w1r;
eval(['casesr.list = [casesr.list s];']);
load 'TEST\NOISE+REVERBERATION\white2.mat'
w2r = result2r;
s.case = w2r;
eval(['casesr.list = [casesr.list s];']);
load 'TEST\NOISE+REVERBERATION\white4.mat'
w4r = result4r;
s.case = w4r;
eval(['casesr.list = [casesr.list s];']);

load 'TEST\NOISE+REVERBERATION\factory1.mat'
f1r = result1r;
s.case = f1r;
eval(['casesr.list = [casesr.list s];']);
load 'TEST\NOISE+REVERBERATION\factory2.mat'
f2r = result2r;
s.case = f2r;
eval(['casesr.list = [casesr.list s];']);
load 'TEST\NOISE+REVERBERATION\factory4.mat'
f4r = result4r;
s.case = f4r;
eval(['casesr.list = [casesr.list s];']);


load 'TEST\NOISE+REVERBERATION\engine1.mat'
e1r = result1r;
s.case = e1r;
eval(['casesr.list = [casesr.list s];']);
load 'TEST\NOISE+REVERBERATION\engine2.mat'
e2r = result2r;
s.case = e2r;
eval(['casesr.list = [casesr.list s];']);
load 'TEST\NOISE+REVERBERATION\engine4.mat'
e4r = result4r;
s.case = e4r;
eval(['casesr.list = [casesr.list s];']);


load 'TEST\NOISE+REVERBERATION\babble1.mat'
b1r = result1r;
s.case = b1r;
eval(['casesr.list = [casesr.list s];']);
load 'TEST\NOISE+REVERBERATION\babble2.mat'
b2r = result2r;
s.case = b2r;
eval(['casesr.list = [casesr.list s];']);
load 'TEST\NOISE+REVERBERATION\babble4.mat'
b4r = result4r;
s.case = b4r;
eval(['casesr.list = [casesr.list s];']);





namesr = {'w1r', 'w2r', 'w4r', 'f1r', 'f2r', 'f4r', 'e1r', 'e2r', 'e4r', 'b1r', 'b2r', 'b4r'};
j = 1;
for i = 1:length(casesr.list)
    setup = casesr.list(i).case;
    figure('Name', namesr{i});
    resultCase = strcat('result', num2str(j), '1mbf');
    y = extractfield(setup.(resultCase), 'wer');
    plot(snr1, y, 'k-o', 'LineWidth', 1.5);
    hold on;
    resultCase = strcat('result', num2str(j), '1');
    y = extractfield(setup.(resultCase), 'wer');
    plot(snr1,y, 'k-x', 'LineWidth', 1.5);
    resultCase = strcat('result', num2str(j), '2');
    y = extractfield(setup.(resultCase), 'wer');
    plot(snr1,y, 'k-s', 'LineWidth', 1.5);
    resultCase = strcat('result', num2str(j), '3');
    y = extractfield(setup.(resultCase), 'wer');
    plot(snr1, y, 'k-d', 'LineWidth', 1.5);
    resultCase = strcat('result', num2str(j), '4');
    y = extractfield(setup.(resultCase), 'wer');
    plot(snr1, y, 'k-p', 'LineWidth', 1.5);
    
    if(j == 1)
        title(strcat(num2str(j), ' meter'), 'FontSize', 16);
    else
        title(strcat(num2str(j), ' meters'), 'FontSize', 16);
    end
    l2 = legend( '1 mic   + noise + reverberation -  bf', '1 mic   + noise + reverberation + bf','2 mics + noise + reverberation + bf','3 mics + noise + reverberation + bf','4 mics + noise + reverberation + bf', 'Location', 'NorthWest');
    xlabel('SNR [dB]', 'FontSize', 16);
    ylabel('Recognition Rate [%]', 'FontSize', 16);
    set(gca, 'fontsize', 12);
    set(l2 , 'FontSize', 14);
    axis([START_SNR (START_SNR + (M-1)*DECIBEL_STEP) 0 100]);
    %saveas(gcf, ['Figures/RESULTS/', namesr{i},'.eps']);
    
    if(j == 1)
        j = 2;
    elseif(j == 2)
        j = 4;
    elseif(j == 4)
        j = 1;
    end
end



%%% REALTIME SIMULATIONS %%%

Fs = 8000;
K = 32; % filter length
L = 4; % antal micar som amn ska testa för, dvs. antalet kurvor i grafen
M = 31;% antal brusnivåer, mätpunkter/kurva
N = 100;% 100 ord ska testas, 50/50 höger/vänster. Måste vara ett jämnt tal
P = 200; % antal ord(vänster/höger)/avstånd som finns att utnyttja till tester


N_REFLEC = 9; %N_REFLEC
BLOCK_LENGTH = 160; %BLOCK_LENGTH
OVERLAP = BLOCK_LENGTH/2; %OVERLAP
SUBSET_LENGTH = 12; %SUBSET_LENGTH
GAMMA = 0.5; % coefficient for pre_emhp
THRESHOLD = 4;
START_SNR = -10;
DECIBEL_STEP = 1;

snrvad = [];

for i = 1:M
    snrvad = [snrvad (START_SNR + (i-1)*DECIBEL_STEP)]; % calc. the snr vector
end


casesvad.list = [];


load 'TEST\REALTIME SIMULATION\w1.mat'
w1vad = result1;
s.case = w1vad;
eval(['casesvad.list = [casesvad.list s];']);
load 'TEST\REALTIME SIMULATION\w2.mat'
w2vad = result2;
s.case = w2vad;
eval(['casesvad.list = [casesvad.list s];']);
load 'TEST\REALTIME SIMULATION\w4.mat'
w4vad = result4;
s.case = w4vad;
eval(['casesvad.list = [casesvad.list s];']);


load 'TEST\REALTIME SIMULATION\f1.mat'
f1vad = result1;
s.case = f1vad;
eval(['casesvad.list = [casesvad.list s];']);
load 'TEST\REALTIME SIMULATION\f2.mat'
f2vad = result2;
s.case = f2vad;
eval(['casesvad.list = [casesvad.list s];']);
load 'TEST\REALTIME SIMULATION\f4.mat'
f4vad = result4;
s.case = f4vad;
eval(['casesvad.list = [casesvad.list s];']);


namesvad = {'w1vad', 'w2vad', 'w4vad', 'f1vad', 'f2vad', 'f4vad'};
j = 1;
for i = 1:length(casesvad.list)
    setup = casesvad.list(i).case;
    figure('Name', namesvad{i});
    resultCase = strcat('result', num2str(j), '1mbf');
    y = extractfield(setup.(resultCase), 'wer');
    plot(snrvad, y, 'k-o', 'LineWidth', 1.5);
    hold on;
    resultCase = strcat('result', num2str(j), '1');
    y = extractfield(setup.(resultCase), 'wer');
    plot(snrvad,y, 'k-x', 'LineWidth', 1.5);
    resultCase = strcat('result', num2str(j), '2');
    y = extractfield(setup.(resultCase), 'wer');
    plot(snrvad,y, 'k-s', 'LineWidth', 1.5);
    resultCase = strcat('result', num2str(j), '3');
    y = extractfield(setup.(resultCase), 'wer');
    plot(snrvad, y, 'k-d', 'LineWidth', 1.5);
    resultCase = strcat('result', num2str(j), '4');
    y = extractfield(setup.(resultCase), 'wer');
    plot(snrvad, y, 'k-p', 'LineWidth', 1.5);
    
    if(j == 1)
        title(strcat(num2str(j), ' meter'), 'FontSize', 16);
    else
        title(strcat(num2str(j), ' meters'), 'FontSize', 16);
    end
    l3 = legend( '1 mic   + noise - bf', '1 mic   + noise + bf','2 mics + noise + bf','3 mics + noise + bf','4 mics + noise + bf', 'Location', 'NorthWest');
    xlabel('SNR [dB]', 'FontSize', 16);
    ylabel('Recognition Rate [%]', 'FontSize', 16);
    set(gca, 'fontsize', 12);
    set(l3 , 'FontSize', 14);
    axis([START_SNR (START_SNR + (M-1)*DECIBEL_STEP) 0 100]);
    %saveas(gcf, ['Figures/RESULTS/', namesr{i},'.eps']);
    
    if(j == 1)
        j = 2;
    elseif(j == 2)
        j = 4;
    elseif(j == 4)
        j = 1;
    end
end




