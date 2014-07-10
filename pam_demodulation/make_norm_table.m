Nbig=16;
Nbit=5;  % this equal NORMBIT

Nbit_out=8;


Nmin=-(2^(Nbit-1));
Nmax=(2^(Nbit-1))-1;

Delt=2^(Nbig-Nbit);
ssizee=2^(Nbit*2);


table=zeros(1,ssizee);

pos=0;
for y=[Nmin:1:Nmax]
	for x=[Nmin:1:Nmax]
		 lll=sqrt(x^2+y^2);
         if lll==0 
            lll=1;
         end
		 lll_out=round(((2^Nbit_out)-1) / lll);
         if lll_out==0
             lll_out=1;
         end;
         pos=big_signed2unsigned(y,Nbit)*(2^Nbit)+big_signed2unsigned(x,Nbit);
%          pos=((y+abs(Nmin))*(2^Nbit))+(x+abs(Nmin));
		 table(pos+1)=lll_out;
% 		 pos=pos+1;
	end % y
end % x
% x=[Nmin:1:Nmax];
% y=[Nmin:1:Nmax];
% log2(max(sqrt(x.^2+y.^2)))
  plot(table,'DisplayName','table','YDataSource','table');figure(gcf)
  

  
  
%% printit
clc;

fprintf('constant NORMBIT:natural:=%i;\n',Nbit);
fprintf('constant NORMBITOUT:natural:=%i;\n\n',Nbit_out);
fprintf('type Tnorm_mem is array (0 to %i) of std_logic_vector(%i downto 0);\n',ssizee-1,Nbit_out-1);
fprintf('constant norm_mem:Tnorm_mem:=  (\n');
for z=0:ssizee-2
    fprintf('"%s", ',num2str(de2bi(real(table(z+1)),Nbit_out,'left-msb').'));
    if (mod(z,20)==0) fprintf('\n'); end
end;
fprintf('"%s" ',num2str(de2bi(real(table(ssizee)),Nbit_out,'left-msb').'));
fprintf(');\n');

