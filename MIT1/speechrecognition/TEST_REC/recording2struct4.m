%% %%%%%%%% 4 meter %%%%%%%%%%%%%%
close all;
clc;
clear all;
rec4v = [];
rec4h = [];


%%%%%%%%%%%%% 4:VÄNSTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%
y4v1 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-090013\recording1.wav');
y4v.y4v1 = y4v1;
y4v2 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-090013\recording2.wav');
[y4v2, ps] = removerows(y4v2, [38240:102700 171600:240000]);
y4v.y4v2 = y4v2;
y4v3 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-090013\recording3.wav');
[y4v3, ps] = removerows(y4v3, [1:10730]);
y4v.y4v3 = y4v3;
y4v4 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-090013\recording4.wav');
[y4v4, ps] = removerows(y4v4, [22110:88620 125800:240000]);
y4v.y4v4 = y4v4;
y4v5 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-090013\recording5.wav');
[y4v5, ps] = removerows(y4v5, [1:4898 237700:240000]);
y4v.y4v5 = y4v5;
y4v6 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording1.wav');
[y4v6, ps] = removerows(y4v6, [1:10350 234900:240000]);
y4v.y4v6 = y4v6;
y4v7 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording2.wav');
y4v.y4v7 = y4v7;
y4v8 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording3.wav');
y4v.y4v8 = y4v8;
y4v9 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording4.wav');
y4v.y4v9 = y4v9;
y4v10 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording5.wav');
y4v.y4v10 = y4v10;
y4v11 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording6.wav');
[y4v11, ps] = removerows(y4v11, [1:8020 213400:240000]);
y4v.y4v11 = y4v11;
y4v12 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording7.wav');
y4v.y4v12 = y4v12;
y4v13 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording8.wav');
[y4v13, ps] = removerows(y4v13, [231800:240000]);
y4v.y4v13 = y4v13;
y4v14 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording9.wav');
y4v.y4v14 = y4v14;
y4v15 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording10.wav');
[y4v15, ps] = removerows(y4v15, [232900:240000]);
y4v.y4v15 = y4v15;
y4v16 = audioread('\Recordings\test1\4meter\vänster\2015-05-25-154838\recording1.wav');
y4v.y4v16 = y4v16;
y4v17 = audioread('\Recordings\test1\4meter\vänster\2015-05-25-154838\recording2.wav');
y4v.y4v17 = y4v17;



finished = 0;
N = 17;
filename = 'y4v';
word_length = 4999;
for i = 1:N
    filename = getfield(y4v, strcat('y4v', num2str(i)));
    while finished == 0
        index = vad(filename(:,2), 160, 8);
        if(length(filename(:,2)) > index + word_length) && index ~= 1
            word = filename(index:index + word_length,:);
            %plot(word(:,1));
            %pause(2);
            s.ch1 = word(:,1);
            s.ch2 = word(:,2);
            s.ch3 = word(:,3);
            s.ch4 = word(:,4);
            s.name = 'vänster';
            s.energy = sum(word(:,1).^2) + sum(word(:,2).^2) +  sum(word(:,3).^2)+ sum(word(:,4).^2);
            if s.energy > 0.1
                rec4v = [rec4v s];
                filename = filename(index + word_length:end,:);
            end
        else
            finished = 1;
        end
    end
    finished = 0;
    
end


for i = 1:length(rec4v)
    db1 = pow2db(var(rec4v(1,i).ch1));
    db2 = pow2db(var(rec4v(1,i).ch2));
    db3 = pow2db(var(rec4v(1,i).ch3));
    db4 = pow2db(var(rec4v(1,i).ch4));
    db_mean = mean([db1 db2 db3 db4]);
    diff1 = db_mean - db1;
    diff2 = db_mean - db2;
    diff3 = db_mean - db3;
    diff4 = db_mean - db4;
    
    rec4v(1,i).ch1 = decibel_inc_dec(rec4v(1,i).ch1, diff1);
    rec4v(1,i).ch2 = decibel_inc_dec(rec4v(1,i).ch2, diff2);
    rec4v(1,i).ch3 = decibel_inc_dec(rec4v(1,i).ch3, diff3);
    rec4v(1,i).ch4 = decibel_inc_dec(rec4v(1,i).ch4, diff4);
