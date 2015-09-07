close all;
clear all;
clc;


k1 = [12 10 8.7 13.5 12.3];
k2 = [10.2 10.1 11.1 10.6 11.3];


plot(k1, 'kX','LineWidth', 1.5);
hold on;
plot(k2, 'ko','LineWidth', 1.5);
axis([0.5 5.5 8 14.5]);
set(gca, 'fontsize', 12);


