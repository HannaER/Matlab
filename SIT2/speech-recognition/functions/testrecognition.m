

clc;
close all;
clear all;
load task5.mat

% 'four': t1,x1, x5
% 'eigth': t2, x2, x4
% 'nine': t3, x3


% Call the function 'matching' to calculate the error of the 
% word-matching. Input is the feature matrix and data base
load four.mat
load 41.mat
four0 = matching(db, db)
four_samma = matching(features , db)
load 42.mat
four_man = matching(features, db)
load 81.mat
four8 = matching(features, db)
load 82.mat
four8 = matching(features, db)
load 91.mat
four9 = matching(features, db)

load eigth.mat
load 81.mat
eigth0 = matching(db, db)
eigth1 = matching(features , db)
load 82.mat
eigth2 = matching(features, db)







