
clc
BERs=3:20;
% BERs=4;
BERs=40;
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



mod_engine=modem.pskmod(M);
demod_engine=modem.pskdemod(M);

Fi_porog=angle(modulate(mod_engine,1))/2;


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
%     if (1==0) % ALL IGNORE
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
% end % ALL IGNORE

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
    phase_demod_acum_x=pcp;
    phase_acum_prev=pcp_a;
    phase_acum_prev_x=exp(1i*pcp_a);
    phase_acum=pcp_a/alpha1;
    
    filt_array=pcp_a.*ones(1,FILTLEN);

    filt_array_x=exp(1i*pcp_a).*ones(1,FILTLEN);


%    save_start_values;
   clear all;     
  load_saved_values;
%   save_ints_to_datfile;
ACUM_SIZE=18;

TANGLE_SIZE=8;
TACUM_SIZE=8;

    filt_array_int=floor(pcp_a*(2^(ACUM_SIZE-2))).*ones(1,FILTLEN);
    filt_x_int=round( filt_x.*(2^(15)) );
%     phase_acum_prev_int=floor(floor(phase_demod_acum*(2^ACUM_SIZE)));
    phase_acum_prev_int=floor(floor(phase_demod_acum*(2^(ACUM_SIZE-6))));
    phase_demod_acum_int0=floor(phase_demod_acum*(2^(ACUM_SIZE)));
    Fi_porog_int=floor(Fi_porog*256);
f1=[];
f2=[];
val_dec_prev=0;

loglines_int=[];
log_string=[];

%%%%%%%%%
% in_val_phase_int0 in_val_phase_int phase_demod_acum_int % phase_demod_acum_MOD_int 
% phi_err_int val_angle_int phase_demod_acum_int0(witherr) phase_acum_int(filt) phase_delta_int
% phase_delta_int_short cccc phase_demod_acum_int0(new) 
%%%%%%%%%%%



Nbit=9;
NBitVal=(2^(Nbit-1))-1;
% NA_bit=16;
% NA_bitVal=(2^(NA_bit-1))-1;
% 164 ошибки!
val_a=[];
phase_dem=zeros(1,length(data_transfer_filtdata));
    for zd=1:length(data_transfer_filtdata)   
        in_val_phase_real=angle(data_transfer_filtdata_int(zd)); % тут у нас +/-PI        
        in_val_phase_int0=floor(in_val_phase_real*(2^ACUM_SIZE));
        log_string=[log_string in_val_phase_int0];
        in_val_phase_int0_mul=in_val_phase_int0*10474;
        in_val_phase_int0_mul_div=floor(in_val_phase_int0_mul/(2^25));
        in_val_phase_int=floor((in_val_phase_int0/pi)*NBitVal/(2^ACUM_SIZE));
        log_string=[log_string in_val_phase_int];


        if (zd==40) 
            fprintf('here\n');
        end
%             phase_demod_acum_int0=floor(phase_demod_acum*(2^18)); % если откоментировать эту строку то будет рабочий алгоритм с веществнной веткой
%           phase_demod_acum_int0
        if (zd==1)
            phase_demod_acum_int=floor((phase_demod_acum_int0/pi)*NBitVal/(2^(ACUM_SIZE)));
        else
            phase_demod_acum_int=floor((phase_demod_acum_int0/pi)*NBitVal/(2^(ACUM_SIZE-1)));
        end
        
        log_string=[log_string phase_demod_acum_int];
    
%         phase_demod_acum_int0=floor((phase_demod_acum_int0/pi)*NBitVal/(2^ACUM_SIZE));
        
%         phase_demod_acum_MOD_int=bitand(abs(phase_demod_acum_int),(2*NBitVal));
        phase_demod_acum_MOD_int=bitand(abs(phase_demod_acum_int),511);
        if (phase_demod_acum_int<0)
%             phase_demod_acum_MOD_int=2*NBitVal-phase_demod_acum_MOD_int;
               phase_demod_acum_MOD_int=511-phase_demod_acum_MOD_int;
        end

        log_string=[log_string phase_demod_acum_MOD_int];

        %%%%%%%%%%%% table %%%%%%%%%%%
        in_val_phase_int=floor(in_val_phase_int/(2^(Nbit-TANGLE_SIZE)))*(2^(Nbit-TANGLE_SIZE));
        phase_demod_acum_MOD_int=floor(phase_demod_acum_MOD_int/(2^(Nbit-TACUM_SIZE)))*(2^(Nbit-TACUM_SIZE));
        
        in_val_phase=pi*in_val_phase_int/NBitVal;
        phase_demod_acum_MOD=pi*phase_demod_acum_MOD_int/NBitVal;
         val=exp(1i*(in_val_phase-phase_demod_acum_MOD));
         val_a=[val_a val];
        val_dec=demodulate(demod_engine,val); % ???????????? PAM
        val_mod2=modulate(mod_engine,val_dec);
        c=corrcoef( [0 val_mod2],[0 val] ); % ????????? ???? ?????????? ??????????? ???????? ? ????????????????
        phi_err_real=angle(  val.*conj(val_mod2)  ); % Считаем что тоже +/-PI
        phi_err_int=floor(((phi_err_real)*NBitVal)/2);
%         val_angle_int=angle(val)*NBitVal/pi;
        val_angle_int=floor(angle(val)*NBitVal);
        val_angle_int=floor(val_angle_int/2);
        %%%%%%%%%%%% table %%%%%%%%%%%
%         if (val_angle_int>NBitVal*2) 
%            fprintf('here\n');
%         end
%         val_angle_int=val_angle_int*2;
%         phi_err_int=phi_err_int*2;
        


        log_string=[log_string phi_err_int];
        log_string=[log_string val_angle_int];


        phi_err=phi_err_int/NBitVal;
        val_angle_back=2*val_angle_int/NBitVal;
        
        phase_demod_acum=phase_demod_acum+phi_err;  % ????? ???? ???????????? ??????????        