end


save('TEST_REC\4\v.mat', 'rec4v');

%remove no 54 68 106 197 218 
% for i = 1:length(rec4v)
%     temp = rec4v(1,i).ch1;
%     plot(temp);
%     title(num2str(i));
%     %soundsc(temp);
%     pause(1);   
% end
% soundsc(rec4v(1,54).ch1);
% plot(rec4v(1,54).ch1);
rec4v(54) = [];
% pause(1);
% soundsc(rec4v(1,67).ch1);
% plot(rec4v(1,67).ch1);
rec4v(67) = [];
% pause(1);
% soundsc(rec4v(1,104).ch1);
% plot(rec4v(1,104).ch1);
rec4v(104) = [];
% pause(1);
% soundsc(rec4v(1,194).ch1);
% plot(rec4v(1,194).ch1);
rec4v(194) = [];
% pause(1);
% soundsc(rec4v(1,214).ch1);
% plot(rec4v(1,214).ch1);
rec4v(214) = [];
% pause(1);
%%%%%%%%%%% 4:HÖGER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y4h1 = audioread('\Recordings\test1\4meter\höger\2015-05-12-092021\recording1.wav');
[y4h1, ps] = removerows(y4h1, [233400:240000]);
y4h.y4h1 = y4h1;
y4h2 = audioread('\Recordings\test1\4meter\höger\2015-05-12-092021\recording2.wav');
[y4h2, ps] = removerows(y4h2, [1:33420 45570:47550 67260:71560 77620:100300 120900:123200 134800:168800 197800:214400 236100:240000]);
y4h.y4h2 = y4h2;
y4h3 = audioread('\Recordings\test1\4meter\höger\2015-05-12-092021\recording3.wav');
[y4h3, ps] = removerows(y4h3, [26220:29150 37780:40950 52030:56710 116600:124100 129800:137400 145100:149700 158800:163800 171700:175400 185300:188400 214600:219900]);
y4h.y4h3 = y4h3;
y4h4 = audioread('\Recordings\test1\4meter\höger\2015-05-12-092021\recording4.wav');
[y4h4, ps] = removerows(y4h4, [1:6279 26560:31990 50830:56530 202000:203500 237400:240000]);
y4h.y4h4 = y4h4;
y4h5 = audioread('\Recordings\test1\4meter\höger\2015-05-12-092021\recording5.wav');
[y4h5, ps] = removerows(y4h5, [156600:159900 180300:194300 203000:207800]);
y4h.y4h5 = y4h5;
y4h6 = audioread('\Recordings\test1\4meter\höger\2015-05-12-092021\recording6.wav');
[y4h6, ps] = removerows(y4h6, [4922:8257 26800:33990 90950:98790 108100:112900 120900:124400 165000:167700 200400:204800]);
y4h.y4h6 = y4h6;
y4h7 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording1.wav');
[y4h7, ps] = removerows(y4h7, [116000:134800 141800:148500 184800:189400 198600:206700 217900:222800 233600:236600]);
y4h.y4h7 = y4h7;
y4h8 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording2.wav');
[y4h8, ps] = removerows(y4h8, [1:10990 24430:46440 116100:121100 129400:189200 214100:240000]);
y4h.y4h8 = y4h8;
y4h9 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording3.wav');
[y4h9, ps] = removerows(y4h9, [65270:73560 113500:117900 137800: 146600 154900:160200 169500:174300 214800:219700 232000:240000]);
y4h.y4h9 = y4h9;
y4h10 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording4.wav');
[y4h10, ps] = removerows(y4h10, [27920:31080 42770:46240 56910:61070 72990:75870 104300:106700 119300:126700 134100:143100 187900:190700 203300:207200 218500:227200]);
y4h.y4h10 = y4h10;
y4h11 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording5.wav');
[y4h11, ps] = removerows(y4h11, [1:4165 13050:17750 27910:33030 40890:47010 74520:78310 84230:91770 141200:167800 173900:181500 195400:198300]);
y4h.y4h11 = y4h11;
y4h12 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording6.wav');
[y4h12, ps] = removerows(y4h12, [1:8652 20460:65180 82860:195100 204800:210700 219300:230600 238700:240000]);
[y4h12, ps] = removerows(y4h12, [13790:20130 29350:32770 ]);
y4h.y4h12 = y4h12;
y4h13 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording7.wav');
[y4h13, ps] = removerows(y4h13, [1:9718 36840:56110 181800:197000 210000:215100 227400:230800 235900:240000]);
y4h.y4h13 = y4h13;
y4h14 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording8.wav');
[y4h14, ps] = removerows(y4h14, [1:7362 58720:63890 79990:83600 91260:96440 11050:11530 12330:13110 173600:177500 185400:194600 202600:240000]);
[y4h14, ps] = removerows(y4h14, [75710:77810 88690:91870 105100:107200]);
y4h.y4h14 = y4h14;
y4h15 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording9.wav');
[y4h15, ps] = removerows(y4h15, [234200:240000]);
y4h.y4h15 = y4h15;
y4h16 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording10.wav');
[y4h16, ps] = removerows(y4h16, [13340:16830 44990:48810 108900:114200]);
y4h.y4h16 = y4h16;
y4h17 = audioread('\Recordings\test1\4meter\höger\2015-05-25-155005\recording1.wav');
[y4h17, ps] = removerows(y4h17, [174600:178300 233600:114200]);
y4h.y4h17 = y4h17;
y4h18 = audioread('\Recordings\test1\4meter\höger\2015-05-25-155005\recording2.wav');
[y4h18, ps] = removerows(y4h18, [87410:151600 203300:114200]);
y4h.y4h18 = y4h18;





