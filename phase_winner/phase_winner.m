clc
BERs=3:20;
BERs=75;
fd=200;      % тактовая частота АЦП/ЦАП
len=8192;
InterpolateRate=4;
M=4;
FILTLEN=32;
R=0.2;
FreqOffset=0.1;
WinnerLen=8;

mod_engine=modem.pskmod('M',M,'PhaseOffset', pi/4 );
demod_engine=modem.pskdemod('M',M,'PhaseOffset', pi/4);

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

%% Chanell добавляем адитивнй шум и сдвиг по частоте
    % Еще добавляем фазовые шумы на уровне -90dB
	rx_transfer=s_transfer_filt1.*exp(1i*t3*FreqOffset*2*pi+(0.1/fd)*randn(1,length(s_transfer_filt1)));
%      rx_transfer=rx_transfer.*exp(1i*pi/4);
 	rx_transfer = awgn(rx_transfer,BERval,'measured');  

%% Receiver  прием
BERval=BERs;
cut_f_l=floor(length(hsqrt)/2);
rx_transfer_filt=conv(rx_transfer,hsqrt); % фильтр на приеме
rx_transfer_filt=rx_transfer_filt(cut_f_l:end-cut_f_l);


%% main Winner loop

for z=1:WinnerLen:len
    
end; %z



