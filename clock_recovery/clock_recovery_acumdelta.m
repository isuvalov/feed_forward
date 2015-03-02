clc
BERs=3:20;
BERs=379;
rats_array=[];
fd=200;      % тактовая частота АЦП/ЦАП
% pilot_len=250;  % длина марекера по которому определяется расстройка в черне
pilot_len=64;  % длина марекера по которому определяется расстройка в черне
InterpolateRate=4;
PilotsNum=1; % количество кадров с пилотами при симуляции системы 
tdelay=4000;        % длина полезного информации которая стоит между маркерами
% tlen=PilotsNum*(2*tdelay+pilot_len*InterpolateRate); %201000; % длина всех отсчетов
tlen=(PilotsNum)*(tdelay+pilot_len); %201000; % длина всех отсчетов
alpha1=0.2;      % коэффициент усреднения, чем он меньше тем больше усреднение
alpha2=0.1;
 FreqOffset=0.5;
  FreqOffset=0.000;
test_freq_d=0.00;
M=4;
FILTLEN=32;
R=0.2;

mod_engine=modem.pskmod('M',M,'PhaseOffset', 0);
demod_engine=modem.pskdemod('M',M,'PhaseOffset', 0);


Fi_porog=abs(angle(modulate(mod_engine,0))-angle(modulate(mod_engine,1)))/2;


N=floor(tlen/(tdelay+pilot_len));

T=InterpolateRate/2; % т.е. Частота среза Фильтра fd/InterpolateRate

t=(-9:1/T:9);
%% SQRT Raised Cosine
hsqrt=4*R*(  cos((1+R)*pi.*t/T) + sin((1-R).*pi.*t/T)./(4*R.*t/T)  ) ./ (pi*sqrt(T).*(1-(4*R.*t/T).*(4*R.*t/T)) ); % sqrt SQRT Raised Cosine
hsqrt_max=(pi+4*R-pi*R)/(pi*sqrt(T));
hsqrt=hsqrt./hsqrt_max;
hsqrt(round(length(hsqrt)/2))=1;
hsqrt(14)=-0.1888; % добавлять при R=0.2
hsqrt(24)=-0.1888; % добавлять при R=0.2

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
        values=randint(1,tdelay,M);

		values_all=[values_all values];
        x=modulate(mod_engine,values); % модуляция PAM
    end
	s_transfer=[s_transfer pilot x];
end
         s_transfer=[pilot modulate(mod_engine,repmat([0 1 2 3 0 1 2 3],1,floor(tdelay/8)))];
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
rx_transfer=s_transfer_filt1.*exp(1i*t3*FreqOffset*2*pi);      
 	rx_transfer = awgn(rx_transfer,BERval,'measured');  





%% Receiver  прием

rx_transfer_filt=conv(rx_transfer,hsqrt_one); % фильтр на приеме
rx_transfer_filt=rx_transfer_filt(cut_f_l:end-cut_f_l);
rx_transfer_filt=rx_transfer_filt./max(real(rx_transfer_filt));
% rx_transfer_filt=rx_transfer;


%% clock recovery
sigg=[];

prev_val=0;
phase_st=0;
CIC_degree=12;
CICz=zeros(1,2^CIC_degree);
CIC_second_prev=0;
angle_of_CICmod_prev=0;
global_ce=0;
phase_error_CIC=0;
phase_error_CIC_minus_prev=0;
phase_error_CIC_minus_prev_ii_prev=0;
phase_error_CIC_mod_prev=0;
mu=1;
minusof_j=1;

alpha_delta=0.01;
fir_acum=0;

mu_array=[];
farrow_a=zeros(4,1);

feedforward_PIF=0;
PSK_SIZE=M;

%% Calc start phase (Fi0)
    pcp=rx_transfer_filt(1:length(pilotUP)-1)*conj(pilotUP(2:end)).';    
	pcp_a=angle(pcp);    


                                                      %% new variant
     sigg=[];
     
phase_st=0;
CIC_degree=12;
CICz=zeros(1,2^CIC_degree);
CIC_second_prev=0;
angle_of_CICmod_prev=0;
global_ce=0;
     
     filt_array_x=ones(1,FILTLEN)*0;
     c_acum_phase_array=[];
     val_array=[];
	 c_acum_phase_all=exp(1i*pcp_a);
     c_acum_phase=exp(1i*pcp_a);
     c_acum_phase_angle=pcp_a;
     c_phase_error_prev=pcp_a;
