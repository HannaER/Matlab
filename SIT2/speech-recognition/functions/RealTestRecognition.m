clc;
close all;
clear all;

%load Library/B_db_F
%B1 = db;

% Call the function 'matching' to calculate the error of the 
% word-matching. Input is the feature matrix and data base

 load Viktor_db/database/h1
 h1 = db;
% 
 load Viktor_db/database/h2
 h2 = db;
% 
 load Viktor_db/database/h3
 h3 = db;
% 
 load Viktor_db/database/h4
 h4 = db;
% 
 load Viktor_db/database/h5
 h5 = db;
% 
% load Viktor_db/database/h6
% h6 = db;
% 
% load Viktor_db/database/h7
% h7 = db;
% 
% % load Viktor_db/database/r1
% % r1 = db;
% % 
% % load Viktor_db/database/r2
% % r2 = db;
% % 
% % load Viktor_db/database/r3
% % r3 = db;
% % 
% % load Viktor_db/database/r4
% % r4 = db;
% % 
% % load Viktor_db/database/r5
% % r5 = db;
% % 
% % load Viktor_db/database/l1
% % l1 = db;
% % 
% % load Viktor_db/database/l2
% % l2 = db;
% % 
% % load Viktor_db/database/l3
% % l3 = db;
% % 
% % load Viktor_db/database/l4
% % l4 = db;
% % 
% % load Viktor_db/database/l5
% % l5 = db;
% % 
   load Viktor_db/database/t1
   t1 = db;
 
   t = t1;
% 
    vs_r1 = matching(t, h1);
    vs_r2 = matching(t, h2);
    vs_r3 = matching(t, h3);
    vs_r4 = matching(t, h4);
    vs_r5 = matching(t, h5);
%     
%     % vs left
%     vs_l1 = matching(t, h6);
%     vs_l2 = matching(t, h7);
% %     vs_l2 = matching(t, l2);
% %     vs_l3 = matching(t, l3);
% %     vs_l4 = matching(t, l4); % Ingen matchning
% %     vs_l5 = matching(t, l5); % Ingen matchning
% 
%     vs_t1 = matching(t, t1);
% 
    R = [vs_r1 vs_r2 vs_r3 vs_r4 vs_r5]
    dR = sum(R)/5;
    R_min = min(R);
    R_max = max(R);
    R_diff = R_max-R_min
% 
% 
% %     L = [vs_l1 vs_l2 vs_l3 vs_l4 vs_l5];
% %     dL = sum(L)/4
% %     L_min = min(L)
% 


    figure; hold on; whitebg('black');
    axis([-0.2 5.2 4 13]);
    plot(R, 'g*'); %plot(L, 'r*'); 
    plot(dR, 'r+');
%     %plot(dL,'r+'); 
%     %plot(vs_t1,'b+')
% 
% 
% 
