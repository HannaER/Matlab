clc;
clear all;


load 'Hanna_db\database\r15.mat'
current_word_name = 'höger';
SUBSET_LENGTH = 12;
N_REFLEC = 9;
input = db;
load 'DB\db.mat'

match = matching(input, 'DB\db.mat', current_word_name, SUBSET_LENGTH, N_REFLEC)


