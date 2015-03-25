function Frames = block_frame(input, L, D )
% Framing the signal into blocks with 160 samples each and perform a
% windowing on each block.
% Detailed explanation goes here
% L is the length of each buffer segment, D is the overlap
y = buffer(input, L, D);
window = hamming(L);
storlek = size(y);
for i=1:storlek(2)
    y(:, i) = window.*y(:,i);    
end

Frames = y;
end

