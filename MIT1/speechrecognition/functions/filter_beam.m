function [Y] = filter_beam(X,W0)
Y=zeros(1,size(X,2));

for i=1:size(W0,1)
    Y=Y+filter(W0(i,:),1,X(i,:));
end
end
