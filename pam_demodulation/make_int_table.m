BIT_IN=8;  % bit with sign
BIT_OUT=8; % bit with sign

M=4;

mod_engine=modem.pskmod('M',M,'PhaseOffset', 0 );
demod_engine=modem.pskdemod('M',M,'PhaseOffset', 0);

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
     table_array(z+1)=big_signed2unsigned(real(c_phase_error_int),BIT_OUT)+1i*big_signed2unsigned(imag(c_phase_error_int),BIT_OUT);
end %z

%% print to file
fid = fopen('table_demod.vhd','w');
fprintf(fid,'library IEEE;\n');
fprintf(fid,'use IEEE.STD_LOGIC_1164.all;\n');
fprintf(fid,'use IEEE.STD_LOGIC_UNSIGNED.all;\n');
fprintf(fid,'use IEEE.std_logic_arith.all;\n');

fprintf(fid,'entity table_demod is\n');
fprintf(fid,'	generic(\n');
fprintf(fid,'		BIT_IN:integer:=%i;\n',BIT_IN);
fprintf(fid,'		BIT_OUT:integer:=%i \n',BIT_OUT);
fprintf(fid,'	);\n');
fprintf(fid,'	 port(\n');
fprintf(fid,'		  clk : in std_logic;\n');
fprintf(fid,'		  i_ce: in std_logic;\n');
fprintf(fid,'	      sample_in_re: in std_logic_vector(BIT_IN-1 downto 0);\n');
fprintf(fid,'	      sample_in_im: in std_logic_vector(BIT_IN-1 downto 0);\n');

fprintf(fid,'		  o_ce: out std_logic;\n');
fprintf(fid,'	      sample_out_re: out std_logic_vector(BIT_OUT-1 downto 0);\n');
fprintf(fid,'	      sample_out_im: out std_logic_vector(BIT_OUT-1 downto 0)\n');
fprintf(fid,'		 );\n');
fprintf(fid,'    end table_demod;\n');
fprintf(fid,'architecture table_demod of table_demod is\n');

fprintf(fid,'type Tmem is array (0 to %i) of std_logic_vector(%i downto 0);\n',max_val,BIT_OUT-1);
fprintf(fid,'constant mem_re:Tmem:=  (\n');
for z=0:max_val-1
    fprintf(fid,'"%s", ',num2str(de2bi(real(table_array(z+1)),BIT_OUT,'left-msb').'));
    if (mod(z,20)==0) fprintf(fid,'\n'); end
end;
fprintf(fid,'"%s" ',num2str(de2bi(real(table_array(max_val+1)),BIT_OUT,'left-msb').'));
fprintf(fid,');\n');


fprintf(fid,'constant mem_im:Tmem:=  (\n');
for z=0:max_val-1
    fprintf(fid,'"%s", ',num2str(de2bi(imag(table_array(z+1)),BIT_OUT,'left-msb').'));
    if (mod(z,20)==0) fprintf(fid,'\n'); end
end;
fprintf(fid,'"%s" ',num2str(de2bi(imag(table_array(max_val+1)),BIT_OUT,'left-msb').'));
fprintf(fid,');\n');

fprintf(fid,'begin\n');

fprintf(fid,'process(clk) is\n');
fprintf(fid,'begin\n');
fprintf(fid,'	if rising_edge(clk) then\n');
fprintf(fid,'		if i_ce=''1'' then\n');
fprintf(fid,'			sample_out_re<=mem_re(conv_integer(sample_in_im&sample_in_re));\n');
fprintf(fid,'			sample_out_im<=mem_im(conv_integer(sample_in_im&sample_in_re));\n');
fprintf(fid,'		end if;\n');
fprintf(fid,'		o_ce<=i_ce;\n');
fprintf(fid,'	end if;\n');
fprintf(fid,'end process;\n');

fprintf(fid,'end table_demod;\n');
fclose(fid);