finished = 0;
N = 18;
filename = 'y4h';
word_length = 4999;
for i = 1:N
    filename = getfield(y4h, strcat('y4h', num2str(i)));
    while finished == 0
        index = vad(filename(:,2), 160, 7);
        if(length(filename(:,2)) > index + word_length) && index ~= 1
            word = filename(index:index + word_length,:);
            %plot(word(:,1));
            %pause(2);
            s.ch1 = word(:,1);
            s.ch2 = word(:,2);
            s.ch3 = word(:,3);
            s.ch4 = word(:,4);
            s.name = 'höger';
            s.energy = sum(word(:,1).^2) + sum(word(:,2).^2) +  sum(word(:,3).^2)+ sum(word(:,4).^2);
            if s.energy > 0.1
                rec4h = [rec4h s];
                filename = filename(index + word_length:end,:);
            end
        else
            finished = 1;
        end
    end
    finished = 0;
    
end


for i = 1:length(rec4h)
    db1 = pow2db(var(rec4h(1,i).ch1));
    db2 = pow2db(var(rec4h(1,i).ch2));
    db3 = pow2db(var(rec4h(1,i).ch3));
    db4 = pow2db(var(rec4h(1,i).ch4));
    db_mean = mean([db1 db2 db3 db4]);
    diff1 = db_mean - db1;
    diff2 = db_mean - db2;
    diff3 = db_mean - db3;
    diff4 = db_mean - db4;
    
    rec4h(1,i).ch1 = decibel_inc_dec(rec4h(1,i).ch1, diff1);
    rec4h(1,i).ch2 = decibel_inc_dec(rec4h(1,i).ch2, diff2);
    rec4h(1,i).ch3 = decibel_inc_dec(rec4h(1,i).ch3, diff3);
    rec4h(1,i).ch4 = decibel_inc_dec(rec4h(1,i).ch4, diff4);
end


save('TEST_REC\4\h.mat', 'rec4h');

% 
% for i = 1:length(rec4h)
%     temp = rec4h(1,i).ch1;
%     plot(temp);
%     title(num2str(i));
%     soundsc(temp);
%     pause(1);   
% end
% 168 210 att ta bort
% plot(rec4h(1,168).ch1)
% soundsc(rec4h(1,168).ch1);
rec4h(168) = [];
% plot(rec4h(1,209).ch1)
% soundsc(rec4h(1,209).ch1);
rec4h(209) = [];









