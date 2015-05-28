function [W] = LS_opt(X,D,L);
% X is the speech + noise signal
% D is the speech signal, desired signal
% L is number of filter coefficients 
%xx=[];
[XM,XN]=size(X); % XM i sth enumber of channels, XN is the length of each signal
Pxx=zeros(XM*L,XM*L);
Pdx=zeros(XM*L,1);

for n=L:XN
	x=X(:,n-L+1:n)';
	Pxx=Pxx+x(:)*x(:)'/XN;
    Pdx=Pdx+x(:)*D(n)/XN;
end

W1=Pxx\Pdx; % inverse of Pxx

W=[];

for i=L:L:L*XM
W=[W;W1(i-L+1:i)'];
end

W=fliplr(W); %  flips matrix in left/rigth direction
end

