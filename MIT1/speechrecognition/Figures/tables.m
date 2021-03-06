%% TABLES
clc;
clear all;
close all;
format short;

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




names = {'w1', 'w2', 'w4', 'f1', 'f2', 'f4', 'e1', 'e2', 'e4', 'b1', 'b2', 'b4'};
j = 1;
noise_level = 79;
toPrint = 'SPEECH & NOISE, 80 procent\n\nNoise/Distance\t\tNo bf\t\t1 mic\t\t2 mics\t\t3 mics\t\t4 mics\n';
for i = 1:length(cases.list)
    setup = cases.list(i).case;
    resultCase = strcat('result', num2str(j), '1mbf');
    y1 = extractfield(setup.(resultCase), 'wer');
    snr = extractfield(setup.(resultCase), 'snr');
    resultCase = strcat('result', num2str(j), '1');
    y2 = extractfield(setup.(resultCase), 'wer');
    resultCase = strcat('result', num2str(j), '2');
    y3 = extractfield(setup.(resultCase), 'wer');
    resultCase = strcat('result', num2str(j), '3');
    y4 = extractfield(setup.(resultCase), 'wer');
    resultCase = strcat('result', num2str(j), '4');
    y5 = extractfield(setup.(resultCase), 'wer');
    
    
    toPrint = strcat(toPrint, names{i}, '\t\t\t\t\t\t');
    res = find(y1>noise_level);
    if(length(res)> 0)
        toPrint = strcat(toPrint, num2str((snr(res(1)))), '\t\t\t');
    else
        toPrint = strcat(toPrint, '-\t\t\t');
    end
    res = find(y2>noise_level);
    if(length(res)> 0)
        toPrint = strcat(toPrint, num2str((snr(res(1)))), '\t\t\t');
    else
        toPrint = strcat(toPrint, '-\t\t\t');
    end
    res = find(y3>noise_level);
    if(length(res)> 0)
        toPrint = strcat(toPrint, num2str((snr(res(1)))), '\t\t\t');
    else
        toPrint = strcat(toPrint, '-\t\t\t');
    end
    res = find(y4>noise_level);
    if(length(res)> 0)
        toPrint = strcat(toPrint, num2str((snr(res(1)))), '\t\t\t');
    else
        toPrint = strcat(toPrint, '-\t\t\t');
    end
    res = find(y5>noise_level);
    if(length(res)> 0)
        toPrint = strcat(toPrint, num2str((snr(res(1)))), '\n');
    else
        toPrint = strcat(toPrint, '-\n');
    end
    
    if(j == 1)
        j = 2;
    elseif(j == 2)
        j = 4;
    elseif(j == 4)
        j = 1;
    end
end
display(sprintf(toPrint));






%%%%%%%%%% NOISE + REVERBERATION %%%%%%%%%%


cases_r.list = [];


%%% WHITE, FACTORY, ENGINE AND BABBLE  %%%

load 'TEST\NOISE+REVERBERATION\white1.mat'
w1r = result1r;
s.case = w1r;
eval(['cases_r.list = [cases_r.list s];']);
load 'TEST\NOISE+REVERBERATION\white2.mat'
w2r = result2r;
s.case = w2r;
eval(['cases_r.list = [cases_r.list s];']);
load 'TEST\NOISE+REVERBERATION\white4.mat'
w4r = result4r;
s.case = w4r;
eval(['cases_r.list = [cases_r.list s];']);

load 'TEST\NOISE+REVERBERATION\factory1.mat'
f1r = result1r;
s.case = f1r;
eval(['cases_r.list = [cases_r.list s];']);
load 'TEST\NOISE+REVERBERATION\factory2.mat'
f2r = result2r;
s.case = f2r;
eval(['cases_r.list = [cases_r.list s];']);
load 'TEST\NOISE+REVERBERATION\factory4.mat'
f4r = result4r;
s.case = f4r;
eval(['cases_r.list = [cases_r.list s];']);


load 'TEST\NOISE+REVERBERATION\engine1.mat'
e1r = result1r;
s.case = e1r;
eval(['cases_r.list = [cases_r.list s];']);
load 'TEST\NOISE+REVERBERATION\engine2.mat'
e2r = result2r;
s.case = e2r;
eval(['cases_r.list = [cases_r.list s];']);
load 'TEST\NOISE+REVERBERATION\engine4.mat'
e4r = result4r;
s.case = e4r;
eval(['cases_r.list = [cases_r.list s];']);


load 'TEST\NOISE+REVERBERATION\babble1.mat'
b1r = result1r;
s.case = b1r;
eval(['cases_r.list = [cases_r.list s];']);
load 'TEST\NOISE+REVERBERATION\babble2.mat'
b2r = result2r;
s.case = b2r;
eval(['cases_r.list = [cases_r.list s];']);
load 'TEST\NOISE+REVERBERATION\babble4.mat'
b4r = result4r;
s.case = b4r;
eval(['cases_r.list = [cases_r.list s];']);






