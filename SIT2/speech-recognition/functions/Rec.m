function rec  = Rec(filename, rec_length, device_ID)
    % Record audio in 8kHz and save to file. 
    % 
    %   filename - store file with this name
    %   rec_length - length och record in seconds
    %   device_ID - use -1 for default device
    
    %v?nster
    %h?ger
    %fram?t
    %backa
    %?ka
    %s?nk
    %right
    %left
    
    Fs = 8000; %sample rate [S/s]

    recObj = audiorecorder(Fs, 16, 1, device_ID); %Creates a record object with 8k S/s, 16 bit, one channel.
    disp('Start Recording 1');
    recordblocking(recObj, rec_length); %Record to record object for RL seconds.
    disp('End of Recording');
    
    rec = getaudiodata(recObj);
    soundsc(rec, Fs);
    
    
   
    
    save(filename, 'rec');
    
end

