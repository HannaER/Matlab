clc;
clear all
close all

L = 160;    % Block length
D = 80;     % Overlap
P = 8;      % Nbr of reflection coefficients
fs = 8000;  % Sampling frequency
Th = 0.1;  % Threshold
g = 0.98;
% Change last 0 to 1 if you want to listen and see plots

load Viktor_db/original/newH
add_to_db(rec, 'Viktor_db/H3', L, D, P, fs, Th, g, 1);

% load newH2
% add_to_db(rec, 'Viktor_db/database/h2', L, D, P, fs, Th, g, 0)
% 
% load newH3
% add_to_db(rec, 'Viktor_db/database/h3', L, D, P, fs, Th, g, 0)
% 
% load newH4
% add_to_db(rec, 'Viktor_db/database/h4', L, D, P, fs, Th, g, 0)
% 
% load newH5
% add_to_db(rec, 'Viktor_db/database/h5', L, D, P, fs, Th, g, 0)
% 
% load newH6
% add_to_db(rec, 'Viktor_db/database/h6', L, D, P, fs, Th, g, 0)
% 
% load newH7
% add_to_db(rec, 'Viktor_db/database/h7', L, D, P, fs, Th, g, 0)
% 
%
% load VTestRight1
% add_to_db(rec, 'Viktor_db/database/r1', L, D, P, fs, Th, g, 0)
% 
% load VTestRight2
% add_to_db(rec, 'Viktor_db/database/r2', L, D, P, fs, Th, g, 1)
% 
% load VTestRight3
% add_to_db(rec, 'Viktor_db/database/r3', L, D, P, fs, Th, g, 0)
% 
% load VTestRight4
% add_to_db(rec, 'Viktor_db/database/r4', L, D, P, fs, Th, g, 0)
% 
% load VTestRight5
% add_to_db(rec, 'Viktor_db/database/r5', L, D, P, fs, Th, g, 0)
% 
% load VTestLeft1
% add_to_db(rec, 'Viktor_db/database/l1', L, D, P, fs, Th, g, 0)
% 
% load VTestLeft2
% add_to_db(rec, 'Viktor_db/database/l2', L, D, P, fs, Th, g, 0)
% 
% load VTestLeft3
% add_to_db(rec, 'Viktor_db/database/l3', L, D, P, fs, Th, g, 0)
% 
% load VTestLeft4
% add_to_db(rec, 'Viktor_db/database/l4', L, D, P, fs, Th, g, 0)
% 
% load VTestLeft5
% add_to_db(rec, 'Viktor_db/database/l5', L, D, P, fs, Th, g, 0)
% 
% load Test
% add_to_db(rec, 'Viktor_db/database/t1', L, D, P, fs, Th, g, 0)