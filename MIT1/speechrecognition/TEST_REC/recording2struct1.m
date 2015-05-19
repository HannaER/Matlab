close all;
clear all;
clc;

%%%%%%%%% 1 meter %%%%%%%%%%%%%%
rec1v = [];
rec1h = [];


%%%%%%%%%%%%% 1:VÄNSTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%

y1v.y1v1 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-133722\recording1.wav');
y1v.y1v2 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-133722\recording2.wav');
y1v3 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-133722\recording3.wav');
y1v.y1v3 = y1v3(1:220000,:);
y1v4 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-133354\recording1.wav');
[y1v.y1v4, ps] = removerows(y1v4, [66000:71000]);
y1v.y1v5 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-133354\recording2.wav');
y1v6 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-133354\recording3.wav');
y1v.y1v6 = y1v6(1:188800,:);
y1v.y1v7 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-133354\recording4.wav');
y1v.y1v8 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-133354\recording5.wav');
y1v9 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording1.wav');
[y1v.y1v9, ps] = removerows(y1v9, [115900:118300 133400:134800]);
y1v.y1v10 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording2.wav');
y1v11 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording3.wav');
y1v11 = y1v11(1:216600,:);
[y1v.y1v11, ps] = removerows(y1v11, [162200:162600 ]);
y1v.y1v12 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording4.wav');
y1v13 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording5.wav');
[y1v.y1v13, ps] = removerows(y1v13, [190600:209200]);
y1v.y1v14 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording6.wav');
y1v.y1v15 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording7.wav');
y1v.y1v16 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording8.wav');
y1v.y1v17 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording9.wav');
y1v18 = audioread('\Recordings\test1\1meter\vänster\2015-05-11-132656\recording10.wav');
[y1v.y1v18, ps] = removerows(y1v18, [41030:41520]);

finished = 0;
N = 18;
filename = 'y1v';
word_length = 5000;
for i = 1:N
    filename = getfield(y1v, strcat('y1v', num2str(i)));
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
                rec1v = [rec1v s];
                filename = filename(index + word_length:end,:);
            end
        else
            finished = 1;
        end
    end
    finished = 0;
    
end

save('TEST_REC\1\v.mat', 'rec1v');

for i = 1:length(rec1v)
    temp = rec1v(1,i).ch1;
    plot(temp);
    title(num2str(i));
    soundsc(temp);
    pause(1);   
end

%%%%%%%%%%% 1:HÖGER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y1h.y1h1 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording1.wav');
y1h2 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording2.wav');
[y1h.y1h2, ps] = removerows(y1h2, [4660:6117 114800:115100]);
y1h.y1h3 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording3.wav');
y1h.y1h4 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording4.wav');
y1h.y1h5 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording5.wav');
y1h6 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording6.wav');
[y1h.y1h6, ps] = removerows(y1h6, [176100:177400 ]);
y1h7 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording7.wav');
y1h.y1h7 = y1h7(10010:end,:);
y1h.y1h8 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording8.wav');
y1h.y1h9 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording9.wav');
y1h.y1h10 = audioread('\Recordings\test1\1meter\höger\2015-05-11-141101\recording10.wav');
y1h11 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording1.wav');
[y1h.y1h11, ps] = removerows(y1h11, [89730:89990 ]);
y1h.y1h12 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording2.wav');
y1h.y1h13 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording3.wav');
y1h.y1h14 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording4.wav');
y1h.y1h15 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording5.wav');
y1h.y1h16 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording6.wav');
y1h17 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording7.wav');
y1h.y1h17 = y1h17(1:195800,:);
y1h18 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording8.wav');
y1h.y1h18 = y1h18(1:228700,:);
y1h.y1h19 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording9.wav');
y1h.y1h20 = audioread('\Recordings\test1\1meter\höger\2015-05-11-140357\recording10.wav');

finished = 0;
N = 20;
filename = 'y1h';
word_length = 5000;
for i = 1:N
    filename = getfield(y1h, strcat('y1h', num2str(i)));
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
                rec1h = [rec1h s];
                filename = filename(index + word_length:end,:);
            end
        else
            finished = 1;
        end
    end
    finished = 0;
    
end

save('TEST_REC\1\h.mat', 'rec1h');


for i = 1:length(rec1h)
    temp = rec1h(1,i).ch1;
    plot(temp);
    title(num2str(i));
    soundsc(temp);
    pause(1);   
end






