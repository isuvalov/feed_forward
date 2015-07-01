% clc
BERs=3:20;
BERs=379;
rats_array=[];
fd=200;      % тактовая частота АЦП/ЦАП
% pilot_len=250;  % длина марекера по которому определяется расстройка в черне
pilot_len=64;  % длина марекера по которому определяется расстройка в черне
InterpolateRate=8;
PilotsNum=1; % количество кадров с пилотами при симуляции системы 
tdelay=2000;        % длина полезного информации которая стоит между маркерами
% tlen=PilotsNum*(2*tdelay+pilot_len*InterpolateRate); %201000; % длина всех отсчетов
tlen=(PilotsNum)*(tdelay+pilot_len); %201000; % длина всех отсчетов
alpha1=0.01;      % коэффициент усреднения, чем он меньше тем больше усреднение
alpha2=0.1;
 FreqOffset=0.5;
  FreqOffset=0.000;
test_freq_d=0.00;
M=4;
FILTLEN=32;
R=0.2;
R=1;

mod_engine=modem.pskmod('M',M,'PhaseOffset', pi/4);
demod_engine=modem.pskdemod('M',M,'PhaseOffset', pi/4);

fdelay = 0.1; % Fractional delay
d = fdesign.fracdelay(fdelay,'N',3);
Hd_farrow = design(d, 'lagrange', 'FilterStructure', 'farrowfd');


Fi_porog=abs(angle(modulate(mod_engine,0))-angle(modulate(mod_engine,1)))/2;


N=floor(tlen/(tdelay+pilot_len));

T=InterpolateRate/2; % т.е. Частота среза Фильтра fd/InterpolateRate

t=(-9:1/T:9);
%% SQRT Raised Cosine
hsqrt=4*R*(  cos((1+R)*pi.*t/T) + sin((1-R).*pi.*t/T)./(4*R.*t/T)  ) ./ (pi*sqrt(T).*(1-(4*R.*t/T).*(4*R.*t/T)) ); % sqrt SQRT Raised Cosine
hsqrt_max=(pi+4*R-pi*R)/(pi*sqrt(T));
hsqrt=hsqrt./hsqrt_max;
hsqrt(round(length(hsqrt)/2))=1;
% hsqrt(14)=-0.1888; % добавлять при R=0.2, InterpolateRate=4
% hsqrt(24)=-0.1888; % добавлять при R=0.2, InterpolateRate=4
hsqrt(17)=-0.1888; % добавлять при R=0.2, InterpolateRate=8
hsqrt(57)=-0.1888; % добавлять при R=0.2, InterpolateRate=8


  hsqrt=firrcos(32 + mod(32,2),1/InterpolateRate,R,2,'rolloff','sqrt',(32 + mod(32,2))/2,boxcar(32 + mod(32,2)+1));
%  hsqrt=firrcos(32 + mod(32,2),1/InterpolateRate,1,2,'rolloff','sqrt',(32 + mod(32,2))/2,boxcar(32 + mod(32,2)+1));  %was

% hsqrt=sinc(t/T).*( cos(pi*R*t/T) ) ./ ( 1-4*R*R.*t.*t./(T*T) );  % normal Raised Cosine
% hsqrt=hsqrt/max(hsqrt);
% hsqrt_one=[zeros(1,floor(length(hsqrt)/2)) 100 zeros(1,floor(length(hsqrt)/2)+1)];
% hsqrt_one=hsqrt_one(1:length(hsqrt));
hsqrt_one=hsqrt;

%% Make pilot symbol
some=reshape(hadamard(2^ceil(log2(sqrt(pilot_len)))),1,[]);   % придумываем какой-то маркер из +/-1
pilot=some(1:pilot_len)+1i*some(1:pilot_len);


s_transfer=[];
values_all=[];
BERval=BERs;
%% Transimeter делаем отсчеты на передающей стороне
x=[];
for z=1:N
    if tdelay>0
%         values=randint(1,tdelay,M);
         values=randi(M,1,tdelay)-1;

		values_all=[values_all values];
        x=modulate(mod_engine,values); % модуляция PAM
    end
	s_transfer=[s_transfer pilot x];
end
%  s_transfer=[pilot modulate(mod_engine,repmat([1 0 1 0 1 0 1 0 ],1,floor(tdelay/8)))];
%             s_transfer=[pilot modulate(mod_engine,repmat([0 1 2 3 0 1 2 3],1,floor(tdelay/8)))];
%  s_transfer=[pilot modulate(mod_engine,repmat([0 6 2 4 3 5 1 7],1,floor(tdelay/8)))];


