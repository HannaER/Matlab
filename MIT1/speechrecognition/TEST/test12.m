%%%%% Testa 1 meter mot databasen %%%%
clear all;
close all;
clc;

L = 4; % antal micar som amn ska testa f�r, dvs. anatlet kurvor i grafen
M = 50; % antal brusniv�er, m�tpunkter/kurva
N = 100; % 100 ord ska testas, 50/50 h�ger/v�nster
P = 200; % antal ord(v�nster/h�ger)/avst�nd


%% %%%%%%%%%%% 2 meter %%%%%%%%%%%%%%%%%%%%%%%%%

result21 = [];
result22 = [];
result23 = [];
result24 = [];
snr2 = []; % x-vector - the same for all 4


%%%%% PLOTTA 2 meter %%%%%
