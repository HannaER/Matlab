%%%%%%%%%% 2 meter %%%%%%%%%%%%%%
close all;
clc;
clear all;
rec2v = [];
rec2h = [];


%%%%%%%%%%%%% 2:VÄNSTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%
y2v1 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-144628\recording1.wav');
y2v.y2v1 = y2v1;
y2v2 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-144243\recording1.wav');
y2v2 = y2v2(1:195600,:);
y2v.y2v2 = y2v2;
y2v3 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-144243\recording2.wav');
y2v.y2v3 = y2v3;
y2v4 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-144243\recording3.wav');
y2v.y2v4 = y2v4;
y2v5 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-144243\recording4.wav');
y2v5 = y2v5(4063:end,:);
y2v5 = y2v5(1:65140,:);
y2v.y2v5 = y2v5;
y2v6 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-144243\recording5.wav');
y2v.y2v6 = y2v6;
y2v7 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-144243\recording6.wav');
[y2v7, ps] = removerows(y2v7, [33040:155900]);
[y2v7, ps] = removerows(y2v7, [69030:117139]);
y2v.y2v7 = y2v7;
y2v8 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-143646\recording1.wav');
[y2v8, ps] = removerows(y2v8, [211400:228500]);
y2v.y2v8 = y2v8;
y2v9 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-143646\recording2.wav');
y2v9 = y2v9(6076:192700,:);
[y2v9, ps] = removerows(y2v9, [21130:55880 105000:152000]);
y2v.y2v9 = y2v9;
y2v10 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-143646\recording3.wav');
[y2v10, ps] = removerows(y2v10, [50300:66320 133500:152000 191100:194700 213800:240000]);
y2v.y2v10 = y2v10;
y2v11 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-143646\recording4.wav');
y2v11 = y2v11(1:196200,:);
y2v.y2v11 = y2v11;
y2v12 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-143646\recording5.wav');
[y2v12, ps] = removerows(y2v12, [99170:117400 155500:159900 190000:202500]);
y2v.y2v12 = y2v12;
y2v13 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-143646\recording6.wav');
y2v13 = y2v13(1:204000,:);
y2v.y2v13 = y2v13;
y2v14 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-143646\recording7.wav');
[y2v14, ps] = removerows(y2v14, [120700:137100 189900:240000]);
y2v.y2v14 = y2v14;
y2v15 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-143646\recording8.wav');
y2v.y2v15 = y2v15;
y2v16 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-143646\recording9.wav');
[y2v16, ps] = removerows(y2v16, [80380:98000 108800:109900 171200:175700 210200:240000]);
y2v.y2v16 = y2v16;
y2v17 = audioread('\Recordings\test1\2meter\vänster\2015-05-11-143646\recording10.wav');
[y2v17, ps] = removerows(y2v17, [1:19330 222300:240000]);
y2v.y2v17 = y2v17;


y2v18 = audioread('\Recordings\test1\2meter\vänster\2015-05-20-131203\recording1.wav');
y2v19 = audioread('\Recordings\test1\2meter\vänster\2015-05-20-131203\recording2.wav');
y2v20 = audioread('\Recordings\test1\2meter\vänster\2015-05-20-131203\recording3.wav');
y2v21 = audioread('\Recordings\test1\2meter\vänster\2015-05-20-131203\recording4.wav');
y2v22 = audioread('\Recordings\test1\2meter\vänster\2015-05-20-131203\recording5.wav');



finished = 0;
N = 17;
filename = 'y2v';
word_length = 5000;
for i = 1:N
    filename = getfield(y2v, strcat('y2v', num2str(i)));
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
                rec2v = [rec2v s];
                filename = filename(index + word_length:end,:);
            end
        else
            finished = 1;
        end
    end
    finished = 0;
    
end

save('TEST_REC\2\v.mat', 'rec2v');


% for i = 1:length(rec2v)
%     temp = rec2v(1,i).ch1;
%     plot(temp);
%     title(num2str(i));
%     soundsc(temp);
%     pause(1);   
% end

