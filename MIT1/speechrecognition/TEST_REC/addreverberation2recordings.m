clc;
close all;
clear all;




load TEST_REC/1/v.mat % rec1v
load TEST_REC/1/h.mat % rec1h

load TEST_REC/2/v.mat % rec2v
load TEST_REC/2/h.mat % rec2h

load TEST_REC/4/v.mat % rec4v
load TEST_REC/4/h.mat % rec4h



rec1vr = [];
rec1hr = [];
rec2vr = [];
rec2hr = [];
rec4vr = [];
rec4hr = [];


for i = [1 2 4]%The distances 1,2 and 4 meters
    distance = i;
    x = 4;
    y = 6;
    z = 3;
    mx = 3;
    my = 1;
    mz = 1;
    sx = mx;
    sy = my + distance;
    sz = mz;

    
    N_taps = 1500;
    N_images = 10;% M [1x1] - real valed and positive integer scalar that corresponds to the number of images in all directions taken. I.e. total number of images is M^3 8.
    Fs = 16000;
    
    RC = 0.5; % room absorption coefficient, satisfying 0<RC<1.
    Rsource = [sx sy sz]'; % xyz
    Rmic = [mx my mz]';
    Lroom = [x y z]';
    [Hdirect, Hreverb] = IRFEstimationIM(Rsource, Rmic, Lroom, N_taps, Fs, RC, N_images);
    
    M = length(eval(['rec' num2str(i) 'v']));
    for j = 1:M %Number of 'vänster'
        ch1 = eval(['rec' num2str(i) 'v(j).ch1']);
        ch2 = eval(['rec' num2str(i) 'v(j).ch2']);
        ch3 = eval(['rec' num2str(i) 'v(j).ch3']);
        ch4 = eval(['rec' num2str(i) 'v(j).ch4']);
        
        s.ch1 = filter(Hdirect, 1, ch1) + filter(Hreverb, 1, ch1);
        s.ch2 = filter(Hdirect, 1, ch2) + filter(Hreverb, 1, ch2);
        s.ch3 = filter(Hdirect, 1, ch3) + filter(Hreverb, 1, ch3);
        s.ch4 = filter(Hdirect, 1, ch4) + filter(Hreverb, 1, ch4);
        s.name = 'vänster';
        eval(['rec' num2str(i) 'vr = [rec' num2str(i) 'vr s];']);
    end
    M = length(eval(['rec' num2str(i) 'h']));
    for j = 1:M %Number of 'höger'
        ch1 = eval(['rec' num2str(i) 'h(j).ch1']);
        ch2 = eval(['rec' num2str(i) 'h(j).ch2']);
        ch3 = eval(['rec' num2str(i) 'h(j).ch3']);
        ch4 = eval(['rec' num2str(i) 'h(j).ch4']);
        
        s.ch1 = filter(Hdirect, 1, ch1) + filter(Hreverb, 1, ch1);
        s.ch2 = filter(Hdirect, 1, ch2) + filter(Hreverb, 1, ch2);
        s.ch3 = filter(Hdirect, 1, ch3) + filter(Hreverb, 1, ch3);
        s.ch4 = filter(Hdirect, 1, ch4) + filter(Hreverb, 1, ch4);
        s.name = 'höger';
        eval(['rec' num2str(i) 'hr = [rec' num2str(i) 'hr s];']);
    end
end



save('TEST_REC\r1\v.mat', 'rec1vr');
save('TEST_REC\r1\h.mat', 'rec1hr');
save('TEST_REC\r2\v.mat', 'rec2vr');
save('TEST_REC\r2\h.mat', 'rec2hr');
save('TEST_REC\r4\v.mat', 'rec4vr');
save('TEST_REC\r4\h.mat', 'rec4hr');



% for i = 1:5
%    soundsc(rec1vr(i).ch1)
%    pause(1)
%    soundsc(rec1hr(i).ch1)
%    pause(1)
%    soundsc(rec2vr(i).ch1)
%    pause(1)
%    soundsc(rec2hr(i).ch1)
%    pause(1)
%    soundsc(rec4vr(i).ch1)
%    pause(1)
%    soundsc(rec4hr(i).ch1)
%    pause(1)
% end


