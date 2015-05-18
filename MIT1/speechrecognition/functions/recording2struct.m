close all;
clear all;
clc;

%%%%%%%%%% 1 meter %%%%%%%%%%%%%%
rec1v = [];
rec1h = [];
%%%%%%%%%%%%% 1:VÄNSTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%
y1v1 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-140212\recording1.wav');
y1v1 = y1v1(1:164300,:);
y1v2 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-140212\recording2.wav');
[y1v2, ps] = removerows(y1v2, [133900:134300]);
y1v3 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-133722\recording1.wav');
y1v4 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-133722\recording2.wav');
y1v5 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-133722\recording3.wav');
y1v5 = y1v5(1:220000,:);
y1v6 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-133354\recording1.wav');
[y1v6, ps] = removerows(y1v6, [66000:71000]);
y1v7 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-133354\recording2.wav');
y1v8 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-133354\recording3.wav');
y1v8 = y1v8(1:188800,:);
y1v9 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-133354\recording4.wav');
y1v10 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-133354\recording5.wav');
y1v11 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording1.wav');
[y1v11, ps] = removerows(y1v11, [115900:118300 133400:134800]);
y1v12 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording2.wav');
y1v13 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording3.wav');
y1v13 = y1v13(1:216600,:);
[y1v13, ps] = removerows(y1v13, [162200:162600 ]);
y1v14 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording4.wav');
y1v15 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording5.wav');
[y1v15, ps] = removerows(y1v15, [190600:209200]);
y1v16 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording6.wav');
y1v17 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording7.wav');
y1v18 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording8.wav');
y1v19 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording9.wav');
y1v20 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording10.wav');
[y1v20, ps] = removerows(y1v20, [41030:41520]);



%%%%%%%%%%% 1:HÖGER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y1h1 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording1.wav');
y1h2 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording2.wav');
[y1h2, ps] = removerows(y1h2, [4660:6117 114800:115100]);
y1h3 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording3.wav');
y1h4 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording4.wav');
y1h5 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording5.wav');
y1h6 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording6.wav');
[y1h6, ps] = removerows(y1h6, [176100:177400 ]);
y1h7 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording7.wav');
y1h7 = y1h7(10010:end,:);
y1h8 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording8.wav');
y1h9 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording9.wav');
y1h10 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording10.wav');
y1h11 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording1.wav');
[y1h11, ps] = removerows(y1h11, [89730:89990 ]);
y1h12 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording2.wav');
y1h13 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording3.wav');
y1h14 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording4.wav');
y1h15 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording5.wav');
y1h16 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording6.wav');
y1h17 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording7.wav');
y1h17 = y1h17(1:195800,:);
y1h18 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording8.wav');
y1h18 = y1h18(1:228700,:);
y1h19 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording9.wav');
y1h20 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording10.wav');

finished = 1;
N = 20;
for i = 1:N
   while finished == 0 
       
   end
    
end
% 
% s.ch1 = y1v1(:,1);
% s.ch2 = y1v1(:,2);
% s.ch3 = y1v1(:,3);
% s.ch4 = y1v1(:,4);
% rec1v = [rec1v s];
% save('TEST_REC\1\v.mat', 'rec1v');













