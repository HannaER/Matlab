function error = matching(input, db)
% MATCHING = (input, db)
% This function calculates the matching error
% input and db are of equal size
% input is the featurevector matrix of the realtime signal
% db is a string reference to the location of the data base
% s =  size(input);% s1 is the size of the input featurevector matrix
% s = s(2);
% error = 0;
% for k = 1: s
%     error = error +  norm(input(:, k) - db(:, k));
% end

display('test matching:');
load db

db_total(1,2).name


N_WORDS = size(db_total(1,1),2);

end










