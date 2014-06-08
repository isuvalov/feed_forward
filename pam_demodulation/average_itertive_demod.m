clc
BERs=3:20;
BERs=4;
rats_array=[];
fd=200;      % тактовая частота АЦП/ЦАП
% pilot_len=250;  % длина марекера по которому определяется расстройка в черне
pilot_len=64;  % длина марекера по которому определяется расстройка в черне
InterpolateRate=4;
PilotsNum=1; % количество кадров с пилотами при симуляции системы 
tdelay=10000;        % длина полезного информации которая стоит между маркерами
% tlen=PilotsNum*(2*tdelay+pilot_len*InterpolateRate); %201000; % длина всех отсчетов
tlen=(PilotsNum+1)*(tdelay+pilot_len); %201000; % длина всех отсчетов
alpha1=0.2;      % коэффициент усреднения, чем он меньше тем больше усреднение
alpha2=0.1;
% FreqOffset=1;
FreqOffset=0;
M=4;
FILTLEN=32;
R=0.2;

mod_engine=modem.pskmod('M',M,'PhaseOffset', pi/4 );
demod_engine=modem.pskdemod('M',M,'PhaseOffset', pi/4);


Fi_porog=abs(angle(modulate(mod_engine,0))-angle(modulate(mod_engine,1)))/2;


N=floor(tlen/(tdelay+pilot_len));

T=InterpolateRate/2; % т.е. Частота среза Фильтра fd/InterpolateRate

t=(-9:1/T:9);
%% SQRT Raised Cosine
hsqrt=4*R*(  cos((1+R)*pi.*t/T) + sin((1-R).*pi.*t/T)./(4*R.*t/T)  ) ./ (pi*sqrt(T).*(1-(4*R.*t/T).*(4*R.*t/T)) );
hsqrt_max=(pi+4*R-pi*R)/(pi*sqrt(T));
hsqrt=hsqrt./hsqrt_max;
hsqrt(round(length(hsqrt)/2))=1;
hsqrt(14)=-0.1888; % добавлять при R=0.2
hsqrt(24)=-0.1888; % добавлять при R=0.2

%% Make pilot symbol
some=reshape(hadamard(2^ceil(log2(sqrt(pilot_len)))),1,[]);   % придумываем какой-то маркер из +/-1
pilot=some(1:pilot_len)+1i*some(1:pilot_len);


s_transfer=[];
values_all=[];
for BERval=BERs
%% Transimeter делаем отсчеты на передающей стороне
x=[];
for z=1:N
    if tdelay>0
        values=randint(1,tdelay,M);
		values_all=[values_all values];
        x=modulate(mod_engine,values); % модуляция PAM
    end
	s_transfer=[s_transfer pilot x];
end


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
	rx_transfer=s_transfer_filt1.*exp(1i*t3*FreqOffset*2*pi+(0.1/fd)*randn(1,length(s_transfer_filt1)));
%      rx_transfer=rx_transfer.*exp(1i*pi/4);
 	rx_transfer = awgn(rx_transfer,BERval,'measured');  





%% Receiver  прием

rx_transfer_filt=conv(rx_transfer,hsqrt); % фильтр на приеме
rx_transfer_filt=rx_transfer_filt(cut_f_l:end-cut_f_l);


foffest_a=[];
foffest_a_filted=[];
angle_acum=0;
acum_len=0;
fir_acum=0;
fir_ftune_acum=0;
freq_offset_tune_fir=0;
freq_offset_tune_fir_a=[];
procents_old=0;

pilot_phases=[];
pilot_phases2=[];
mass2=[];
Ts=(pilot_len*InterpolateRate)*(1/(fd*2*pi)); % время символа
phase_acum=0;
prev_phase=0;
freq_offset_tune=0;
localt=0;
localt_prev=0;
scatter_array=[];

% filt_x=[0.0655    0.1107    0.1503    0.1735    0.1735    0.1503    0.1107    0.0655];
filt_x=[-0.00248011434398765,0.000241082753971028,0.00142015928202371,0.00354294733660859,0.00673584804482275,0.0110766542799096,0.0165655655252312,0.0230977826504043,0.0304661296987172,0.0383557265429229,0.0463686553822167,0.0540493984005852,0.0609207886287765,0.0665400621566358,0.0705174819169700,0.0725818317441924,0.0725818317441924,0.0705174819169700,0.0665400621566358,0.0609207886287765,0.0540493984005852,0.0463686553822167,0.0383557265429229,0.0304661296987172,0.0230977826504043,0.0165655655252312,0.0110766542799096,0.00673584804482275,0.00354294733660859,0.00142015928202371,0.000241082753971028,-0.00248011434398765];

