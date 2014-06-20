% a=round(20000*real(SF)./max([real(SF) imag(SF)]));
% b=round(20000*imag(SF)./max([real(SF) imag(SF)]));

a=real(SF);
b=imag(SF);

% real_A=repmat(a(1:end),1,1);
% imag_A=repmat(b(1:end),1,1);
% 
% real_A.signals.values=real_A;
% real_A.signals.dimensios=1;
% real_A.time=[];
% 
% imag_A.signals.values=imag_A;
% imag_A.signals.dimensios=1;
% imag_A.time=[];

real_A=repmat(a(1:end),1,20);
imag_A=repmat(b(1:end),1,20);

f=fopen('gadarg_signal_re.txt','w');
fprintf(f,'%i\n',real_A);
fclose(f);

ff=fopen('gadarg_signal_im.txt','w');
fprintf(ff,'%i\n',imag_A);
fclose(ff);

fclose('all');


