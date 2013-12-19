  load_saved_values;
  
Nbit=9;
NBitVal=(2^(Nbit-1))-1;
NBitValWhole=(2^(Nbit))-1;
% На вход таблицы подается угол входных отсчетов и модуль аккомулятора


ANGLE_SIZE=8;
ACUM_SIZE=8;

InputBitSize=ANGLE_SIZE+ACUM_SIZE;

fprintf('reg [17:0] ram [%i:0];\n',((2^InputBitSize)-1));
fprintf('reg [19:0] ram [63:0];\n');
fprintf('initial begin\n');

fid = fopen('phaseerrors_verilog.dat','w');
% for z=0:((2^InputBitSize)-1)
%         in_val_phase_int=bitand(z,(2^(ANGLE_SIZE))-1)*(2^(Nbit-ANGLE_SIZE));
    for phase_demod_acum_MOD_intp=0:((2^ACUM_SIZE)-1)
      for in_val_phase_intp=0:((2^ANGLE_SIZE)-1)
        in_val_phase_int=in_val_phase_intp*(2^(Nbit-ANGLE_SIZE));
        if (in_val_phase_int>NBitVal)
            in_val_phase_int=in_val_phase_int-256*2;
        end
        
%         z_shifted=bitshift(z,-ANGLE_SIZE);
%         phase_demod_acum_MOD_int=bitand(z_shifted,bitand(z,(2^(ACUM_SIZE))-1))*(2^(Nbit-ACUM_SIZE));
        phase_demod_acum_MOD_int=phase_demod_acum_MOD_intp*(2^(Nbit-ACUM_SIZE));
        
        in_val_phase=pi*in_val_phase_int/NBitVal;
        phase_demod_acum_MOD=pi*phase_demod_acum_MOD_int/NBitVal;
         val=exp(1i*(in_val_phase-phase_demod_acum_MOD));
%          val_a=[val_a val];
        val_dec=demodulate(demod_engine,val); % ???????????? PAM
        val_mod2=modulate(mod_engine,val_dec);
        c=corrcoef( [0 val_mod2],[0 val] ); % ????????? ???? ?????????? ??????????? ???????? ? ????????????????
        phi_err_real=angle(  val.*conj(val_mod2)  ); % Считаем что тоже +/-PI
        phi_err_int=floor(((phi_err_real)*NBitVal)/2);
%         val_angle_int=angle(val)*NBitVal/pi;
        val_angle_int=floor(angle(val)*NBitVal);
        val_angle_int=floor(val_angle_int/2);

        if (phi_err_int<0)
             s1='-';
        else
             s1='';
        end
        if (val_angle_int<0)
             s2='-';
        else
             s2='';
        end        
        poss=(phase_demod_acum_MOD_intp*(2^ANGLE_SIZE))+in_val_phase_intp;
        fprintf(fid,'ram[%i] = {%c9''d%i,%c10''d%i};\n',poss,s1,abs(phi_err_int),s2,abs(val_angle_int));
      end % in_val_phase_intp
    end % phase_demod_acum_MOD_intp 

fprintf('end\n');


fclose(fid);