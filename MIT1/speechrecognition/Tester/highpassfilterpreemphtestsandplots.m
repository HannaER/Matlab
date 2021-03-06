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
close all;
clear all;

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
%legend('Original signal', 'After high pass','After pre emph');
axis([0 300 0 2*10^-4]);
set(gca, 'fontsize', 12);

figure (2)
subplot(311)
hold on;
plot(duns, 'b', 'LineWidth', 1.5);
plot(output1, 'r', 'LineWidth', 1.5);
plot(output2, 'g', 'LineWidth', 1.5);
%legend('Original signal', 'After high pass','After pre emph');
title('THUMP IN THE TABLE', 'FontSize', 16);
axis([0 12000 -0.035 0.035]);
set(gca, 'fontsize', 12);
% ylabel('Amplitude');
% xlabel('Samples');

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
%legend('Original signal', 'After high pass','After pre emph');
axis([0 300 0 2*10^-4]);
set(gca, 'fontsize', 12);

figure (2)
subplot(312)
hold on;
plot(knack, 'b', 'LineWidth', 1.5);
plot(output1, 'r', 'LineWidth', 1.5);
plot(output2, 'g', 'LineWidth', 1.5);
%legend('Original signal', 'After high pass','After pre emph');
title('KNOCKING ON THE TABLE', 'FontSize', 16);
axis([0 12000 -0.003 0.003]);
ylabel('Amplitude', 'FontSize', 16);
%xlabel('Samples', 'FontSize', 16);
set(gca, 'fontsize', 12);



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
%legend('Original signal', 'After high pass','After pre emph');
axis([0 300 0 15*10^-4]);
set(gca, 'fontsize', 12);


figure (2)
subplot(313)
hold on;
plot(tal, 'b', 'LineWidth', 1.5);
plot(output1, 'r', 'LineWidth', 1.5);
plot(output2, 'g', 'LineWidth', 1.5);
%legend('Original signal', 'After high pass','After pre emph');
title('SPEECH', 'FontSize', 16);
axis([0 12000 -0.05 0.05]);
%ylabel('Amplitude');
xlabel('Samples', 'FontSize', 16);
set(gca, 'fontsize', 12);


figure (3)
freqz([1, -1, 0], [1,-DELTA,0]);
title('High-pass filter', 'FontSize', 16);
set(gca, 'fontsize', 12);

figure (4)
freqz([1 -GAMMA], 1);
title('Pre-emphasis filter', 'FontSize', 16);
set(gca, 'fontsize', 12);


%% Ska testa l�gga till filter och unders�ka om st�rningarna d�mpas mer
% clc;
% close all;
% clear all;

GAMMA = 0.5;
DELTA = 0.91;
DELTA2 = 0.5;
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
%rmnoise2
output1 = filter([1, -1, 0], [1,-DELTA2,0], output1);
%preemph
output2 = filter([1 -GAMMA], 1, output1); %filter(b, a, x)

figure(5)
subplot(311)
hold on;
fft_(knack, L, fs, 311, 'b');
fft_(output1, L, fs, 311, 'r');
fft_(output2, L, fs, 311, 'g');
%legend('Original signal', 'After high pass','After pre emph');
axis([0 300 0 2*10^-4]);
set(gca, 'fontsize', 12);

figure (6)
subplot(311)
hold on;
plot(duns, 'b', 'LineWidth', 1.5);
plot(output1, 'r', 'LineWidth', 1.5);
plot(output2, 'g', 'LineWidth', 1.5);
%legend('Original signal', 'After high pass','After pre emph');
title('THUMP IN THE TABLE', 'FontSize', 16);
axis([0 12000 -0.035 0.035]);
set(gca, 'fontsize', 12);
% ylabel('Amplitude');
% xlabel('Samples');

%%%% KNACK  %%%%%%%%%%%
%rmnoise
output1 = filter([1, -1, 0], [1,-DELTA,0], knack);
%rmnoise2
output1 = filter([1, -1, 0], [1,-DELTA2,0], output1);
%preemph
output2 = filter([1 -GAMMA], 1, output1); %filter(b, a, x)

figure(5)
subplot(312)
hold on;
fft_(knack, L, fs, 312, 'b');
fft_(output1, L, fs, 312, 'r');
fft_(output2, L, fs, 312, 'g');
%legend('Original signal', 'After high pass','After pre emph');
axis([0 300 0 2*10^-4]);
set(gca, 'fontsize', 12);


figure (6)
subplot(312)
hold on;
plot(knack, 'b', 'LineWidth', 1.5);
plot(output1, 'r', 'LineWidth', 1.5);
plot(output2, 'g', 'LineWidth', 1.5);
%legend('Original signal', 'After high pass','After pre emph');
title('KNOCKING ON THE TABLE');
axis([0 12000 -0.003 0.003]);
set(gca, 'fontsize', 12);
ylabel('Amplitude', 'FontSize', 16);
% xlabel('Samples');



%%%%% TAL  %%%%%%%%%%


%rmnoise
output1 = filter([1, -1, 0], [1,-DELTA,0], tal);
%rmnoise2
output1 = filter([1, -1, 0], [1,-DELTA2,0], output1);
%preemph
output2 = filter([1 -GAMMA], 1, output1); %filter(b, a, x)

figure(5)
subplot(313);
hold on;
fft_(knack, L, fs, 313, 'b');
fft_(output1, L, fs, 313, 'r');
subplot(313)
fft_(output2, L, fs, 313, 'g');
%legend('Original signal', 'After high pass','After pre emph');
axis([0 300 0 15*10^-4]);
set(gca, 'fontsize', 12);

figure (6)
subplot(313)
hold on;
plot(tal, 'b');
plot(output1, 'r');
plot(output2, 'g');
%legend('Original signal', 'After high pass','After pre emph');
title('SPEECH', 'FontSize', 16);
axis([0 12000 -0.05 0.05]);
%ylabel('Amplitude');
xlabel('Samples', 'FontSize', 16);
set(gca, 'fontsize', 12);


figure (7)
freqz([1, -1, 0], [1,-DELTA,0]);
title('High-pass filter 1', 'FontSize', 16);
set(gca, 'fontsize', 12);
figure (8)
freqz([1 -GAMMA], 1);
title(' pre emph');
figure (9)
freqz([1, -1, 0], [1,-DELTA2,0]);
title('High-pass filter 2', 'FontSize', 16);
set(gca, 'fontsize', 12);










