clc
BERs=3:20;
BERs=750;
fd=200;      % тактовая частота АЦП/ЦАП
len=8192;
InterpolateRate=4;
M=4;
FILTLEN=16;
LFILT=32;
R=0.2;
FreqOffset=0.000;
WinnerLen=8;

mod_engine=modem.pskmod('M',M,'PhaseOffset', 0 );
demod_engine=modem.pskdemod('M',M,'PhaseOffset', 0);
Fi_porog=abs(angle(modulate(mod_engine,0))-angle(modulate(mod_engine,1)))/2;

T=InterpolateRate/2; % т.е. Частота среза Фильтра fd/InterpolateRate

t=(-9:1/T:9);
%% SQRT Raised Cosine
hsqrt=4*R*(  cos((1+R)*pi.*t/T) + sin((1-R).*pi.*t/T)./(4*R.*t/T)  ) ./ (pi*sqrt(T).*(1-(4*R.*t/T).*(4*R.*t/T)) );
h=sinc(t/T).*( cos(pi*R*t/T) ) ./ ( 1-4*R*R.*t.*t./(T*T) );
hsqrt_max=(pi+4*R-pi*R)/(pi*sqrt(T));
hsqrt=hsqrt./hsqrt_max;
hsqrt(round(length(hsqrt)/2))=1;
if (R==0.2)
    hsqrt(14)=-0.1888; % добавлять при R=0.2
    hsqrt(24)=-0.1888; % добавлять при R=0.2
end

% Raised Cosine
h=sinc(t/T).*( cos(pi*R*t/T) ) ./ ( 1-4*R*R.*t.*t./(T*T) );

values_all=randint(1,len,M);
s_transfer=modulate(mod_engine,values_all); % модуляция PAM

s_transfer_filt1=zeros(1,length(s_transfer)*InterpolateRate);
s_transfer_filt1(1:InterpolateRate:end)=s_transfer;  % прореживаем нулями для апсамплинга
s_transfer_filt1=conv(s_transfer_filt1,h); % формирующий фильтр
% s_transfer_filt1=s_transfer_filt1(floor(length(hsqrt)/2):end-floor(length(hsqrt)/2));
s_transfer_filt1=s_transfer_filt1(floor(length(h)/2):end-floor(length(h)/2));
% s_transfer_filt1=s_transfer_filt1;
tlen=length(s_transfer_filt1);
t3=0:1/fd:tlen/fd-1/fd;
BERval=BERs;

%% Chanell добавляем адитивнй шум и сдвиг по частоте
    % Еще добавляем фазовые шумы на уровне -90dB
	rx_transfer=s_transfer_filt1.*exp(1i*t3*FreqOffset*2*pi+(0.1/fd)*randn(1,length(s_transfer_filt1)));
%      rx_transfer=rx_transfer.*exp(1i*pi/4);
 	rx_transfer = awgn(rx_transfer,BERval,'measured');  

%% Receiver  прием
cut_f_l=floor(length(h)/2);
rx_transfer_filt=conv(rx_transfer,h); % фильтр на приеме
rx_transfer_filt=rx_transfer_filt(cut_f_l:end-cut_f_l);
% rx_transfer_filt=rx_transfer; % фильтр на приеме  !!!!! это влияет на демодуляцию!!!!

%% receive file
load samples_adc_i.txt 
load samples_adc_q.txt 
rx_transfer_filt=samples_adc_i+1i*samples_adc_q;

%% main Winner loop
test_phases_ar=zeros(1,floor(len/InterpolateRate));
test_dots=zeros(1,floor(len/InterpolateRate));
% filt_wiener=zeros(1,WinnerLen);
filt_wiener=0;
demod_vals=zeros(1,floor(len/InterpolateRate));
zp=1;

filt_line=zeros(LFILT,1);

for z=3:InterpolateRate:(len*InterpolateRate)-InterpolateRate
    test_phases_ar(zp)=filt_wiener;
%     filt_wiener=0;
    val=rx_transfer_filt(z)*exp(-1i*filt_wiener);
    test_dots(zp)=val;
    
	val_dec=demodulate(demod_engine,val); % демодулируем PAM
    demod_vals(zp)=val_dec;

    val_mod2=modulate(mod_engine,val_dec);
    c_phase_error=angle((val).*conj(val_mod2));
    
%     if (mod(z,InterpolateRate*2)==0)
        filt_line=[c_phase_error; filt_line(2:end)];

%     if abs(c_phase_error)>=Fi_porog/2        
%         filt_wiener=filt_wiener+mean(filt_line);
        filt_wiener=filt_wiener+angle(mean(real(exp(1i*filt_line)))+1i*mean(imag(exp(1i*filt_line))));
%     end
%     else
%         filt_wiener=filt_wiener;
%     end;
    zp=zp+1;
end; %z

[number,ratio,individual] = biterr(demod_vals(1:end-2),values_all(1:length(demod_vals)-2));
fprintf('Ratio %.4i, with count %i from %i bits\n',ratio,number,length(demod_vals)*log2(M));

scatterplot(test_dots);