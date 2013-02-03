InterpolateRate=4;
hsqrt=[2.439203e-002, -1.926044e-017, -3.431888e-002, -5.301404e-002, -3.456671e-002, 1.958599e-002, 7.858982e-002, 9.667600e-002, 4.350558e-002, -6.755317e-002, -1.736709e-001, -1.885157e-001, -4.963484e-002, 2.386941e-001, 5.940506e-001, 8.868057e-001, 1, 8.868057e-001, 5.940506e-001, 2.386941e-001, -4.963484e-002, -1.885157e-001, -1.736709e-001, -6.755317e-002, 4.350558e-002, 9.667600e-002, 7.858982e-002, 1.958599e-002, -3.456671e-002, -5.301404e-002, -3.431888e-002, -1.926044e-017, 2.439203e-002];
pilot=bin2dec(rot90('1100111001001001000010001100001010000001101011000100000100000001'));


pilot_resample=zeros(1,(length(pilot))*InterpolateRate);
pilot_resample(1:InterpolateRate:end)=pilot*2-1;
pilot_resample_filt=conv(pilot_resample,hsqrt);


h2=floor(length(hsqrt)/2);
pilot_resample_filt2=pilot_resample_filt((h2+1):end-h2);
plot(pilot_resample_filt2);

% Масштабируем в половину 16и битного диапазона
pilot_resample_filt2=round(16383*pilot_resample_filt2/abs(max(pilot_resample_filt2)));

clc;
fprintf('%i\n',pilot_resample_filt2);
