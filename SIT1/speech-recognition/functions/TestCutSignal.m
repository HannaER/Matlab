L = 160;    % Block length
D = 80;     % Overlap
P = 8;      % Nbr of reflection coefficients
fs = 8000;  % Sampling frequency
Th = 0.1;  % Threshold
g = 0.98;

A = [2671, 1.092e+04, 1.941e+04, 2.687e+04, 3.453e+04];

load Library/H_long_V
figure(1); plot(rec);
HV1 = rec(A(1):A(2),:);
HV2 = rec(A(2):A(3),:);
HV3 = rec(A(3):A(4),:);
HV4 = rec(A(4):A(5),:);

add_to_db(HV1, 'Library/HV1', L, D, P, fs, Th, g, 1);
pause(3)
add_to_db(HV2, 'Library/HV2', L, D, P, fs, Th, g, 1);
pause(3)
add_to_db(HV3, 'Library/HV3', L, D, P, fs, Th, g, 1);
pause(3)
add_to_db(HV4, 'Library/HV4', L, D, P, fs, Th, g, 1);

load Library/HV1
HV1db = db;

load Library/HV2
HV2db = db;

load Library/HV3
HV3db = db;

load Library/HV4
HV4db = db;

   load Viktor_db/database/t1
   t1 = db;
 
   t = t1;

A1 = matching(t1, HV1db)
A2 = matching(t1, HV2db)
A3 = matching(t1, HV3db)
A4 = matching(t1, HV4db)

A5 = (A1+A2+A3+A4)/4

B2 = matching(HV2db, HV1db)
B3 = matching(HV2db, HV3db)
B4 = matching(HV2db, HV4db)

B5 = (B2+B3+B4)/3