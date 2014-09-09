clc
BERs=3:20;
BERs=750;
fd=200;      % тактовая частота АЦП/ЦАП
len=8192;
InterpolateRate=4;
M=4;
FILTLEN=32;
R=0.2;
FreqOffset=0.00;
WinnerLen=8;

mod_engine=modem.pskmod('M',M,'PhaseOffset', pi/4 );
demod_engine=modem.pskdemod('M',M,'PhaseOffset', pi/4);
Fi_porog=abs(angle(modulate(mod_engine,0))-angle(modulate(mod_engine,1)))/2;

T=InterpolateRate/2; % т.е. Частота среза Фильтра fd/InterpolateRate

t=(-9:1/T:9);
%% SQRT Raised Cosine
hsqrt=4*R*(  cos((1+R)*pi.*t/T) + sin((1-R).*pi.*t/T)./(4*R.*t/T)  ) ./ (pi*sqrt(T).*(1-(4*R.*t/T).*(4*R.*t/T)) );
hsqrt_max=(pi+4*R-pi*R)/(pi*sqrt(T));
hsqrt=hsqrt./hsqrt_max;
hsqrt(round(length(hsqrt)/2))=1;
if (R==0.2)
    hsqrt(14)=-0.1888; % добавлять при R=0.2
    hsqrt(24)=-0.1888; % добавлять при R=0.2
end

values_all=randint(1,len,M);
s_transfer=modulate(mod_engine,values_all); % модуляция PAM

s_transfer_filt1=zeros(1,length(s_transfer)*InterpolateRate);
s_transfer_filt1(1:InterpolateRate:end)=s_transfer;  % прореживаем нулями для апсамплинга
s_transfer_filt1=conv(s_transfer_filt1,hsqrt); % формирующий фильтр
s_transfer_filt1=s_transfer_filt1(floor(length(hsqrt)/2):end-floor(length(hsqrt)/2));
tlen=length(s_transfer_filt1);
t3=0:1/fd:tlen/fd-1/fd;
BERval=BERs;

%% Chanell добавляем адитивнй шум и сдвиг по частоте
    % Еще добавляем фазовые шумы на уровне -90dB
	rx_transfer=s_transfer_filt1.*exp(1i*t3*FreqOffset*2*pi+(0.1/fd)*randn(1,length(s_transfer_filt1)));
%      rx_transfer=rx_transfer.*exp(1i*pi/4);
 	rx_transfer = awgn(rx_transfer,BERval,'measured');  

%% Receiver  прием
cut_f_l=floor(length(hsqrt)/2);
rx_transfer_filt=conv(rx_transfer,hsqrt); % фильтр на приеме
rx_transfer_filt=rx_transfer_filt(cut_f_l:end-cut_f_l);
rx_transfer_filt=rx_transfer; % фильтр на приеме  !!!!! это влияет на демодуляцию!!!!


%% main Winner loop
test_phases_ar=zeros(1,floor(len/InterpolateRate));
test_dots=zeros(1,floor(len/InterpolateRate));
% filt_wiener=zeros(1,WinnerLen);
filt_wiener=0;
demod_vals=zeros(1,floor(len/InterpolateRate));
zp=1;

for z=2:InterpolateRate:len-InterpolateRate
    test_phases_ar(zp)=filt_wiener;
    val=rx_transfer_filt(z)*exp(-1i*filt_wiener);
    test_dots(zp)=val;
    
	val_dec=demodulate(demod_engine,val); % демодулируем PAM
    demod_vals(zp)=val_dec;

    val_mod2=modulate(mod_engine,val_dec);
    c_phase_error=angle((val).*conj(val_mod2));
    
    if abs(c_phase_error)>=Fi_porog/2        
        filt_wiener=filt_wiener+c_phase_error;
    else
        filt_wiener=filt_wiener;
    end;
    zp=zp+1;
end; %z

[number,ratio,individual] = biterr(demod_vals(1:end-2),values_all(1:length(demod_vals)-2));
fprintf('Процент ошибки составляет %.4i, при их количестве %i на %i данных\n',ratio,number,length(demod_vals)*log2(M));

scatterplot(test_dots);