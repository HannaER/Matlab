%%%%% Testa 4 meter mot databasen %%%%
clear all;
close all;
clc;

L = 4; % antal micar som amn ska testa för, dvs. anatlet kurvor i grafen
M = 50; % antal brusnivåer, mätpunkter/kurva
N = 100; % 100 ord ska testas, 50/50 höger/vänster
P = 200; % antal ord(vänster/höger)/avstånd


%% %%%%%%%%%%% 4 meter %%%%%%%%%%%%%%%%%%%%%%%%%

result41 = [];
result42 = [];
result43 = [];
result44 = [];
snr4 = []; % x-vector - the same for all 4


%%%%% PLOTTA 4 meter %%%%%
