BIT_IN=8;  % bit with sign
BIT_OUT=8; % bit with sign

M=4;

mod_engine=modem.pskmod('M',M,'PhaseOffset', pi/4 );
demod_engine=modem.pskdemod('M',M,'PhaseOffset', pi/4);

out_int_array=zeros(1,2^(BIT_IN+1));


min_val=-(2^(BIT_IN-1));
max_val=(2^(BIT_IN-1))-1;


for y=min_val:1:max_val
	for x=min_val:1:max_val
		val=x+1i*y;
		val=val/abs(min_val);
		val_dec=demodulate(demod_engine,val); % демодулируем PAM
        val_mod2=modulate(mod_engine,val_dec);
        c_phase_error=(val).*conj(val_mod2);
        c_phase_error=c_phase_error./abs(c_phase_error);
        pos=(y-min_val)*(2^BIT_IN)+(x-min_val);
        out_int_array(pos)+
	end %x
end %y