function [W] = LS_opt(X,D,L);
%xx=[];
[XM,XN]=size(X);
Pxx=zeros(XM*L,XM*L);
Pdx=zeros(XM*L,1);

for n=L:XN
	x=X(:,n-L+1:n)';
	Pxx=Pxx+x(:)*x(:)'/XN;
    Pdx=Pdx+x(:)*D(n)/XN;
end

W1=Pxx\Pdx;

W=[];

for i=L:L:L*XM
W=[W;W1(i-L+1:i)'];
end

W=fliplr(W);

