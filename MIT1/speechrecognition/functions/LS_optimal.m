function [W] = LS_opt(X,D,L)
% X is the speech + noise signal
% D is the speech signal, desired signal
% L is number of filter coefficients

[XM,XN]=size(X); % XM i sth enumber of channels, XN is the length of each signal
Pxx=zeros(XM*L,XM*L);
Pdx=zeros(XM*L,1);

for n=L:XN
    x=X(:,n-L+1:n)';
    Pxx=Pxx+x(:)*x(:)'/XN; % wiener-hopf R?
    Pdx=Pdx+x(:)*D(n)/XN; % wiener-hopf p?
end

W1=Pxx\Pdx; % inverse of Pxx w_opt = R^{-1}p --> wiener solution?

W=[];
% not sure what this does
for i=L:L:L*XM
    W=[W;W1(i-L+1:i)'];
end

W=fliplr(W); %  flips matrix in left/rigth direction. Why?
end

