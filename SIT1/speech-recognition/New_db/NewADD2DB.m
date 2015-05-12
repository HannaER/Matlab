clc;
close all;
clear all;
% l�d kod: 369
P = 9; %N_REFLEC
L = 160; %BLOCK_LENGTH
D = L/2; %OVERLAP
M = 12; %SUBSET_LENGTH
GAMMA = 0.5; % coefficient for pre_emhp

%%%%%%% V�NSTER %%%%%%%
load New_db/original/l1.mat
add_to_db(rec, 'New_db/database/l1', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/l2.mat
add_to_db(rec, 'New_db/database/l2', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/l3.mat
add_to_db(rec, 'New_db/database/l3', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/l4.mat
add_to_db(rec, 'New_db/database/l4', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/l5.mat
add_to_db(rec, 'New_db/database/l5', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/l6.mat
add_to_db(rec, 'New_db/database/l6', L, D, P, M, 8000, GAMMA, 0);




%%%%%%% H�GER %%%%%%%
load New_db/original/r1.mat
add_to_db(rec, 'New_db/database/r1', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/r2.mat
add_to_db(rec, 'New_db/database/r2', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/r3.mat
add_to_db(rec, 'New_db/database/r3', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/r4.mat
add_to_db(rec, 'New_db/database/r4', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/r5.mat
add_to_db(rec, 'New_db/database/r5', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/r6.mat
add_to_db(rec, 'New_db/database/r6', L, D, P, M, 8000, GAMMA, 0);








