function error = matching(input, db, SUBSET_LENGTH, N_REFLEC)
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

load db


N_WORDS = size(db(1,1),2);
N_VERSIONS = size(db(1,2).db,2);
div1 = 1/(N_VERSIONS);
div2 = 1/(SUBSET_LENGTH);
min_error = 0;
temp_min_error;
result = [];
for i = 1:N_WORDS
    word_t = db(1,i);%.db(i);
    s.min_err = 0;
    s.mean_err = intmax;
    s.name = word_t.name;
    result = [result s];
    for j = 1:N_VERSIONS
        version_t = word_t.db(j).reflec;
        for k = 1:SUBSET_LENGTH
            block_t = version_t(:,k);
            input_block_t = input(:,k);
            for l = 1:N_REFLEC
                
            end
            
        end
        
    end
    
end

end










