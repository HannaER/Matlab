clc;
close all;

% a b c d e f g h i j k l m n o p q r s t u v y z å ä ö 



%%% MP3 %%%

set(0,'Defaultfigure('Name', 'a'); WindowStyle','docked')

figure('Name', 'a');  (1)

subplot(5,2,1)
[x, fs] = audioread('\alphabet_mp3\a.mp3');
plot(x, 'k', 'LineWidth',1);
title('A', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,2)
[x, fs] = audioread('\alphabet_mp3\b.mp3');
plot(x, 'k', 'LineWidth',1);
title('B', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,3)
[x, fs] = audioread('\alphabet_mp3\c.mp3');
plot(x, 'k', 'LineWidth',1);
title('C', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,4)
[x, fs] = audioread('\alphabet_mp3\d.mp3');
plot(x, 'k', 'LineWidth',1);
title('D', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,5)
[x, fs] = audioread('\alphabet_mp3\e.mp3');
plot(x, 'k', 'LineWidth',1);
title('E', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,6)
[x, fs] = audioread('\alphabet_mp3\f.mp3');
plot(x, 'k', 'LineWidth',1);
title('F', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

subplot(5,2,7)
[x, fs] = audioread('\alphabet_mp3\g.mp3');
plot(x, 'k', 'LineWidth',1);
title('G', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,8)
[x, fs] = audioread('\alphabet_mp3\h.mp3');
plot(x, 'k', 'LineWidth',1);
title('H', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,9)
[x, fs] = audioread('\alphabet_mp3\i.mp3');
plot(x, 'k', 'LineWidth',1);
title('I', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,10)
[x, fs] = audioread('\alphabet_mp3\j.mp3');
plot(x, 'k', 'LineWidth',1);
title('J', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


figure('Name', 'a');  (2)

subplot(5,2,1)
[x, fs] = audioread('\alphabet_mp3\k.mp3');
plot(x, 'k', 'LineWidth',1);
title('K', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,2)
[x, fs] = audioread('\alphabet_mp3\l.mp3');
plot(x, 'k', 'LineWidth',1);
title('L', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,3)
[x, fs] = audioread('\alphabet_mp3\m.mp3');
plot(x, 'k', 'LineWidth',1);
title('M', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,4)
[x, fs] = audioread('\alphabet_mp3\n.mp3');
plot(x, 'k', 'LineWidth',1);
title('N', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,5)
[x, fs] = audioread('\alphabet_mp3\o.mp3');
plot(x, 'k', 'LineWidth',1);
title('O', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,6)
[x, fs] = audioread('\alphabet_mp3\p.mp3');
plot(x, 'k', 'LineWidth',1);
title('P', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,7)
[x, fs] = audioread('\alphabet_mp3\q.mp3');
plot(x, 'k', 'LineWidth',1);
title('Q', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,8)
[x, fs] = audioread('\alphabet_mp3\r.mp3');
plot(x, 'k', 'LineWidth',1);
title('R', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,9)
[x, fs] = audioread('\alphabet_mp3\s.mp3');
plot(x, 'k', 'LineWidth',1);
title('S', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,10)
[x, fs] = audioread('\alphabet_mp3\t.mp3');
plot(x, 'k', 'LineWidth',1);
title('T', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


figure('Name', 'a');  (3)

subplot(5,2,1)
[x, fs] = audioread('\alphabet_mp3\u.mp3');
plot(x, 'k', 'LineWidth',1);
title('U', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,2)
[x, fs] = audioread('\alphabet_mp3\v.mp3');
plot(x, 'k', 'LineWidth',1);
title('V', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,3)
[x, fs] = audioread('\alphabet_mp3\y.mp3');
plot(x, 'k', 'LineWidth',1);
title('Y', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,4)
[x, fs] = audioread('\alphabet_mp3\å.mp3');
plot(x, 'k', 'LineWidth',1);
title('Å', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


subplot(5,2,5)
[x, fs] = audioread('\alphabet_mp3\ä.mp3');
plot(x, 'k', 'LineWidth',1);
title('Ä', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

subplot(5,2,6)
[x, fs] = audioread('\alphabet_mp3\ö.mp3');
plot(x, 'k', 'LineWidth',1);
title('Ö', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 






%%



clc;
clear all;
close all;

% a b c d e f g h i j k l m n o p q r s t u v y z å ä ö 



%%% MP3 %%%

set(0,'DefaultFigureWindowStyle','docked')


figure('Name', 'a');
[x, fs] = audioread('\alphabet_mp3\a.mp3');
plot(x, 'k', 'LineWidth',1);
title('A', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'b');
[x, fs] = audioread('\alphabet_mp3\b.mp3');
plot(x, 'k', 'LineWidth',1);
title('B', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'c'); 
[x, fs] = audioread('\alphabet_mp3\c.mp3');
plot(x, 'k', 'LineWidth',1);
title('C', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'd'); 
[x, fs] = audioread('\alphabet_mp3\d.mp3');
plot(x, 'k', 'LineWidth',1);
title('D', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'e'); 
[x, fs] = audioread('\alphabet_mp3\e.mp3');
plot(x, 'k', 'LineWidth',1);
title('E', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'f'); 
[x, fs] = audioread('\alphabet_mp3\f.mp3');
plot(x, 'k', 'LineWidth',1);
title('F', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


figure('Name', 'g'); 
[x, fs] = audioread('\alphabet_mp3\g.mp3');
plot(x, 'k', 'LineWidth',1);
title('G', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'h'); 
[x, fs] = audioread('\alphabet_mp3\h.mp3');
plot(x, 'k', 'LineWidth',1);
title('H', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'i'); 
[x, fs] = audioread('\alphabet_mp3\i.mp3');
plot(x, 'k', 'LineWidth',1);
title('I', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'j'); 
[x, fs] = audioread('\alphabet_mp3\j.mp3');
plot(x, 'k', 'LineWidth',1);
title('J', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


figure('Name', 'k'); 
[x, fs] = audioread('\alphabet_mp3\k.mp3');
plot(x, 'k', 'LineWidth',1);
title('K', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'l'); 
[x, fs] = audioread('\alphabet_mp3\l.mp3');
plot(x, 'k', 'LineWidth',1);
title('L', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'm'); 
[x, fs] = audioread('\alphabet_mp3\m.mp3');
plot(x, 'k', 'LineWidth',1);
title('M', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'n'); 
[x, fs] = audioread('\alphabet_mp3\n.mp3');
plot(x, 'k', 'LineWidth',1);
title('N', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'o'); 
[x, fs] = audioread('\alphabet_mp3\o.mp3');
plot(x, 'k', 'LineWidth',1);
title('O', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'p'); 
[x, fs] = audioread('\alphabet_mp3\p.mp3');
plot(x, 'k', 'LineWidth',1);
title('P', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'q'); 
[x, fs] = audioread('\alphabet_mp3\q.mp3');
plot(x, 'k', 'LineWidth',1);
title('Q', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'r'); 
[x, fs] = audioread('\alphabet_mp3\r.mp3');
plot(x, 'k', 'LineWidth',1);
title('R', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


figure('Name', 's'); 
[x, fs] = audioread('\alphabet_mp3\s.mp3');
plot(x, 'k', 'LineWidth',1);
title('S', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


figure('Name', 't'); 
[x, fs] = audioread('\alphabet_mp3\t.mp3');
plot(x, 'k', 'LineWidth',1);
title('T', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


figure('Name', 'u'); 
[x, fs] = audioread('\alphabet_mp3\u.mp3');
plot(x, 'k', 'LineWidth',1);
title('U', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


figure('Name', 'v'); 
[x, fs] = audioread('\alphabet_mp3\v.mp3');
plot(x, 'k', 'LineWidth',1);
title('V', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'x'); 
[x, fs] = audioread('\alphabet_mp3\x.mp3');
plot(x, 'k', 'LineWidth',1);
title('X', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'y'); 
[x, fs] = audioread('\alphabet_mp3\y.mp3');
plot(x, 'k', 'LineWidth',1);
title('Y', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


figure('Name', 'å'); 
[x, fs] = audioread('\alphabet_mp3\å.mp3');
plot(x, 'k', 'LineWidth',1);
title('Å', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 


figure('Name', 'ä'); 
[x, fs] = audioread('\alphabet_mp3\ä.mp3');
plot(x, 'k', 'LineWidth',1);
title('Ä', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

figure('Name', 'ö'); 
[x, fs] = audioread('\alphabet_mp3\ö.mp3');
plot(x, 'k', 'LineWidth',1);
title('Ö', 'FontSize', 18);
axis([0 1.5*10^4 -1.1 1.1]);set(gca, 'fontsize', 12); 

