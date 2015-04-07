%% recording with different mics, do not run entire script
clc;
clear all;
close all;

figure (1)
title('Sladd mikrofonerna');
load 'Test_db/sladd_mic/h1.mat'
sladd1 = rec;
subplot(221)
plot(sladd1);
fft_(sladd1, length(sladd1), 8000, 222, 'r');


load 'Test_db/sladd_mic/h2.mat'
sladd2 = rec;
subplot(223)
plot(sladd2);
fft_(sladd2, length(sladd2), 8000, 224, 'r');



figure (2)
title('Bords mikronfonen');
load 'Hanna_db/original/h2.mat'
table = rec./10;
subplot(211)
plot(table);
fft_(table, length(table), 8000, 212, 'r');



platta1 = Rec('Test_db/platta_mic/h1.mat', 1.5, -1);


platta2 = Rec('Test_db/platta_mic/h2.mat', 1.5, -1);


platta3 = Rec('Test_db/platta_mic/h3.mat', 1.5, -1);


platta4 = Rec('Test_db/platta_mic/h4.mat', 1.5, -1);