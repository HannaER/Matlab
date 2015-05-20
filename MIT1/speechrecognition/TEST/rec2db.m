%%%%%%%%%% 2 meter %%%%%%%%%%%%%%
close all;
clc;
clear all;
dbv = [];
dbh = [];


%%%%%%%%%%%%% 2:VÄNSTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%
v1 = audioread('\Recordings\db\vänster\2015-05-11-111219\recording1.wav');
[v1, ps] = removerows(v1, [188800:240000]);
v.v1 = v1;
v2 = audioread('\Recordings\db\vänster\2015-05-11-111219\recording2.wav');
v3 = audioread('\Recordings\db\vänster\2015-05-11-111219\recording3.wav');
[v3, ps] = removerows(v3, [72260:75300]);
v.v3 = v3;


finished = 0;
N = 3;
filename = 'v';
word_length = 5000;
for i = 1:N
    filename = getfield(v, strcat('v', num2str(i)));
    while finished == 0
        index = vad(filename(:,2), 160, 8);
        if(length(filename(:,2)) > index + word_length) && index ~= 1
            word = filename(index:index + word_length,:);
            %plot(word(:,1));
            %pause(2);
            s.ch1 = word;
            s.name = 'vänster';
            s.energy = sum(word.^2);
            if s.energy > 0.1
                dbv = [dbv s];
                filename = filename(index + word_length:end,:);
            end
        else
            finished = 1;
        end
    end
    finished = 0;
    
end

save('TEST\v.mat', 'dbv');


% for i = 1:length(dbv)
%     temp = dbv(1,i).ch1;
%     plot(temp);
%     title(num2str(i));
%     soundsc(temp);
%     pause(1);   
% end

%%%%%%%%%%% 2:HÖGER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h1 = audioread('\Recordings\db\höger\2015-05-11-125242\recording1.wav');
h2 = audioread('\Recordings\db\höger\2015-05-11-125242\recording2.wav');
h3 = audioread('\Recordings\db\höger\2015-05-11-125242\recording3.wav');





% finished = 0;
% N = 16;
% filename = 'y2h';
% word_length = 5000;
% for i = 1:N
%     filename = getfield(y2h, strcat('y2h', num2str(i)));
%     while finished == 0
%         index = vad(filename(:,2), 160, 8);
%         if(length(filename(:,2)) > index + word_length) && index ~= 1
%             word = filename(index:index + word_length,:);
%             %plot(word(:,1));
%             %pause(2);
%             s.ch1 = word(:,1);
%             s.ch2 = word(:,2);
%             s.ch3 = word(:,3);
%             s.ch4 = word(:,4);
%             s.name = 'höger';
%             s.energy = sum(word(:,1).^2) + sum(word(:,2).^2) +  sum(word(:,3).^2)+ sum(word(:,4).^2);
%             if s.energy > 0.1
%                 rec2h = [rec2h s];
%                 filename = filename(index + word_length:end,:);
%             end
%         else
%             finished = 1;
%         end
%     end
%     finished = 0;
%     
% end
% 
% save('TEST\h.mat', 'dbh');


% for i = 1:length(rec2h)
%     temp = rec2h(1,i).ch1;
%     plot(temp);
%     title(num2str(i));
%     soundsc(temp);
%     pause(1);   
% end









