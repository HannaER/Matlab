%% %%%%%%%% 4 meter %%%%%%%%%%%%%%
close all;
clc;
clear all;
rec4v = [];
rec4h = [];


%%%%%%%%%%%%% 4:VÄNSTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%
y4v1 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-090013\recording1.wav');
y4v2 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-090013\recording2.wav');
y4v3 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-090013\recording3.wav');
y4v4 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-090013\recording4.wav');
y4v5 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-090013\recording5.wav');

y4v6 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording1.wav');
y4v7 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording2.wav');
y4v8 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording3.wav');
y4v9 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording4.wav');
y4v10 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording5.wav');
y4v11 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording6.wav');
y4v12 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording7.wav');
y4v13 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording8.wav');
y4v14 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording9.wav');
y4v15 = audioread('\Recordings\test1\4meter\vänster\2015-05-12-085027\recording10.wav');


% 
% 
% finished = 0;
% N = 17;
% filename = 'y2v';
% word_length = 5000;
% for i = 1:N
%     filename = getfield(y2v, strcat('y2v', num2str(i)));
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
%             s.name = 'vänster';
%             s.energy = sum(word(:,1).^2) + sum(word(:,2).^2) +  sum(word(:,3).^2)+ sum(word(:,4).^2);
%             if s.energy > 0.1
%                 rec2v = [rec2v s];
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
% save('TEST_REC\2\v.mat', 'rec2v');
% 
% 
% % for i = 1:length(rec2v)
% %     temp = rec2v(1,i).ch1;
% %     plot(temp);
% %     title(num2str(i));
% %     pause(1);   
% % end
% 
% %%%%%%%%%%% 4:HÖGER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% y4h1 = audioread('\Recordings\test1\4meter\höger\2015-05-12-092021\recording1.wav');
% y4h2 = audioread('\Recordings\test1\4meter\höger\2015-05-12-092021\recording2.wav');
% y4h3 = audioread('\Recordings\test1\4meter\höger\2015-05-12-092021\recording3.wav');
% y4h4 = audioread('\Recordings\test1\4meter\höger\2015-05-12-092021\recording4.wav');
% y4h5 = audioread('\Recordings\test1\4meter\höger\2015-05-12-092021\recording5.wav');
% y4h6 = audioread('\Recordings\test1\4meter\höger\2015-05-12-092021\recording6.wav');
% 
% y4h7 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording1.wav');
% y4h8 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording2.wav');
% y4h9 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording3.wav');
% y4h10 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording4.wav');
% y4h11 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording5.wav');
% y4h12 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording6.wav');
% y4h13 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording7.wav');
% y4h14 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording8.wav');
% y4h15 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording9.wav');
% y4h16 = audioread('\Recordings\test1\4meter\höger\2015-05-12-090907\recording10.wav');
% 
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
% save('TEST_REC\2\h.mat', 'rec2h');


% for i = 1:length(rec2h)
%     temp = rec2h(1,i).ch1;
%     plot(temp);
%     title(num2str(i));
%     pause(1);   
% end









