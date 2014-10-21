BITLEN=6;
M=4;

mod_engine=modem.pskmod('M',M,'PhaseOffset', pi/4 );
demod_engine=modem.pskdemod('M',M,'PhaseOffset', pi/4);

p_left=-(2^(BITLEN-1));
p_right=(2^(BITLEN-1))-1;

acum_table=zeros(2,2^(BITLEN*2));
for y=p_left:1:p_right
    for x=p_left:1:p_right
        tval=x+1i*y;
        if abs(tval)>0
            tval_c=tval./abs(tval);
        else
            tval=1;
        end;
        val_dec=demodulate(demod_engine,tval_c);
        val_mod2=modulate(mod_engine,val_dec);
        c_phase_error=(tval_c).*conj(val_mod2);
        c_phase_error=c_phase_error./abs(c_phase_error);
        p=big_signed2unsigned(x,BITLEN)+bitshift(big_signed2unsigned(y,BITLEN),BITLEN);
        if (p~=0)
            acum_table(1,p)=real(c_phase_error);
            acum_table(2,p)=imag(c_phase_error);
        end;
    end% x
end% y    
    
    