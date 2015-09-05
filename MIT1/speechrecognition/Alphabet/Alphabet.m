clc;
close all;

% a b c d e f g h i j k l m n o p q r s t u v y z å ä ö 



%%% MP3 %%%


figure (1)

subplot(5,2,1)
[x, fs] = audioread('\alphabet_mp3\a.mp3');
plot(x, 'LineWidth', 1);
title('A', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,2)
[x, fs] = audioread('\alphabet_mp3\b.mp3');
plot(x, 'LineWidth', 1);
title('B', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,3)
[x, fs] = audioread('\alphabet_mp3\c.mp3');
plot(x, 'LineWidth', 1);
title('C', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,4)
[x, fs] = audioread('\alphabet_mp3\d.mp3');
plot(x, 'LineWidth', 1);
title('D', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,5)
[x, fs] = audioread('\alphabet_mp3\e.mp3');
plot(x, 'LineWidth', 1);
title('E', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,6)
[x, fs] = audioread('\alphabet_mp3\f.mp3');
plot(x, 'LineWidth', 1);
title('F', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

subplot(5,2,7)
[x, fs] = audioread('\alphabet_mp3\g.mp3');
plot(x, 'LineWidth', 1);
title('G', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,8)
[x, fs] = audioread('\alphabet_mp3\h.mp3');
plot(x, 'LineWidth', 1);
title('H', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,9)
[x, fs] = audioread('\alphabet_mp3\i.mp3');
plot(x, 'LineWidth', 1);
title('I', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,10)
[x, fs] = audioread('\alphabet_mp3\j.mp3');
plot(x, 'LineWidth', 1);
title('J', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


figure (2)

subplot(5,2,1)
[x, fs] = audioread('\alphabet_mp3\k.mp3');
plot(x, 'LineWidth', 1);
title('K', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,2)
[x, fs] = audioread('\alphabet_mp3\l.mp3');
plot(x, 'LineWidth', 1);
title('L', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,3)
[x, fs] = audioread('\alphabet_mp3\m.mp3');
plot(x, 'LineWidth', 1);
title('M', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,4)
[x, fs] = audioread('\alphabet_mp3\n.mp3');
plot(x, 'LineWidth', 1);
title('N', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,5)
[x, fs] = audioread('\alphabet_mp3\o.mp3');
plot(x, 'LineWidth', 1);
title('O', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,6)
[x, fs] = audioread('\alphabet_mp3\p.mp3');
plot(x, 'LineWidth', 1);
title('P', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,7)
[x, fs] = audioread('\alphabet_mp3\q.mp3');
plot(x, 'LineWidth', 1);
title('Q', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,8)
[x, fs] = audioread('\alphabet_mp3\r.mp3');
plot(x, 'LineWidth', 1);
title('R', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,9)
[x, fs] = audioread('\alphabet_mp3\s.mp3');
plot(x, 'LineWidth', 1);
title('S', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,10)
[x, fs] = audioread('\alphabet_mp3\t.mp3');
plot(x, 'LineWidth', 1);
title('T', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


figure (3)

subplot(5,2,1)
[x, fs] = audioread('\alphabet_mp3\u.mp3');
plot(x, 'LineWidth', 1);
title('U', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,2)
[x, fs] = audioread('\alphabet_mp3\v.mp3');
plot(x, 'LineWidth', 1);
title('V', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,3)
[x, fs] = audioread('\alphabet_mp3\y.mp3');
plot(x, 'LineWidth', 1);
title('Y', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,4)
[x, fs] = audioread('\alphabet_mp3\å.mp3');
plot(x, 'LineWidth', 1);
title('Å', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


subplot(5,2,5)
[x, fs] = audioread('\alphabet_mp3\ä.mp3');
plot(x, 'LineWidth', 1);
title('Ä', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

subplot(5,2,6)
[x, fs] = audioread('\alphabet_mp3\ö.mp3');
plot(x, 'LineWidth', 1);
title('Ö', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);






%%



clc;
close all;

% a b c d e f g h i j k l m n o p q r s t u v y z å ä ö 



%%% MP3 %%%


figure
[x, fs] = audioread('\alphabet_mp3\a.mp3');
plot(x, 'LineWidth', 1);
title('A', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\b.mp3');
plot(x, 'LineWidth', 1);
title('B', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\c.mp3');
plot(x, 'LineWidth', 1);
title('C', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\d.mp3');
plot(x, 'LineWidth', 1);
title('D', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\e.mp3');
plot(x, 'LineWidth', 1);
title('E', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\f.mp3');
plot(x, 'LineWidth', 1);
title('F', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


figure
[x, fs] = audioread('\alphabet_mp3\g.mp3');
plot(x, 'LineWidth', 1);
title('G', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\h.mp3');
plot(x, 'LineWidth', 1);
title('H', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\i.mp3');
plot(x, 'LineWidth', 1);
title('I', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\j.mp3');
plot(x, 'LineWidth', 1);
title('J', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


figure
[x, fs] = audioread('\alphabet_mp3\k.mp3');
plot(x, 'LineWidth', 1);
title('K', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\l.mp3');
plot(x, 'LineWidth', 1);
title('L', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\m.mp3');
plot(x, 'LineWidth', 1);
title('M', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\n.mp3');
plot(x, 'LineWidth', 1);
title('N', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\o.mp3');
plot(x, 'LineWidth', 1);
title('O', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\p.mp3');
plot(x, 'LineWidth', 1);
title('P', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\q.mp3');
plot(x, 'LineWidth', 1);
title('Q', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\r.mp3');
plot(x, 'LineWidth', 1);
title('R', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


figure
[x, fs] = audioread('\alphabet_mp3\s.mp3');
plot(x, 'LineWidth', 1);
title('S', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


figure
[x, fs] = audioread('\alphabet_mp3\t.mp3');
plot(x, 'LineWidth', 1);
title('T', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


figure
[x, fs] = audioread('\alphabet_mp3\u.mp3');
plot(x, 'LineWidth', 1);
title('U', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


figure
[x, fs] = audioread('\alphabet_mp3\v.mp3');
plot(x, 'LineWidth', 1);
title('V', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\x.mp3');
plot(x, 'LineWidth', 1);
title('X', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\y.mp3');
plot(x, 'LineWidth', 1);
title('Y', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


figure
[x, fs] = audioread('\alphabet_mp3\å.mp3');
plot(x, 'LineWidth', 1);
title('Å', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);


figure
[x, fs] = audioread('\alphabet_mp3\ä.mp3');
plot(x, 'LineWidth', 1);
title('Ä', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

figure
[x, fs] = audioread('\alphabet_mp3\ö.mp3');
plot(x, 'LineWidth', 1);
title('Ö', 'FontSize', 16);
axis([0 1.5*10^4 -1.1 1.1]);

