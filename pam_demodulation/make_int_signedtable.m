BIT_IN=8;  % bit with sign
BIT_OUT=8; % bit with sign

M=4;

mod_engine=modem.pskmod('M',M,'PhaseOffset', pi/4 );
demod_engine=modem.pskdemod('M',M,'PhaseOffset', pi/4);

out_int_array=zeros(1,2^(BIT_IN+1));


mask_val=(2^BIT_IN)-1;
max_val=(2^(BIT_IN*2))-1;
most_val=(2^(BIT_OUT-1))-1;

table_array=zeros(1,max_val);

for z=0:max_val
    x=big_unsigned2signed(bitand(z,mask_val),BIT_IN); % re
    y=big_unsigned2signed(bitand( bitshift(z,-BIT_IN) ,mask_val),BIT_IN); % im
    val=x+1i*y;
    val_dec=demodulate(demod_engine,val); % демодулируем PAM
    val_mod2=modulate(mod_engine,val_dec);
    c_phase_error=(val).*conj(val_mod2);
    if (abs(c_phase_error)==0)
        c_phase_error=1;
    else
        c_phase_error=c_phase_error./abs(c_phase_error);    
    end;
    c_phase_error_int=round(most_val*c_phase_error);
    table_array(z+1)=c_phase_error_int;
end %z
