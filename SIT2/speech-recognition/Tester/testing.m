%%%%%%%%%%% testar vad sm�llar i bord ligger p� f�re frekvsener%%%%%%%%



%% Spela in sm�llar

fs = 8000;
fileName = 'Noise_db/bord_duns.mat';
fprintf('Nu spelar vi in till filen: "%s"\n\n', fileName);
pause(5);
rec = Rec(fileName, 1.5, -1);

figure (1)
subplot(321)
plot(rec);
title('Duns i bordet');
L = length(rec);
fft_(rec, L, fs, 322, 'b');

fileName = 'Noise_db/bord_knack.mat';
fprintf('Nu spelar vi in till filen: "%s"\n\n', fileName);
pause(5);
rec = Rec(fileName, 1.5, -1);

figure (1)
subplot(323)
plot(rec);
title('Knackning i bordet');
fft_(rec, L, fs, 324, 'b');


fileName = 'Noise_db/tal.mat';
fprintf('Nu spelar vi in till filen: "%s"\n\n', fileName);
pause(5);
rec = Rec(fileName, 1.5, -1);

figure (1)
subplot(325)
plot(rec);
title('Tal');
fft_(rec, L, fs, 326, 'b');


%% Unders�ker huruvida pre_emph och rm_noise tar bort st�rningarna
clc;
% close all;
% clear all;

GAMMA = 0.5;
DELTA = 0.91;
fs = 8000;
load 'Noise_db/bord_knack.mat';
knack = rec;

load 'Noise_db/bord_duns.mat';
duns = rec;

load 'Hanna_db/original/v2.mat';
tal = rec;

L = length(rec);


%%%%% DUNS  %%%%%%%%%%%%%%
%rmnoise
output1 = filter([1, -1, 0], [1,-DELTA,0], duns);
%preemph
output2 = filter([1 -GAMMA], 1, output1); %filter(b, a, x)

figure(1)
subplot(311)
hold on;
fft_(knack, L, fs, 311, 'b');
fft_(output1, L, fs, 311, 'r');
fft_(output2, L, fs, 311, 'g');
legend('After pre emph', 'Original signal', ' After rm noise');

figure (2)
subplot(311)
hold on;
plot(duns, 'b');
plot(output1, 'r');
plot(output2, 'g');
legend('After pre emph', 'Original signal', ' After rm noise');
title('DUNS I BORDET');
ylabel('Amplitude');
xlabel('Samples');

%%%% KNACK  %%%%%%%%%%%
%rmnoise
output1 = filter([1, -1, 0], [1,-DELTA,0], knack);
%preemph
output2 = filter([1 -GAMMA], 1, output1); %filter(b, a, x)

figure(1)
subplot(312)
hold on;
fft_(knack, L, fs, 312, 'b');
fft_(output1, L, fs, 312, 'r');
fft_(output2, L, fs, 312, 'g');
legend('After pre emph', 'Original signal', ' After rm noise');

figure (2)
subplot(312)
hold on;
plot(knack, 'b');
plot(output1, 'r');
plot(output2, 'g');
legend('After pre emph', 'Original signal', ' After rm noise');
title('KNACKNING I BORDET');
ylabel('Amplitude');
xlabel('Samples');



%%%%% TAL  %%%%%%%%%%


%rmnoise
output1 = filter([1, -1, 0], [1,-DELTA,0], tal);
%preemph
output2 = filter([1 -GAMMA], 1, output1); %filter(b, a, x)

figure(1)
subplot(313);
hold on;
fft_(knack, L, fs, 313, 'b');
fft_(output1, L, fs, 313, 'r');
subplot(313)
fft_(output2, L, fs, 313, 'g');
legend('After pre emph', 'Original signal', ' After rm noise');


figure (2)
subplot(313)
hold on;
plot(tal, 'b');
plot(output1, 'r');
plot(output2, 'g');
legend('After pre emph', 'Original signal', ' After rm noise');
title('TAL');
ylabel('Amplitude');
xlabel('Samples');


figure (3)
freqz([1, -1, 0], [1,-DELTA,0]);
title(' rm noise');
figure (4)
freqz([1 -GAMMA], 1);
title(' pre emph');




