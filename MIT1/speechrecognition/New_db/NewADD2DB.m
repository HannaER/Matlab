clc;
close all;
clear all;
P = 9; %N_REFLEC
L = 160; %BLOCK_LENGTH
D = L/2; %OVERLAP
M = 12; %SUBSET_LENGTH
GAMMA = 0.5; % coefficient for pre_emhp

%%%%%%% VÄNSTER %%%%%%%
load New_db/original/l1.mat
add_to_db(rec, 'New_db/database/l1', L, D, P, M, 8000, GAMMA, 1);

load New_db/original/l2.mat
add_to_db(rec, 'New_db/database/l2', L, D, P, M, 8000, GAMMA, 1);

load New_db/original/l3.mat
add_to_db(rec, 'New_db/database/l3', L, D, P, M, 8000, GAMMA, 1);

load New_db/original/l4.mat
add_to_db(rec, 'New_db/database/l4', L, D, P, M, 8000, GAMMA, 1);

load New_db/original/l5.mat
add_to_db(rec, 'New_db/database/l5', L, D, P, M, 8000, GAMMA, 1);

load New_db/original/l6.mat
add_to_db(rec, 'New_db/database/l6', L, D, P, M, 8000, GAMMA, 1);

load New_db/original/l7.mat
add_to_db(rec, 'New_db/database/l7', L, D, P, M, 8000, GAMMA, 1);

load New_db/original/l8.mat
add_to_db(rec, 'New_db/database/l8', L, D, P, M, 8000, GAMMA, 1);

load New_db/original/l9.mat
add_to_db(rec, 'New_db/database/l9', L, D, P, M, 8000, GAMMA, 1);

load New_db/original/l10.mat
add_to_db(rec, 'New_db/database/l10', L, D, P, M, 8000, GAMMA, 1);

load New_db/original/l11.mat
add_to_db(rec, 'New_db/database/l11', L, D, P, M, 8000, GAMMA, 1);

load New_db/original/l12.mat
add_to_db(rec, 'New_db/database/l12', L, D, P, M, 8000, GAMMA, 1);

load New_db/original/l13.mat
add_to_db(rec, 'New_db/database/l13', L, D, P, M, 8000, GAMMA, 1);

load New_db/original/l14.mat
add_to_db(rec, 'New_db/database/l14', L, D, P, M, 8000, GAMMA, 1);

load New_db/original/l15.mat
add_to_db(rec, 'New_db/database/l15', L, D, P, M, 8000, GAMMA, 1);



%%%%%%% HÖGER %%%%%%%
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

load New_db/original/r7.mat
add_to_db(rec, 'New_db/database/r7', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/r8.mat
add_to_db(rec, 'New_db/database/r8', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/r9.mat
add_to_db(rec, 'New_db/database/r9', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/r10.mat
add_to_db(rec, 'New_db/database/r10', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/r11.mat
add_to_db(rec, 'New_db/database/r11', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/r12.mat
add_to_db(rec, 'New_db/database/r12', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/r13.mat
add_to_db(rec, 'New_db/database/r13', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/r14.mat
add_to_db(rec, 'New_db/database/r14', L, D, P, M, 8000, GAMMA, 0);

load New_db/original/r15.mat
add_to_db(rec, 'New_db/database/r15', L, D, P, M, 8000, GAMMA, 0);







