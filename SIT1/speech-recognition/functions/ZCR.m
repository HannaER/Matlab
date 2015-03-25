function [output, bool] = ZCR(x)
%   zero crossing rate
%   Works for vector and matrix
%   the function is vectorize, very fast
%   if x is a Vector returns the zero crossing rate of the vector
%   Ex:  x = [1 2 -3 4 5 -6 -2 -6 2];
%        y = ZCR(x) -> y = 0.444
%   if x is a matrix returns a row vector with the zero crossing rate of
%   the columns values
%   By:
%   Jose Ricardo Zapata Gonzalez
%   Universidad Pontificia Bolivariana, Colombia
%   20-Jan-2010
bool = false;
y = sum(abs(diff(x>0)))/length(x)
if y < 0.1
    output = zeros(1, length(x));
    
end
if y >= 0.1
    output = x;
    bool = true;
end

end