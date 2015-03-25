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
load Hanna_db/original/v1.mat
add_to_db(rec, 'Hanna_db/database/l1', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/v2.mat
add_to_db(rec, 'Hanna_db/database/l2', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/v3.mat
add_to_db(rec, 'Hanna_db/database/l3', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/v4.mat
add_to_db(rec, 'Hanna_db/database/l4', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/v5.mat
add_to_db(rec, 'Hanna_db/database/l5', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/v6.mat
add_to_db(rec, 'Hanna_db/database/l6', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/v7.mat
add_to_db(rec, 'Hanna_db/database/l7', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/v8.mat
add_to_db(rec, 'Hanna_db/database/l8', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/v9.mat
add_to_db(rec, 'Hanna_db/database/l9', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/v10.mat
add_to_db(rec, 'Hanna_db/database/l10', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/v11.mat
add_to_db(rec, 'Hanna_db/database/l11', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/v12.mat
add_to_db(rec, 'Hanna_db/database/l12', L, D, P, M, 8000, GAMMA, 0);



%%%%%%% H�GER %%%%%%%
load Hanna_db/original/h1.mat
add_to_db(rec, 'Hanna_db/database/r1', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/h2.mat
add_to_db(rec, 'Hanna_db/database/r2', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/h3.mat
add_to_db(rec, 'Hanna_db/database/r3', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/h4.mat
add_to_db(rec, 'Hanna_db/database/r4', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/h5.mat
add_to_db(rec, 'Hanna_db/database/r5', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/h6.mat
add_to_db(rec, 'Hanna_db/database/r6', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/h7.mat
add_to_db(rec, 'Hanna_db/database/r7', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/h8.mat
add_to_db(rec, 'Hanna_db/database/r8', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/h9.mat
add_to_db(rec, 'Hanna_db/database/r9', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/h10.mat
add_to_db(rec, 'Hanna_db/database/r10', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/h11.mat
add_to_db(rec, 'Hanna_db/database/r11', L, D, P, M, 8000, GAMMA, 0);

load Hanna_db/original/h12.mat
add_to_db(rec, 'Hanna_db/database/r12', L, D, P, M, 8000, GAMMA, 0);








