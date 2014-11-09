Nbit_CORE_SAMPLES=16;
PILOT_LEN=128;
InterpolateRate=4;
rx_pilot_mask=zeros(InterpolateRate*PILOT_LEN,1);
Mdiv2=floor(length(rx_pilot_mask)/2);
aa=smoof_window_W_fix(1:Mdiv2-1,Mdiv2,Nbit_CORE_SAMPLES);
fprintf('%i,',aa);