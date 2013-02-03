load datfiles/resample_pilot.dat
fd=200;
lll=length(resample_pilot);
t=0:1/fd:lll/fd-1/fd;

%Offset_Freq_array=[0.25 0.5 0.75 1.25 1.5 1.75 1 2.5 2 3.5 3 4.5 4 5.5 5];
%Offset_Freq_array=[-Offset_Freq_array Offset_Freq_array];
Offset_Freq_array=[-0.25 -0.5 -0.75 -1.25 -1.5 -1.75 -1 -2.5  -2 -3.5 -3 -4.5 -4 -5.5 -5 +0.25 +0.5 +0.75 +0 +1.25 +1.5 +1.75 +1 +2.5 +2 +3.5 +3 +4.5 +4 +5.5 +5];


for z=1:length(Offset_Freq_array)

Offset_Freq=Offset_Freq_array(z);
resample_pilot_1pmhz=round((resample_pilot+1i*resample_pilot).*exp(1i*(2*pi*Offset_Freq*t+pi/2).'));

if (Offset_Freq>=0)
    dd='p';
else
    dd='m';
end

wr_name_imag=['datfiles/resample_pilot_' dd num2str(abs(Offset_Freq)) 'mhz_imag.dat'];
wr_name_real=['datfiles/resample_pilot_' dd num2str(abs(Offset_Freq)) 'mhz_real.dat'];
fid = fopen(wr_name_imag,'w');
fprintf(fid,'%i\n',imag(resample_pilot_1pmhz));
fclose(fid);


fid = fopen(wr_name_real,'w');
fprintf(fid,'%i\n',real(resample_pilot_1pmhz));
fclose(fid);

end