%%%%%%%%%%% 2:HÖGER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y2h1 = audioread('\Recordings\test1\2meter\höger\2015-05-11-151615\recording1.wav');
[y2h1, ps] = removerows(y2h1, [168800:240000]);
y2h.y2h1 = y2h1;
y2h2 = audioread('\Recordings\test1\2meter\höger\2015-05-11-151615\recording2.wav');
y2h.y2h2 = y2h2;
y2h3 = audioread('\Recordings\test1\2meter\höger\2015-05-11-151615\recording3.wav');
[y2h3, ps] = removerows(y2h3, [175900:240000]);
y2h.y2h3 = y2h3;
y2h4 = audioread('\Recordings\test1\2meter\höger\2015-05-11-151615\recording4.wav');
[y2h4, ps] = removerows(y2h4, [51230:55070 76890:80090]);
[y2h4, ps] = removerows(y2h4, [147200:150200 160700:162100 173000:174900 209000:219100]);
y2h.y2h4 = y2h4;
y2h5 = audioread('\Recordings\test1\2meter\höger\2015-05-11-151615\recording5.wav');
[y2h5, ps] = removerows(y2h5, [170000:240000]);
y2h.y2h5 = y2h5;
y2h6 = audioread('\Recordings\test1\2meter\höger\2015-05-11-151615\recording6.wav');
[y2h6, ps] = removerows(y2h6, [157500:158200 164300:164800]);
y2h.y2h6 = y2h6;
y2h7 = audioread('\Recordings\test1\2meter\höger\2015-05-11-151026\recording1.wav');
[y2h7, ps] = removerows(y2h7, [1:11420 24360:26040 51600:58690 38470:43910 80360:87210 93250:100700 113300:116100 137800:169300]);
[y2h7, ps] = removerows(y2h7, [39480:41380 119000:121000 144700:148400]);
y2h.y2h7 = y2h7;
y2h8 = audioread('\Recordings\test1\2meter\höger\2015-05-11-151026\recording2.wav');
[y2h8, ps] = removerows(y2h8, [1:7934 73870:76500 201800:240000]);
[y2h8, ps] = removerows(y2h8, [14570:16030 25130:29780]);
y2h.y2h8 = y2h8;
y2h9 = audioread('\Recordings\test1\2meter\höger\2015-05-11-151026\recording3.wav');
[y2h9, ps] = removerows(y2h9, [236100:240000]);
y2h.y2h9 = y2h9;
y2h10 = audioread('\Recordings\test1\2meter\höger\2015-05-11-151026\recording4.wav');
[y2h10, ps] = removerows(y2h10, [14920:15710 39900:40720 46860:49720 65100:65710 88050:88500 141300:142800 166700:172800 180300:240000]);
y2h.y2h10 = y2h10;
y2h11 = audioread('\Recordings\test1\2meter\höger\2015-05-11-151026\recording5.wav');
y2h.y2h11 = y2h11;
y2h12 = audioread('\Recordings\test1\2meter\höger\2015-05-11-151026\recording6.wav');
[y2h12, ps] = removerows(y2h12, [207600:240000]);
y2h.y2h12 = y2h12;
y2h13 = audioread('\Recordings\test1\2meter\höger\2015-05-11-151026\recording7.wav');
[y2h13, ps] = removerows(y2h13, [189600:240000]);
y2h.y2h13 = y2h13;
y2h14 = audioread('\Recordings\test1\2meter\höger\2015-05-11-151026\recording8.wav');
y2h.y2h14 = y2h14;
y2h15 = audioread('\Recordings\test1\2meter\höger\2015-05-11-151026\recording9.wav');
[y2h15, ps] = removerows(y2h15, [157900:240000]);
y2h.y2h15 = y2h15;
y2h16 = audioread('\Recordings\test1\2meter\höger\2015-05-11-151026\recording10.wav');
[y2h16, ps] = removerows(y2h16, [65340:70760 208400:210500 232900:240000]);
y2h.y2h16 = y2h16;


finished = 0;
N = 16;
filename = 'y2h';
word_length = 5000;
for i = 1:N
    filename = getfield(y2h, strcat('y2h', num2str(i)));
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
            s.name = 'höger';
            s.energy = sum(word(:,1).^2) + sum(word(:,2).^2) +  sum(word(:,3).^2)+ sum(word(:,4).^2);
            if s.energy > 0.1
                rec2h = [rec2h s];
                filename = filename(index + word_length:end,:);
            end
        else
            finished = 1;
        end
    end
    finished = 0;
    
end

save('TEST_REC\2\h.mat', 'rec2h');


% for i = 1:length(rec2h)
%     temp = rec2h(1,i).ch1;
%     plot(temp);
%     title(num2str(i));
%     soundsc(temp);
%     pause(1);   
% end









