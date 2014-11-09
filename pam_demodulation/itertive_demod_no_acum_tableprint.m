BIT_OUT=BITLEN;

max_val=((2^(2*BITLEN)));
table_array=ones(1,(2^(2*BITLEN)));

% table_array(0)=0;
for z=1:max_val
    rre=big_signed2unsigned(round(acum_table(1,z)*(2^(BITLEN-1))),BITLEN);
    iim=big_signed2unsigned(round(acum_table(2,z)*(2^(BITLEN-1))),BITLEN);
    if (rre==0) rre=1; end;
    if (iim==0) iim=1; end;
    table_array(z)=rre+1i*iim;
% 	table_array(z)=big_signed2unsigned(round(acum_table(1,z)*(2^(BITLEN-1))),BITLEN)+1i*big_signed2unsigned(round(acum_table(2,z)*(2^(BITLEN-1))),BITLEN);
end

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fid = fopen('table_demod_ver2.vhd','w');
fprintf(fid,'library IEEE;\n');
fprintf(fid,'use IEEE.STD_LOGIC_1164.all;\n');
fprintf(fid,'use IEEE.STD_LOGIC_UNSIGNED.all;\n');
fprintf(fid,'use IEEE.std_logic_arith.all;\n');

fprintf(fid,'entity table_demod_ver2 is\n');
fprintf(fid,'	generic(\n');
fprintf(fid,'		BIT_IN:integer:=%i;\n',BITLEN);
fprintf(fid,'		BIT_OUT:integer:=%i \n',BIT_OUT);
fprintf(fid,'	);\n');
fprintf(fid,'	 port(\n');
fprintf(fid,'		  clk : in std_logic;\n');
fprintf(fid,'		  i_ce: in std_logic;\n');
fprintf(fid,'	      sample_in_re: in std_logic_vector(BIT_IN-1 downto 0);\n');
fprintf(fid,'	      sample_in_im: in std_logic_vector(BIT_IN-1 downto 0);\n');

fprintf(fid,'		  o_ce: out std_logic;\n');
fprintf(fid,'	      o_phase_error_re: out std_logic_vector(BIT_OUT-1 downto 0);\n');
fprintf(fid,'	      o_phase_error_im: out std_logic_vector(BIT_OUT-1 downto 0)\n');
fprintf(fid,'		 );\n');
fprintf(fid,'    end table_demod_ver2;\n');
fprintf(fid,'architecture table_demod_ver2 of table_demod_ver2 is\n');

fprintf(fid,'type Tmem is array (0 to %i) of std_logic_vector(%i downto 0);\n',max_val,BIT_OUT-1);
fprintf(fid,'constant mem_re:Tmem:=  (\n');
    fprintf(fid,'"%s", ',num2str(de2bi(real(1),BIT_OUT,'left-msb').'));
for z=1:max_val-1
    fprintf(fid,'"%s", ',num2str(de2bi(real(table_array(z)),BIT_OUT,'left-msb').'));
    if (mod(z,20)==0) fprintf(fid,'\n'); end
end;
fprintf(fid,'"%s" ',num2str(de2bi(real(table_array(max_val)),BIT_OUT,'left-msb').'));
fprintf(fid,');\n');


fprintf(fid,'constant mem_im:Tmem:=  (\n');
    fprintf(fid,'"%s", ',num2str(de2bi(real(1),BIT_OUT,'left-msb').'));
for z=1:max_val-1
    fprintf(fid,'"%s", ',num2str(de2bi(imag(table_array(z)),BIT_OUT,'left-msb').'));
    if (mod(z,20)==0) fprintf(fid,'\n'); end
end;
fprintf(fid,'"%s" ',num2str(de2bi(imag(table_array(max_val)),BIT_OUT,'left-msb').'));
fprintf(fid,');\n');

fprintf(fid,'begin\n');

fprintf(fid,'process(clk) is\n');
fprintf(fid,'begin\n');
fprintf(fid,'	if rising_edge(clk) then\n');
fprintf(fid,'		if i_ce=''1'' then\n');
fprintf(fid,'			o_phase_error_re<=mem_re(conv_integer(sample_in_im&sample_in_re));\n');
fprintf(fid,'			o_phase_error_im<=mem_im(conv_integer(sample_in_im&sample_in_re));\n');
fprintf(fid,'		end if;\n');
fprintf(fid,'		o_ce<=i_ce;\n');
fprintf(fid,'	end if;\n');
fprintf(fid,'end process;\n');

fprintf(fid,'end table_demod_ver2;\n');
fclose(fid);
    

