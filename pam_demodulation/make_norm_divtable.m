NORMBIT=6;

NORM_ACUR=12;

NORMBITOUT_val=2^(NORMBIT-1);



fprintf('type Tnorm_mem is array (0 to %i) of std_logic_vector(%i downto 0);\n',(2^(NORMBIT*2))-1,NORM_ACUR-1);

fprintf('constant norm_mem:Tnorm_mem:=  (\n');


norm_array=ones(1,(2^(NORMBIT*2)))*((2^NORM_ACUR)-1);

 for imm=-NORMBITOUT_val:1:(NORMBITOUT_val-1)
 	for ree=-NORMBITOUT_val:1:(NORMBITOUT_val-1)
 		pos=big_signed2unsigned(ree,NORMBIT) + big_signed2unsigned(imm,NORMBIT)*(2^NORMBIT);
 		val=round( 0.5* (1/sqrt(imm^2 + ree^2)) * (2^(NORM_ACUR)-1)     );
 		if ((val>0) && isinf(val)==0)
                norm_array(pos+1)=val;
 		end
	end % ree
end % imm

for z=1:(2^(NORMBIT*2))
     fprintf('"%s", ',num2str(de2bi(norm_array(z),NORM_ACUR,'left-msb').'));
     if (mod(z,10)==0) fprintf('\n'); end
end     
%  fprintf('"%s, "',num2str(de2bi(norm_array,NORM_ACUR).'));
fprintf(');\n');


%%

imm=6;
ree=6;

imm=floor(2986/(2^11));
ree=floor(-9143/(2^11));



vv=sqrt(imm^2+ree^2);
true=round((1/vv)* (2^(NORM_ACUR)-1))

%   pos=big_signed2unsigned(imm,NORMBIT) + big_signed2unsigned(ree,NORMBIT)*(2^NORMBIT)
 pos=big_signed2unsigned(ree,NORMBIT) + big_signed2unsigned(imm,NORMBIT)*(2^NORMBIT)
norm_array(pos+1)

