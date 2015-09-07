% 
% m0 = 2;
% m1 = 4;
% m2 = 8;
% m = [m0 m1 m2];
% 
% d0 = 0.04;
% d1 = 0.08;
% d2 = 0.12;
% d3 = 0.16;
% d4 = 0.2;
% d5 = 0.4;
% d6 = 0.6;
% d = [d0 d1 d2 d3 d4 d5 d6];
% 
% f0 = 1000;
% f1 = 2000;
% f2 = 3000;
% f3 = 4000;
% f4 = 5000;
% f6 = 6000;
% f7 = 7000;
% f8 = 8000;
% f9 = 9000;
% f = [f0 f1 f2 f3 f4 f5 f6 f7 f8 f9];



%N = 100;
%P(w, phi, theta) = |w^H d(w, phi, theta)|
%d(w, phi, theta) = [e^{-iwtau_1} e^{-iwtau_2} ... e^{-iwtau_N}]^T
%tau_n = (m_n * k^(phi, theta))/c
%k^(phi, theta) = [sin(theta)cos(phi) sin(theta)sin(phi) cos(theta)]^T



%%
clc;
close all;
clear all;

%function G = beampattern(H, d, Fs, F, A)
load 'Beampattern/W.mat';
%H = W1;
%H = [08862 1.535 0 0;0.3939 0.6822 0.8807 0; 0.2216 0.3837 0.4954 0.5862];
%H = [-1 1 -1 0 -1; -1 1 1 1 1 ;-1 1 0 -1 -1 ;-1 1 -1 1 -1  ];
%H = [-1 -1 0.5 0.9; -0.9 -0.5 -1 1; 1 -1 -0.5 -0.9; 0.9 0.5 -1 -1];
%H = [-1 -0.5 0 0.5 1 1 1 0 -0.5 -1 1 1 ; -1 -0.5 0 0.5 1 1 0.5 0 -0.5 -1 1 1; ];
%H = [-1, 1 ,1 ,-1; -1, 1 ,1 ,-1; -1, 1 ,1 ,-1; -1, 1 ,1 ,-1];
H = [1,1,1,1];
d = 0.04;
Fs = 8000;
F = 0:4000;%(0:200)/201 * Fs/2; % evaluate at 201 frequencies from 0 to Fs/2
A = (-90:1:90);
G = beampattern(H, d, Fs, F, A);

%%% 2-D plot for narrowband picture %%%

figure
frek = 4000;
B = beampattern(H, d, Fs, frek, A);
plot(A, B);
xlabel('Angle \phi [deg]','FontSize', 16);
ylabel('Gain P(\omega, \phi, \theta)','FontSize', 16);
set(gca, 'fontsize', 12);




%%%% 3-D plot for wideband picture %%%

figure
surf(G, 'EdgeColor', 'k', 'MeshStyle', 'column');
%imagesc(A, F, G);
axis('xy');
xlabel('Angle \phi  [deg]','FontSize', 16);
ylabel('Frequency [Hz]','FontSize', 16);
zlabel('Gain P(\omega, \phi, \theta)','FontSize', 16);
colorbar;
set(gca, 'fontsize', 12);
 














