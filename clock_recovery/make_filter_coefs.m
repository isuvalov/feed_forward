clc;
R=1;
filt=firrcos(32 + mod(32,2),1/8,R,2,'rolloff','sqrt',(32 + mod(32,2))/2,boxcar(32 + mod(32,2)+1));

max_filt=abs(max(filt));
filt_int=round(2047*(filt/max_filt));
fprintf('%i,',filt_int);
fprintf('\n');

