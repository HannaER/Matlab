load tal_brus_signaler

sp=Xtd/max(max(abs(Xtd)));

n=Xbu(:,1:size(sp,2))/max(max(abs(Xbu(:,1:size(sp,2)))));

L=16; %Filter length

%%%%%%%%%%%%%%%%%%%%%%  LS  Beamformer %%%%%%%%%%%%%%%%%%%%%%%
[W1] = LS_opt(sp+n,[zeros(1,L/2) sp(3,1:end-L/2)],L);

[y_ls] = filt_beam((sp+n),W1); % Here we can filter any noise + speech sequence

soundsc(sp(3,:)+n(3,:),Fs)
soundsc(y_ls,Fs)

%wavwrite(0.80*[y_ls]/max(max(abs(y_ls))),Fs,'y_ls.wav')

figure,plot(sp(1,:)+n(1,:))
figure,plot(y_ls)