for z=1:N-1
	rx_pilot=rx_transfer_filt(((z-1)*(tdelay*InterpolateRate+pilot_len*InterpolateRate)+1):((z-1)*(tdelay*InterpolateRate+pilot_len*InterpolateRate)+pilot_len*InterpolateRate));
    rx_pilot_mask=rx_pilot.*conj(pilotUP(1:length(rx_pilot)));
    
    Mdiv2=floor(length(rx_pilot_mask)/2);
    rx_pilot_R=Ml_array(rx_pilot_mask,length(rx_pilot));
    
    fdo=0.9999*(1/(2*pi))*InterpolateRate*pilot_len*(1/(2*pi*Ts)) * sum(smoof_window_W(1:Mdiv2-1,Mdiv2).*angle(conj(rx_pilot_R(1:Mdiv2-1)).*rx_pilot_R(2:Mdiv2))  );        
    
    fir_acum=fir_acum*(1-alpha1)+fdo;    
    f_offset=fdo; %fir_acum*alpha1;
    
    rx_transfer_filt_cor=rx_transfer_filt((z-1)*tframelen+1:z*tframelen).*exp(-1i*2*pi*(f_offset)*t4); %% двигаем сигнал обратно на (-offset
    rx_pilot2=rx_transfer_filt_cor(1:length(pilotUP));

    pcp=rx_pilot2(1:end-1)*conj(pilotUP(2:end)).';    

	pcp_a=angle(pcp);    

    phase_line_a=[];
    
    data_transfer_filtdata=rx_transfer_filt_cor(pilot_len*InterpolateRate+1+InterpolateRate/2:InterpolateRate:end);
    
    mass=[];
    phase_demod_acum=pcp_a; % инициализируем аккомулятор фазы посчитанным значением фазы пилот сигнала
    phase_demod_acum_x=exp(1i*pcp_a);
    phase_acum_prev=pcp_a;
    phase_acum_prev_x=exp(1i*pcp_a);
    phase_acum=pcp_a/alpha1;
    
    filt_array=pcp_a.*ones(1,FILTLEN);
    filt_array_x=exp(1i*pcp_a).*ones(1,FILTLEN);

   save_start_values;
   load_saved_values;
    
mmm_new_max=0;
f1=[];

sigg=[];

%% new variant
	 c_acum_phase=1;
     for zd=1:length(data_transfer_filtdata)
		val=data_transfer_filtdata(zd).*conj(c_acum_phase);
        sigg=[sigg val];

		val_dec=demodulate(demod_engine,val); % демодулируем PAM
        mass=[mass val_dec];		

		val_mod2=modulate(mod_engine,val_dec);
		c_phase_error=(val/abs(val)).*conj(val_mod2);
		c_acum_phase=c_acum_phase*(1-alpha2)+c_phase_error;
	 end % zd
%% new var find


    mass2=[mass2 mass];

  	foffest_a=[foffest_a f_offset.'];
end
%        scatterplot(mass2);
[number,ratio,individual] = biterr(mass2,values_all(1:length(mass2)));
rats_array=[rats_array ratio];
fprintf('Процент ошибки составляет %.4i, при их количестве %i на %i данных\n',ratio,number,length(mass2)*log2(M));
fprintf('Девиация ошибки %.2f dB\n',20*log10(std(foffest_a))); 
fprintf('Значение частот в среднем составило %.5f т.е. ошибка %.2f dB\n',mean(foffest_a),20*log10(FreqOffset-mean(foffest_a)));
end;
figure
% plot(mass2);
% hold on;
% plot(values_all(1:length(mass2)),'r');

%  figure
%  plot(pilot_phases)
%  hold on;
%  plot(pilot_phases2+2,'r');
%  plot(individual+4,'k');
%   hold off;
% scatterplot(scatter_array)
% scatterplot(data_transfer_filtdata.*exp(-1i*pcp_a)) 