s_transfer_filt1=zeros(1,length(s_transfer)*InterpolateRate);
s_transfer_filt1(1:InterpolateRate:end)=s_transfer;  % прореживаем нулями для апсамплинга
s_transfer_filt1=conv(s_transfer_filt1,hsqrt); % формирующий фильтр
s_transfer_filt1=s_transfer_filt1(floor(length(hsqrt)/2):end-floor(length(hsqrt)/2));


pilotUP=zeros(1,length(pilot)*InterpolateRate);
pilotUP(1:InterpolateRate:end)=pilot;
pilotUP=conv(pilotUP,hsqrt);
cut_f_l=floor(length(hsqrt)/2);
pilotUP=pilotUP(cut_f_l:end-cut_f_l-1); % формирующий фильтр на передаче
pilotUP=conv(pilotUP,hsqrt);
pilotUP=pilotUP(cut_f_l:end-cut_f_l-1); % формирующий фильтр на приеме
%%%%%%%%
% должно быть pilotUP_n*conj(pilotUP_n).'==1
%   Сделать нормировку pilotUP !!!!!!!!!!!!!!!
%%%%%%%%
% pilotUP=pilotUP./norm(pilotUP);



tlen=length(s_transfer_filt1);
t3=0:1/fd:tlen/fd-1/fd;

tframelen=(pilot_len+tdelay)*InterpolateRate;
t4=0:1/fd:tframelen/fd-1/fd;

%% Chanell добавляем адитивнй шум и сдвиг по частоте
    % Еще добавляем фазовые шумы на уровне -90dB
%  	rx_transfer=s_transfer_filt1.*exp(1i*t3*FreqOffset*2*pi+(0.1/fd)*randn(1,length(s_transfer_filt1)));
rx_transfer=s_transfer_filt1;%.*exp(1i*t3*FreqOffset*2*pi);      
%  rx_transfer=rx_transfer.*exp(1i*pi/8);
 	rx_transfer = awgn(rx_transfer,BERval,'measured');  





%% Receiver  прием

rx_transfer_filt=conv(rx_transfer,hsqrt_one); % фильтр на приеме
rx_transfer_filt=rx_transfer_filt(cut_f_l:end-cut_f_l);
rx_transfer_filt=rx_transfer_filt./max(real(rx_transfer_filt));

rx_transfer_filt=[rx_transfer_filt];
% rx_transfer_filt_up=resample(rx_transfer_filt,3,1);
% rx_transfer_filt=rx_transfer_filt_up(2:3:end);

rx_transfer_filt_shift=filter(Hd_farrow,rx_transfer_filt);
rx_transfer_filt_shift=rx_transfer_filt_shift(2:end);

%%

% plot(real(rx_transfer_filt))
% hold on
% plot(real(rx_transfer_filt_shift),'r')

zzn=1;
ph_alpha=0;
ph_alphaa=0;
ph_test=0;
val_prev=0;
val_delta_filt=0;
val_delta_prev=0;
val_prevs=zeros(1,InterpolateRate);

ph_acum=zeros(1,ceil(length(rx_transfer_filt_shift)/InterpolateRate));
for zz=(512+1):InterpolateRate:length(rx_transfer_filt_shift)-512
%     if (mod(zz,InterpolateRate)==0)
        ph_alphaa=mod(ph_alphaa+Fi_porog,2*pi);
%     end;
    val=rx_transfer_filt_shift(zz);
    
    val_dec=demodulate(demod_engine,val); % демодулируем PAM  
    val_angle=angle(val)-angle(modulate(mod_engine,val_dec));
    
    val_angle=mod(val_angle,2*pi);
    
% 	val_dec=demodulate(demod_engine,val); % демодулируем PAM    
%     
% %     angle_must=mod(angle(modulate(mod_engine,val_dec)),2*pi);
%     angle_must=angle(modulate(mod_engine,val_dec));
    
%     val_anglebase=mod(angle(val),pi/4);
%     ph_alpha=val_anglebase*sign(val_anglebase-angle(val));
    
%     ph_alpha=mod(angle(val_prevs(InterpolateRate)),pi/4)-mod(angle(val),pi/4);
%     
%     val_prev=val;

%     val_delta_abs=abs(val-val_prevs(InterpolateRate));
%     val_delta=val_delta_abs*exp(1i*ph_alphaa);
% 
%     val_delta_sum=val_delta+val_delta_prev;
%     val_delta_prev=val_delta;
    
    
    val_delta_filt=(1-alpha1)*val_delta_filt+val_angle;
    
    ph_alpha=val_delta_filt*alpha1;
    
    ph_acum(zzn)=ph_alpha;    
    zzn=zzn+1;
end;

 plot(ph_acum/(2*pi))
% ph_test/(2*pi)
% mean(ph_acum)/(2*pi)


% plot(  mod(angle(rx_transfer_filt),2*pi)  )


