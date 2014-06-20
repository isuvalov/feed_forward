clc
BERs=3:20;
BERs=75;
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
FreqOffset=1;
test_freq_d=0.05;
M=4;
FILTLEN=32;
R=0.2;

mass=[];

mod_engine=modem.pskmod('M',M,'PhaseOffset', pi/4 );
demod_engine=modem.pskdemod('M',M,'PhaseOffset', pi/4);


load ../frame_phase_init_I.txt;
load ../frame_phase_init_Q.txt;
load ../frame_I.txt
load ../frame_Q.txt

data_transfer_filtdata=frame_I+1i*frame_Q;
pcp=frame_phase_init_I+1i*frame_phase_init_Q;

%% new variant
     sigg=[];
     filt_array_x=ones(1,FILTLEN)*0;
     c_acum_phase_array=[];
     val_array=[];
     c_acum_phase_all=pcp;
     c_acum_phase=pcp;
     
     for zd=1:length(data_transfer_filtdata)
%    		val=data_transfer_filtdata(zd).*conj(c_acum_phase_all);        
        val=intcomplex_mul(real(data_transfer_filtdata(zd)),imag(data_transfer_filtdata(zd)),real(c_acum_phase_all),imag(c_acum_phase_all),1,1);
        sigg=[sigg val];
        val=floor(val/64);
        vv=val;
        if abs(real(vv))>127 
               fprintf('here\n');
               val=floor(val/16);
        elseif abs(imag(vv))>127 
               fprintf('here\n');
               val=floor(val/16);               
        end;        
                
     
        if abs(real(vv))>127 
               fprintf('here\n');
        elseif abs(imag(vv))>127 
               fprintf('here\n');
        end;          
        
        vx=big_signed2unsigned(real(vv),8);
        vy=big_signed2unsigned(imag(vv),8);
        c_acum_phase=table_array(vy*256+vx+1);

        
%         % !!!!table start!!!!!!
%         val_dec=demodulate(demod_engine,val); % демодулируем PAM
%         mass=[mass val_dec];		
% 
% 	    val_mod2=modulate(mod_engine,val_dec);
%         c_phase_error=(val).*conj(val_mod2);
%         
%         c_acum_phase=c_phase_error; 
%         if (abs(c_acum_phase)==0)
%             c_acum_phase=1;
%         else
%             c_acum_phase=c_acum_phase./abs(c_acum_phase);    
%         end;
%         % !!!!table end!!!!!!
        
        
        c_acum_phase=c_acum_phase*256;
        c_acum_phase_all=intcomplex_mul(real(c_acum_phase_all),imag(c_acum_phase_all),real(c_acum_phase),imag(c_acum_phase),0,3);

            if (abs(imag(c_acum_phase_all))>16384 || abs(real(c_acum_phase_all))>16384 )
                c_acum_phase_all=c_acum_phase_all/4;
            end; 
%         shift_phases=[c_acum_phase shift_phases(1:end-1)];
        
%         c_acum_phase_array=[c_acum_phase_array c_acum_phase];
        c_acum_phase_array=[c_acum_phase_array c_acum_phase];

	 end % zd
%% new var find


% end
%        scatterplot(mass2);
% [number,ratio,individual] = biterr(mass,values_all(1:length(mass)));
% rats_array=[rats_array ratio];
% fprintf('Процент ошибки составляет %.4i, при их количестве %i на %i данных\n',ratio,number,length(mass2)*log2(M));
% end;
% figure
scatterplot(sigg)
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