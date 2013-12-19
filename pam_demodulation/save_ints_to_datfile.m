Nbit=16;
NN=(2^(Nbit-1))-1;
maaa=max([abs(real(data_transfer_filtdata))  abs(imag(data_transfer_filtdata)) ]);
data_transfer_filtdata_int=floor((data_transfer_filtdata./maaa)*NN);


fid = fopen('filtdata_real.dat','w');
	for z=1:length(data_transfer_filtdata_int)
	    fprintf(fid,'%i\n',real(data_transfer_filtdata_int(z)));
	    fprintf(fid,'%i\n',real(data_transfer_filtdata_int(z)));
	    fprintf(fid,'%i\n',real(data_transfer_filtdata_int(z)));
	    fprintf(fid,'%i\n',real(data_transfer_filtdata_int(z)));
	end;
fclose(fid);

fid = fopen('filtdata_imag.dat','w');
	for z=1:length(data_transfer_filtdata_int)
	    fprintf(fid,'%i\n',imag(data_transfer_filtdata_int(z)));
	    fprintf(fid,'%i\n',imag(data_transfer_filtdata_int(z)));
	    fprintf(fid,'%i\n',imag(data_transfer_filtdata_int(z)));
	    fprintf(fid,'%i\n',imag(data_transfer_filtdata_int(z)));
	end 
fclose(fid);


fprintf('real init phase=%i\n',real(exp(1i*pcp_a)));
fprintf('imag init phase=%i\n',imag(exp(1i*pcp_a)));
fprintf('angle phase=%i\n',(pcp_a));


%fprintf('Fi_porog_re=%i\n',Fi_porog_re);
%fprintf('Fi_porog_im=%i\n',Fi_porog_im);