%         phase_demod_acum_int0=phase_demod_acum_int0/(2^11)+phi_err_int;
        phase_demod_acum_int0=floor(phase_demod_acum_int0/2)+phi_err_int*(2^(ACUM_SIZE-7-1));        
        log_string=[log_string phase_demod_acum_int0];
%         phase_demod_acum_int0_sm=floor(phase_demod_acum_int0/2);
        phase_demod_acum_fromint=phase_demod_acum_int0/(2^ACUM_SIZE);
%         phase_demod_acum_fromint=phase_demod_acum_int0/(2^7);
        
        phase_acum=sum(filt_array.*filt_x);
        filt_array_int2=floor(filt_array_int/(2^7));
         phase_acum_int_z=floor(sum(floor(filt_array_int2.*floor(filt_x_int/4))));
         phase_acum_int=floor(sum(filt_array_int2.*filt_x_int)./(2^(11+1)));

        log_string=[log_string phase_acum_int];

%          phase_acum_int=floor(sum(floor(filt_array_int.*filt_x_int))/(2^(ACUM_SIZE+1)));
%           phase_acum_int=floor(phase_acum_int*(2^6));
%          phase_acum_int=floor(phase_acum_int*(2^5));
        % =-3072
        
%         phase_acum_int=floor(phase_acum_int/(2^(4)));
        filt_array=[phase_demod_acum filt_array(1:FILTLEN-1)];
         filt_array_int=[floor(phase_demod_acum_int0/(2^1)) filt_array_int(1:FILTLEN-1)];        
%         filt_array_int=[floor(phase_demod_acum_int0_sm/(2^1)) filt_array_int(1:FILTLEN-1)];        
%         filt_array(1:7)
%          filt_array_int(1:7)/(2^(ACUM_SIZE-2))
        f1=[f1 phi_err];

        phase_delta=phase_demod_acum-phase_acum_prev;
        phase_delta_int=phase_demod_acum_int0-phase_acum_prev_int*(2^5);
        log_string=[log_string phase_delta_int];
        phase_delta_int_short=floor(phase_delta_int/(2^(ACUM_SIZE-8-1)));
        log_string=[log_string phase_delta_int_short];
           %%%%%%%%%

%              if (phase_delta>Fi_porog)
            if (phase_delta_int_short>Fi_porog_int)
            cccc=1;
%              val_dec=demodulate(demod_engine,val.*exp(-1i*cccc*2*Fi_porog)); % Делаем коррекцию данных уже опираясь на линейность фазы
               val_dec=demodulate(demod_engine,exp(1i*cccc*2*Fi_porog+1i*val_angle_back)); % Делаем коррекцию данных уже опираясь на линейность фазы
               phase_dem(zd)=val_angle_int+Fi_porog_int*2*cccc;
%             elseif (phase_delta<-Fi_porog)
              elseif (phase_delta_int_short<-Fi_porog_int)
            cccc=-1;
%              val_dec=demodulate(demod_engine,val.*exp(-1i*cccc*2*Fi_porog));
               val_dec=demodulate(demod_engine,exp(1i*cccc*2*Fi_porog+1i*val_angle_back));
               phase_dem(zd)=val_angle_int+Fi_porog_int*2*cccc;               
        else
            cccc=0;
            val_dec=demodulate(demod_engine,exp(1i*cccc*2*Fi_porog+1i*val_angle_back));
            phase_dem(zd)=val_angle_int+Fi_porog_int*2*cccc;
          end
          log_string=[log_string cccc];
          phase_demod_acum=phase_demod_acum-cccc*1*Fi_porog;
           phase_demod_acum_int0=phase_demod_acum_int0-cccc*1*Fi_porog_int*(2^(ACUM_SIZE-(Nbit-1)-1));
          log_string=[log_string phase_demod_acum_int0];
%           phase_demod_acum_int0=phase_demod_acum_int0_sm-cccc*1*Fi_porog_int*(2^(ACUM_SIZE-(Nbit-1)-1));
          
            loglines_int=[loglines_int; log_string];
            log_string=[];

        
        pilot_phases2=[pilot_phases2 cccc];
%         phase_acum_prev=phase_acum*alpha1;
         phase_acum_prev=phase_acum;
         phase_acum_prev_int=phase_acum_int;
%          phase_acum_prev_x=phase_acum_x;
%         pilot_phases=[pilot_phases phase_demod_acum];
%         pilot_phases=[pilot_phases phase_demod_acum_int0/(2^ACUM_SIZE)];
        pilot_phases=[pilot_phases phase_demod_acum_int0];
        
        mass=[mass val_dec];
    end







    mass2=[mass2 mass];

  	foffest_a=[foffest_a f_offset.'];
end
%        scatterplot(mass2);
[number,ratio,individual] = biterr(mass2,values_all(1:length(mass2)));
rats_array=[rats_array ratio];
fprintf('Процент ошибки составляет %.4i, при их количестве %i на %i данных\n',ratio,number,length(mass2));
fprintf('Девиация ошибки %.2f dB\n',20*log10(std(foffest_a))); 
fprintf('Значение частот в среднем составило %.5f т.е. ошибка %.2f dB\n',mean(foffest_a),20*log10(FreqOffset-mean(foffest_a)));
end;
 figure
 plot(pilot_phases)
 hold on;
 plot(pilot_phases2+2,'r');
 plot(individual+4,'k');
  plot(f1,'g');
  hold off;
% scatterplot(scatter_array)
% scatterplot(data_transfer_filtdata.*exp(-1i*pcp_a)) 