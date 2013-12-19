% для сохранения данных и их последующего перевода в целые числа
Nbit=16;
NN=(2^(Nbit-1))-1;
maaa=max([abs(real(data_transfer_filtdata))  abs(imag(data_transfer_filtdata)) ]);

data_transfer_filtdata_int=floor((data_transfer_filtdata./maaa)*NN);

%pcp_a_int=floor(exp(1i*pcp_a)*NN);

%save('start_vals.mat','data_transfer_filtdata','data_transfer_filtdata_int','values_all','phase_demod_acum','pcp_a','phase_acum_prev', ...
% 'filt_array','filt_x','f_offset','values_all','pcp');

save('start_vals.mat');