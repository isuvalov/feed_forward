BERs=3:20;
BERs=300;
rats_array=[];
fd=100;      % тактовая частота АЦП/ЦАП
% pilot_len=250;  % длина марекера по которому определяется расстройка в черне
pilot_len=64;  % длина марекера по которому определяется расстройка в черне
InterpolateRate=4;
PilotsNum=1; % количество кадров с пилотами при симуляции системы 
tdelay=10000;        % длина полезного информации которая стоит между маркерами
% tlen=PilotsNum*(2*tdelay+pilot_len*InterpolateRate); %201000; % длина всех отсчетов
tlen=(PilotsNum)*(tdelay+pilot_len); %201000; % длина всех отсчетов
alpha1=0.001;      % коэффициент усреднения, чем он меньше тем больше усреднение
alpha2=0.1;
 FreqOffset=0.5;
  FreqOffset=1.000;
test_freq_d=0.00;
M=4;
FILTLEN=32;
R=0.2;
 R=1;

mod_engine=modem.pskmod('M',M,'PhaseOffset', pi/4);
demod_engine=modem.pskdemod('M',M,'PhaseOffset', pi/4);

fdelay = 0.3; % Fractional delay
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
  
  hsqrt_sq=firrcos(32 + mod(32,2),1/InterpolateRate,R,2,'rolloff');
  
  
  half_filter=firrcos(32 + mod(32,2),1/2,1,2,'rolloff');
  
  
%  hsqrt=firrcos(32 + mod(32,2),1/InterpolateRate,1,2,'rolloff','sqrt',(32 + mod(32,2))/2,boxcar(32 + mod(32,2)+1));  %was

% hsqrt=sinc(t/T).*( cos(pi*R*t/T) ) ./ ( 1-4*R*R.*t.*t./(T*T) );  % normal Raised Cosine
% hsqrt=hsqrt/max(hsqrt);
% hsqrt_one=[zeros(1,floor(length(hsqrt)/2)) 100 zeros(1,floor(length(hsqrt)/2)+1)];
% hsqrt_one=hsqrt_one(1:length(hsqrt));
hsqrt_one=hsqrt;

%% Make pilot symbol
some=reshape(hadamard(2^ceil(log2(sqrt(pilot_len)))),1,[]);   % придумываем какой-то маркер из +/-1
pilot=some(1:pilot_len)+1i*some(1:pilot_len);

pilotUP=zeros(1,length(pilot)*InterpolateRate);
pilotUP(1:InterpolateRate:end)=pilot;
pilotUP=conv(pilotUP,hsqrt);
cut_f_l=floor(length(hsqrt)/2);
pilotUP=pilotUP(cut_f_l:end-cut_f_l-1); % формирующий фильтр на передаче
pilotUP=conv(pilotUP,hsqrt);
pilotUP=pilotUP(cut_f_l:end-cut_f_l-1); % формирующий фильтр на приеме


s_transfer=[];
values_all=[];
BERval=BERs;
%% Transimeter делаем отсчеты на передающей стороне
x=[];
for z=1:1000
	s_transfer=[s_transfer pilot];
end
%  s_transfer=[pilot modulate(mod_engine,repmat([1 0 1 0 1 0 1 0 ],1,floor(tdelay/8)))];
%             s_transfer=[pilot modulate(mod_engine,repmat([0 1 2 3 0 1 2 3],1,floor(tdelay/8)))];
%  s_transfer=[pilot modulate(mod_engine,repmat([0 6 2 4 3 5 1 7],1,floor(tdelay/8)))];


s_transfer_filt1=zeros(1,length(s_transfer)*InterpolateRate);
s_transfer_filt1(1:InterpolateRate:end)=s_transfer;  % прореживаем нулями для апсамплинга
s_transfer_filt1=conv(s_transfer_filt1,hsqrt); % формирующий фильтр
s_transfer_filt1=s_transfer_filt1(floor(length(hsqrt)/2):end-floor(length(hsqrt)/2));

%% Chanell
tlen=length(s_transfer_filt1);
t3=0:1/fd:tlen/fd-1/fd;

  	rx_transfer=s_transfer_filt1.*exp(1i*t3*FreqOffset*2*pi);%+(0.1/fd)*randn(1,length(s_transfer_filt1)));

   	rx_transfer=exp(1i*t3*FreqOffset*2*pi)+exp(-1i*t3*FreqOffset*2*pi);
% rx_transfer=sin(1*t3*FreqOffset*2*pi)+1i*sin(-1*t3*FreqOffset*2*pi);    
    
     rx_transfer=rx_transfer*exp(1i*pi/4);
% rx_transfer=s_transfer_filt1;%.*exp(1i*t3*FreqOffset*2*pi);      
%  rx_transfer=rx_transfer.*exp(1i*pi/8);
 	rx_transfer = awgn(rx_transfer,BERval,'measured');  
    
    %% 
    plot(abs(rx_transfer(1:1024)));
% cors=conv(rx_transfer,fliplr(pilotUP));

%  plot(abs(fft(rx_transfer(1:1024))))
%  Hpsd = dspdata.psd(abs(rx_transfer),'Fs',fd); 
%  plot(Hpsd)


% plot(abs(cors(1:1000)))