%      LATT=1;
%      shift_phases=zeros(1,LATT)*exp(1i*pcp_a);
     c_phase_error_norm=1;
     fir_acum_a=[];
     c_phase_error_delta_a=[];
     % InterpolateRate
     for zd=length(pilotUP)+17:1:length(rx_transfer_filt)        
   		val=rx_transfer_filt(zd).*conj(c_acum_phase_all);        
        val_c=val/abs(val);
        
        
    magnetude=abs(rx_transfer_filt(zd))^2;
    
     phase_st=mod((2*pi/M)+phase_st,2*pi); %# pi/2 because PSK-4
    
    
%      resignal=(magnetude)*exp(1i*phase_st);
       resignal=1*exp(1i*phase_st);

    CIC_first=resignal-CICz(2^CIC_degree);
    CICz=[resignal CICz(1:(2^CIC_degree)-1)];
    
    CIC_second=CIC_first+CIC_second_prev;
    CIC_end=CIC_second_prev/(2^CIC_degree);
    CIC_second_prev=CIC_second;    
    
    angle_of_CIC=angle(CIC_end)+phase_st;
    angle_of_CICmod=mod(angle_of_CIC,2*pi);    
    angle_of_CICmod=angle_of_CICmod-pi;
    
     if ((angle_of_CICmod_prev<0) && (angle_of_CICmod>=0))
%     if ((angle_of_CICmod_prev>0) && (angle_of_CICmod<=0))
        global_ce=1;
    else
        global_ce=0;
    end;        
   angle_of_CICmod_prev=angle_of_CICmod;
   
        if (global_ce==1) 
            sigg=[sigg val];

            val_dec=demodulate(demod_engine,val); % демодулируем PAM
    %         mass=[mass val_dec];		

            val_mod2=modulate(mod_engine,val_dec);
            c_phase_error=(val_c).*conj(val_mod2);
            c_phase_error=c_phase_error./abs(c_phase_error);

            angl_c_phase_error=angle(c_phase_error)/(abs(rx_transfer_filt(zd)));
            if (angl_c_phase_error>pi)
                angl_c_phase_error=-(angl_c_phase_error-pi);
            elseif (angl_c_phase_error<-pi)
                        angl_c_phase_error=-(angl_c_phase_error+pi);
            end
    %         c_phase_error_delta=angle( c_phase_error.*conj(c_phase_error_prev)   );        
            c_phase_error_delta=angl_c_phase_error-c_phase_error_prev;        

    %         if (abs(c_phase_error_delta)>Fi_porog) 
    %             c_phase_error_delta=-(c_phase_error_delta-;
    %         end




            c_phase_error_prev=angl_c_phase_error;


            fir_acum=fir_acum*(1-alpha_delta)+c_phase_error_delta;    
            fir_acum=fir_acum;

            c_phase_error_delta_a=[c_phase_error_delta_a c_phase_error_delta];
            fir_acum_a=[fir_acum_a fir_acum];

    %         c_acum_phase_all=c_acum_phase_all.*c_phase_error;
    %           c_acum_phase_all=(exp(1i*(pcp_a-zd*fir_acum*alpha_delta)));

    %           c_acum_phase_all=(exp(1i*(pcp_a-zd*c_phase_error_delta)));
    %            c_acum_phase_all=c_acum_phase_all.*exp(1i*0.5*c_phase_error_delta); % ok
         c_acum_phase_all=c_acum_phase_all.*exp(1i*(fir_acum*alpha_delta*2));

    %          c_acum_phase_all=(exp(1i*((0)*fir_acum*alpha_delta*(zd-3))));



    %         c_phase_error_norm=c_phase_error./abs(c_phase_error);
            c_acum_phase_array=[c_acum_phase_array c_acum_phase_all];
        end % global_ce
	 end % zd
%% new var find



%         plot(demodulate(demod_engine,exp(1i*(sigg*2-pi)))); % ???????????? PAM
%  plot(abs(sigg));
        
%  plot(sigg)

% figure
% plot(fir_acum_a);
%    scatterplot(sigg(end/3:end))

  scatterplot(sigg(1:end/2))
%   scatterplot(sigg(end-2000:end))
% plot(real(sigg(end-2000:end)))

% scatterplot(data_transfer_filtdata)
% plot(angle(c_acum_phase_array))
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