function [output, reason] = matching(input, db, current_word_name, SUBSET_LENGTH, N_REFLEC)
% MATCHING = (input, db)
% This function calculates the matching error
% input and db are of equal size
% input is the featurevector matrix of the realtime signal
% db is a string reference to the location of the data base
% current_word_name is the spoken word used as a refernce to the corectness
% of the algorithm which gives the answer yes or no
% output is the answer in yes or no match

load db

N_WORDS = size(db,2);
N_VERSIONS = size(db(1,2).db,2);
% THRESHOLD_MIN = N_REFLEC*0.037*N_VERSIONS;
THRESHOLD_MIN = N_REFLEC*0.05*N_VERSIONS*1.2;
THRESHOLD_RIGHT = THRESHOLD_MIN*1.2;
THRESHOLD_LEFT = THRESHOLD_MIN;
div1 = 1/(N_VERSIONS);
div2 = 1/(SUBSET_LENGTH);
min_error = 0;
temp_min_error = 0;
result = [];

for i = 1:N_WORDS
    word_t = db(1,i);
    s.min_err = intmax;
    s.mean_err = 0;
    s.name = word_t.name;
    result = [result s];    
    for j = 1:N_VERSIONS
        version_t = word_t.db(j).reflec;
        for k = 1:SUBSET_LENGTH
            block_t = version_t(:,k);
            input_block_t = input(:,k);
            for l = 1:N_REFLEC
                temp_min_error = input_block_t(l);
                min_error = min_error + abs(block_t(l) - temp_min_error);
            end
        end
        if min_error < result(i).min_err
            result(i).min_err = min_error;
        end
        result(i).mean_err = result(i).mean_err + min_error*div1;
        min_error = 0;
    end
end

%VALIDATION of the result struct vector
temp_min_error = intmax;
temp_mean_error = intmax;
name_min = '';
name_mean = '';
for i = 1:N_WORDS
   if temp_min_error > result(i).min_err
       temp_min_error = result(i).min_err;
       name_min = result(i).name;
   end
   if temp_mean_error > result(i).mean_err
      temp_mean_error = result(i).mean_err;
      name_mean = result(i).name;
   end
end
if temp_min_error < THRESHOLD_RIGHT
   if strcmp(name_min, current_word_name) == 1 && temp_min_error < THRESHOLD_MIN       
        output = 'yes';
        reason = current_word_name;
   elseif temp_min_error > THRESHOLD_MIN 
       output = 'no';
       reason = 'no match';
   elseif strcmp(name_min, current_word_name) == 0
       output = 'no';
       if strcmp(name_min, 'höger') == 1
           reason = 'höger';
       else
           reason = 'vänster';
       end
   end
else   
   output = 'no';
   reason = 'no match';
end
end










