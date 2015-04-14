clc;
clear all;
close all;

load l1.mat
dbl1 = db;
load l2.mat
dbl2 = db;
load l3.mat
dbl3 = db;
load l4.mat
dbl4 = db;
load l5.mat
dbl5 = db;

load r1.mat
dbr1 = db;
load r2.mat
dbr2 = db;
load r3.mat
dbr3 = db;
load r4.mat
dbr4 = db;
load r5.mat
dbr5 = db;


%%%%% VÄNSTER %%%%%%
l1_l2 = matching(dbl1, dbl2)
l1_l3 = matching(dbl1, dbl3)
l1_l4 = matching(dbl1, dbl4)
l1_l5 = matching(dbl1, dbl5)
lvec= [l1_l2  l1_l3  l1_l4  l1_l5];
error_mean_left = (l1_l2 + l1_l3 + l1_l4 + l1_l5)/4



%%%%% HÖGER %%%%%%%
l1_r1 = matching(dbl1, dbr1)
l1_r2 = matching(dbl1, dbr2)
l1_r3 = matching(dbl1, dbr3)
l1_r4 = matching(dbl1, dbr4)
l1_r5 = matching(dbl1, dbr5)
rvec = [l1_r1  l1_r2  l1_r3  l1_r4  l1_r5];
error_mean_right = (l1_r1 + l1_r2 + l1_r3 + l1_r4 + l1_r5)/5


if error_mean_left < error_mean_right
    if min(lvec)< min(rvec)
        disp('Vänster');
    end
elseif error_mean_left > error_mean_right
    if min(lvec)> min(rvec)
        disp('Höger');
    end    
else
    disp('Inget av orden i databasen');
end

