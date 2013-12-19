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
    phase_demod_acum_x=pcp;
    phase_acum_prev=pcp_a;
    phase_acum_prev_x=exp(1i*pcp_a);
    phase_acum=pcp_a/alpha1;
    
    filt_array=pcp_a.*ones(1,FILTLEN);
    filt_array_x=exp(1i*pcp_a).*ones(1,FILTLEN);
%     for zd=1:length(data_transfer_filtdata)
%         val=data_transfer_filtdata(zd)*exp(-1i*phase_demod_acum); % вращаем комплексную точку обратно, так чтоб она стала в решетку
% %         scatter_array=[scatter_array val];
%         val_dec=demodulate(demod_engine,val); % демодулируем PAM
%         val_mod2=modulate(mod_engine,val_dec);
%         c=corrcoef( [0 val_mod2],[0 val] ); % вычисляем коэф корреляции довернутого значения с демодулированным
%         c_x=val.*conj(val_mod2);
%         % данная коррекция заметна только при больших растояниях между пилотами                
%              phase_demod_acum=phase_demod_acum+angle(c(1,2));  % берем фазу коэффициента корреляции
% %          phi_err=(angle(data_transfer_filtdata(zd))-phase_demod_acum)-angle(val_mod2);
% %          if (phi_err<0)
% %              phi_err=phi_err+2*pi;
% %          end
% %          phase_demod_acum=phase_demod_acum-phi_err;  % берем фазу коэффициента корреляции
%         phase_demod_acum_x=phase_demod_acum_x.*c_x;
%         
%         
%         
%            phase_acum=phase_acum*(1-alpha1)+phase_demod_acum;
% %           phase_acum=sum(filt_array.*[0.0047    0.0055    0.0061    0.0066    0.0068    0.0068    0.0066    0.0061    0.0055    0.0047])/(0.0189*pi);
% %          filt_array=[phase_demod_acum filt_array(1:FILTLEN-1)];
%         
% %         phase_acum_x_re=phase_acum_x_re*(1-alpha1)+
% %         if ((phase_acum_prev>pi)&&(phase_demod_acum<0))
% %             dphase=phase_demod_acum+2*pi-phase_acum_prev;
% %         elseif ((phase_acum_prev<-pi)&&(phase_demod_acum>0))
% %             dphase=phase_demod_acum-2*pi-phase_acum_prev;
% %         end
%          dphase=phase_demod_acum-phase_acum_prev;
%         if (dphase>Fi_porog)
%             cccc=1;
%             val_dec=demodulate(demod_engine,val*exp(1i*(Fi_porog*2)*cccc)); % Делаем коррекцию данных уже опираясь на линейность фазы
%         elseif (dphase<-Fi_porog)
%             cccc=-1;
%             val_dec=demodulate(demod_engine,val*exp(1i*(Fi_porog*2)*cccc));
%         else
%             cccc=0;
%         end
%         phase_demod_acum=phase_demod_acum-cccc*2*Fi_porog;  % сейчас phase_demod_acum становиться быстро большим и убигает за разрядность
% %         while (phase_demod_acum>2*pi)||(phase_demod_acum<-2*pi)
% %             if (phase_demod_acum>2*pi)
% %                    phase_demod_acum=phase_demod_acum-2*pi;
% %             elseif (phase_demod_acum<-2*pi)
% %                    phase_demod_acum=phase_demod_acum+2*pi;
% %             end
% %         end
%         pilot_phases2=[pilot_phases2 cccc];
%          phase_acum_prev=phase_acum*alpha1;
%         phase_acum_prev=phase_acum;
%         pilot_phases=[pilot_phases phase_demod_acum];
%         mass=[mass val_dec];
%     end
    



f1=[];
f2=[];
    for zd=1:length(data_transfer_filtdata)
%         val=data_transfer_filtdata(zd)*exp(-1i*phase_demod_acum); % вращаем комплексную точку обратно, так чтоб она стала в решетку
        val=data_transfer_filtdata(zd).*conj(phase_demod_acum_x);
%         scatter_array=[scatter_array val];
        val_dec=demodulate(demod_engine,val); % демодулируем PAM
        val_mod2=modulate(mod_engine,val_dec);
        c=corrcoef( [0 val_mod2],[0 val] ); % вычисляем коэф корреляции довернутого значения с демодулированным
        % данная коррекция заметна только при больших растояниях между пилотами                
        phi_err=angle(  val.*conj(val_mod2)  );
        phi_err_x=val.*conj(val_mod2);
        phase_demod_acum=phase_demod_acum+phi_err;  % берем фазу коэффициента корреляции        
       
        
%         
        
        phase_demod_acum_x=phase_demod_acum_x.*phi_err_x;
%          phase_demod_acum_x=phase_demod_acum_x./(norm(phase_demod_acum_x)*1.1);
        mmm=max([abs(real(phase_demod_acum_x))  abs(imag(phase_demod_acum_x))]);
        phase_demod_acum_x=phase_demod_acum_x./mmm;
        
    
%         phase_demod_acum_x=phase_demod_acum_x./( abs(phase_demod_acum_x) );


		
        phase_acum=sum(filt_array.*filt_x);
        filt_array=[phase_demod_acum filt_array(1:FILTLEN-1)];
        
        phase_acum_x=sum(real(filt_array_x).*filt_x)+1i*sum(imag(filt_array_x).*filt_x);
        filt_array_x=[phase_demod_acum_x filt_array_x(1:FILTLEN-1)];
        
        f1=[f1 phi_err];
%         f2=[f2 angle(phase_acum_x)];
        
%         phase_acum=angle(phase_acum_x);
        phase_delta=phase_demod_acum-phase_acum_prev;
        phase_delta_x=phase_demod_acum_x.*conj(phase_acum_prev_x);
        phase_delta=angle(phase_delta_x);
        
%         if (imag(phase_delta_x)>=0)
%              im_ph=1;
%         else
%              im_ph=0;
%         end
%         
%         if (real(phase_delta_x)>=0)
%              re_ph=1;
%         else
%              re_ph=0;
%         end
        
          if (phase_delta>Fi_porog)
%          if (   ((imag(phase_delta_x)>imag(exp(1i*Fi_porog))) && (re_ph==1) )  || ((re_ph==0)&&(im_ph==1)) )
            cccc=1;
%             val_dec=demodulate(demod_engine,val*exp(1i*(Fi_porog*2)*cccc)); % Делаем коррекцию данных уже опираясь на линейность фазы
            val_dec=demodulate(demod_engine,val.*exp(-1i*cccc*2*Fi_porog)); % Делаем коррекцию данных уже опираясь на линейность фазы
         elseif (phase_delta<-Fi_porog)
%          elseif (   ((imag(phase_delta_x)<imag(exp(-1i*Fi_porog))) && (re_ph==1) )  || ((re_ph==0)&&(im_ph==1)) )
            cccc=-1;
            val_dec=demodulate(demod_engine,val.*exp(-1i*cccc*2*Fi_porog));
        else
            cccc=0;
        end
        
        phase_demod_acum=phase_demod_acum-cccc*2*Fi_porog;
        phase_demod_acum_x=phase_demod_acum_x.*exp(-1i*cccc*2*Fi_porog);
        
        pilot_phases2=[pilot_phases2 cccc];
%         phase_acum_prev=phase_acum*alpha1;
         phase_acum_prev=phase_acum;
         phase_acum_prev_x=phase_acum_x;
        pilot_phases=[pilot_phases phase_demod_acum];
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