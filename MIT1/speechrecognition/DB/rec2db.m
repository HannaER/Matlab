%%%%%%%%%% Database %%%%%%%%%%%%%%
close all;
clc;
clear all;
dbv = [];
dbh = [];


N_REFLEC = 9; %N_REFLEC
BLOCK_LENGTH = 160; %BLOCK_LENGTH
OVERLAP = BLOCK_LENGTH/2; %OVERLAP
SUBSET_LENGTH = 12; %SUBSET_LENGTH
GAMMA = 0.5; % coefficient for pre_emhp
FS = 8000;
THRESHOLD = 6;


%%%%%%%%%%%%% VÄNSTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%
v1 = audioread('\Recordings\db\vänster\2015-05-11-111219\recording1.wav');
[v1, ps] = removerows(v1, [188800:240000]);
v.v1 = v1;
v2 = audioread('\Recordings\db\vänster\2015-05-11-111219\recording2.wav');
v.v2 = v2;
v3 = audioread('\Recordings\db\vänster\2015-05-11-111219\recording3.wav');
[v3, ps] = removerows(v3, [72260:75300]);
v.v3 = v3;


finished = 0;
N = 3;
filename = 'v';
word_length = 4999;
j = 1;
for i = 1:N
    filename = getfield(v, strcat('v', num2str(i)));
    while finished == 0
        index = vad(filename, 160, 7);
        if(length(filename) > index + word_length) && index ~= 1
            word = filename(index:index + word_length);
            s.ch1 = word;
            s.energy = sum(word.^2);
            if s.energy > 0.03
                dbv.rec(1,j).ch1 = s.ch1;
                dbv.rec(1,j).energy = s.energy;
                filename = filename(index + word_length:end);
                j = j + 1;
            end
        else
            finished = 1;
        end
    end
    finished = 0;
    
end
dbv.name = 'vänster';

for i = 1:length(dbv.rec)
    dbv.db(1,i).reflec = add_to_db_new(dbv.rec(1,i).ch1, BLOCK_LENGTH, OVERLAP, N_REFLEC, SUBSET_LENGTH, FS, GAMMA, THRESHOLD, 0);
end

save('DB\v.mat', 'dbv');


% for i = 1:length(dbv)
%     temp = dbv(1,i).ch1;
%     plot(temp);
%     title(num2str(i));
%     soundsc(temp);
%     pause(1);   
% end

%%%%%%%%%%% HÖGER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h1 = audioread('\Recordings\db\höger\2015-05-11-125242\recording1.wav');
[h1, ps] = removerows(h1, [214600:240000]);
h.h1 = h1;
h2 = audioread('\Recordings\db\höger\2015-05-11-125242\recording2.wav');
h.h2 = h2;
h3 = audioread('\Recordings\db\höger\2015-05-11-125242\recording3.wav');
[h3, ps] = removerows(h3, [188100:240000]);
h.h3 = h3;




finished = 0;
N = 3;
filename = 'h';
word_length = 4999;
j = 1;
for i = 1:N
    filename = getfield(h, strcat('h', num2str(i)));
    while finished == 0
        index = vad(filename, 160, 7);
        if(length(filename) > index + word_length) && index ~= 1
            word = filename(index:index + word_length);
            s.ch1 = word;
            %s.name = 'höger';
            s.energy = sum(word.^2);
            if s.energy > 0.03
                dbh.rec(1,j).ch1 = s.ch1;
                dbh.rec(1,j).energy = s.energy;
                filename = filename(index + word_length:end);
                j = j + 1;
            end
        else
            finished = 1;
        end
    end
    finished = 0;
    
end
dbh.name = 'höger';


% 
% % remove no. 6 8 17 30
% for i = 1:length(dbh)
%     temp = dbh(1,i).ch1;
%     plot(temp);
%     title(num2str(i));
%     soundsc(temp);
%     pause(1);   
% end

% soundsc(dbh(1,6).ch1);
% plot(dbh(1,6).ch1);
dbh.rec(6) = [];
% pause(1);
% soundsc(dbh(1,7).ch1);
% plot(dbh(1,7).ch1);
dbh.rec(7) = [];
% pause(1);
% soundsc(dbh(1,15).ch1);
% plot(dbh(1,15).ch1);
dbh.rec(15) = [];
% pause(1);
% soundsc(dbh(1,27).ch1);
% plot(dbh(1,27).ch1);
dbh.rec(27) = [];

for i = 1:length(dbh.rec)
    dbh.db(1,i).reflec = add_to_db_new(dbh.rec(1,i).ch1, BLOCK_LENGTH, OVERLAP, N_REFLEC, SUBSET_LENGTH, FS, GAMMA, THRESHOLD, 0);
end
save('DB\h.mat', 'dbh');

db = [dbv dbh];

save('DB\db.mat','db');


