names = {'w1', 'w2', 'w4', 'f1', 'f2', 'f4', 'e1', 'e2', 'e4', 'b1', 'b2', 'b4'};
j = 1;
noise_reverb_level = 9;
toPrint = 'SPEECH, NOISE & REVERBERATION, 10 procent \n\nNoise/Distance\t\tNo bf\t\t1 mic\t\t2 mics\t\t3 mics\t\t4 mics\n';
for i = 1:length(cases_r.list)
    setup = cases_r.list(i).case;
    resultCase = strcat('result', num2str(j), '1mbf');
    y1 = extractfield(setup.(resultCase), 'wer');
    snr = extractfield(setup.(resultCase), 'snr');
    resultCase = strcat('result', num2str(j), '1');
    y2 = extractfield(setup.(resultCase), 'wer');
    resultCase = strcat('result', num2str(j), '2');
    y3 = extractfield(setup.(resultCase), 'wer');
    resultCase = strcat('result', num2str(j), '3');
    y4 = extractfield(setup.(resultCase), 'wer');
    resultCase = strcat('result', num2str(j), '4');
    y5 = extractfield(setup.(resultCase), 'wer');
    
    
    toPrint = strcat(toPrint, names{i}, '\t\t\t\t\t\t');
    res = find(y1>noise_reverb_level);
    if(length(res)> 0)
        toPrint = strcat(toPrint, num2str((snr(res(1)))), '\t\t\t');
    else
        toPrint = strcat(toPrint, '-\t\t\t');
    end
    res = find(y2>noise_reverb_level);
    if(length(res)> 0)
        toPrint = strcat(toPrint, num2str((snr(res(1)))), '\t\t\t');
    else
        toPrint = strcat(toPrint, '-\t\t\t');
    end
    res = find(y3>noise_reverb_level);
    if(length(res)> 0)
        toPrint = strcat(toPrint, num2str((snr(res(1)))), '\t\t\t');
    else
        toPrint = strcat(toPrint, '-\t\t\t');
    end
    res = find(y4>noise_reverb_level);
    if(length(res)> 0)
        toPrint = strcat(toPrint, num2str((snr(res(1)))), '\t\t\t');
    else
        toPrint = strcat(toPrint, '-\t\t\t');
    end
    res = find(y5>noise_reverb_level);
    if(length(res)> 0)
        toPrint = strcat(toPrint, num2str((snr(res(1)))), '\n');
    else
        toPrint = strcat(toPrint, '-\n');
    end
    
    if(j == 1)
        j = 2;
    elseif(j == 2)
        j = 4;
    elseif(j == 4)
        j = 1;
    end
end
display(sprintf(toPrint));




%%%%%%%%%% REALTIME SIMULATION %%%%%%%%%%


cases_vad.list = [];


%%% WHITE AND FACTORY  %%%

load 'TEST\REALTIME SIMULATION\w1.mat'
w1vad = result1;
s.case = w1vad;
eval(['cases_vad.list = [cases_vad.list s];']);
load 'TEST\REALTIME SIMULATION\w2.mat'
w2vad = result2;
s.case = w2vad;
eval(['cases_vad.list = [cases_vad.list s];']);
load 'TEST\REALTIME SIMULATION\w4.mat'
w4vad = result4;
s.case = w4vad;
eval(['cases_vad.list = [cases_vad.list s];']);

load 'TEST\REALTIME SIMULATION\f1.mat'
f1vad = result1;
s.case = f1vad;
eval(['cases_vad.list = [cases_vad.list s];']);
load 'TEST\REALTIME SIMULATION\f2.mat'
f2vad = result2;
s.case = f2vad;
eval(['cases_vad.list = [cases_vad.list s];']);
load 'TEST\REALTIME SIMULATION\f4.mat'
f4vad = result4;
s.case = f4vad;
eval(['cases_vad.list = [cases_vad.list s];']);








names = {'w1', 'w2', 'w4', 'f1', 'f2', 'f4'};
j = 1;
noise_level_vad = 9;
toPrint = 'SPEECH, NOISE & REVERBERATION, 10 procent \n\nNoise/Distance\t\tNo bf\t\t1 mic\t\t2 mics\t\t3 mics\t\t4 mics\n';
for i = 1:length(cases_vad.list)
    setup = cases_vad.list(i).case;
    resultCase = strcat('result', num2str(j), '1mbf');
    y1 = extractfield(setup.(resultCase), 'wer');
    snr = extractfield(setup.(resultCase), 'snr');
    resultCase = strcat('result', num2str(j), '1');
    y2 = extractfield(setup.(resultCase), 'wer');
    resultCase = strcat('result', num2str(j), '2');
    y3 = extractfield(setup.(resultCase), 'wer');
    resultCase = strcat('result', num2str(j), '3');
    y4 = extractfield(setup.(resultCase), 'wer');
    resultCase = strcat('result', num2str(j), '4');
    y5 = extractfield(setup.(resultCase), 'wer');
    
    
    toPrint = strcat(toPrint, names{i}, '\t\t\t\t\t\t');
    res = find(y1>noise_level_vad);
    if(length(res)> 0)
        toPrint = strcat(toPrint, num2str((snr(res(1)))), '\t\t\t');
    else
        toPrint = strcat(toPrint, '-\t\t\t');
    end
    res = find(y2>noise_level_vad);
    if(length(res)> 0)
        toPrint = strcat(toPrint, num2str((snr(res(1)))), '\t\t\t');
    else
        toPrint = strcat(toPrint, '-\t\t\t');
    end
    res = find(y3>noise_level_vad);
    if(length(res)> 0)
        toPrint = strcat(toPrint, num2str((snr(res(1)))), '\t\t\t');
    else
        toPrint = strcat(toPrint, '-\t\t\t');
    end
    res = find(y4>noise_level_vad);
    if(length(res)> 0)
        toPrint = strcat(toPrint, num2str((snr(res(1)))), '\t\t\t');
    else
        toPrint = strcat(toPrint, '-\t\t\t');
    end
    res = find(y5>noise_level_vad);
    if(length(res)> 0)
        toPrint = strcat(toPrint, num2str((snr(res(1)))), '\n');
    else
        toPrint = strcat(toPrint, '-\n');
    end
    
    if(j == 1)
        j = 2;
    elseif(j == 2)
        j = 4;
    elseif(j == 4)
        j = 1;
    end
end
display(sprintf(toPrint));