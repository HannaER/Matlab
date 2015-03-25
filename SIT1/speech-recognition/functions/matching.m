function error = matching(input, db)
% MATCHING = (input, db)
% This function calculates the matching error
% input and db are of equal size
% input is the featurevector matrix of the realtime signal
% db is the data base
s =  size(input);% s1 is the size of the input featurevector matrix
s = s(2);
error = 0;
for k = 1: s
    error = error +  norm(input(:, k) - db(:, k));
end
end


% function output = matching(input, db)
% 
% % input is the featurevector matrix of the realtime signal
%  s1 =  size(input)% s1 is the size of the input featurevector matrix
%  s1 = s1(2);
%  s2 = size(db)% s2 is the size of the data base for a word
%  s2 = s2(2);
% error = 0;
% for k = 1: s1
%     for s = 1: s2
%         if s < s2
%             temp1 = norm(input(:, k) - db(:, s));
%             temp2 = norm(input(:, k) - db(:, s+1));
%             if temp1 < temp2 % no transition
%                 error = error + temp1;
%                 break; % breaks inner loop
%             end
%         end
%         if s == s2
%             temp1 = norm(input(:, k) - db(:,s));
%             error = error + temp1;
%         end
%     end
%     
%     output = error;
% end
% end


% function output = matching(input, db)
% % input is the featurevector matrix of the realtime signal
% % s1 =  s1 is the size of the input featurevector matrix
% % s2 =  s2 is the size of the data base for a word
% error = 0;
% s = 1;
% for k = 1:s1
%     if s < s2
%         temp1 = norm(input(:, k) - db(:, s));
%         temp2 = norm(input(:, k) - db(:, s+1));
%         if temp1 < temp2
%             error = error  + temp1;
%         end
%         if temp1 >= temp2
%             s = s + 1;
%             error = error + temp2;
%         end
%     end
%     
%     if s == s2
%         temp1 = norm(input(:, k) - db(:, s));
%         error = error + temp1;        
%     end 
% end
% 


