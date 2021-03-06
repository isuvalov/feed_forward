% ������ �� ����� back_to_phase_maketable_int_div2.m 
%%
mpath='D:\John\Nien\vhdl\';
mpath='D:\Projects\Nienshans\Feed_Forward\vhdl\';

load ([mpath 'frame_phase_init_I.txt'],'-ascii');
load ([mpath 'frame_phase_init_Q.txt'],'-ascii');
load ([mpath 'frame_I.txt'],'-ascii');
load ([mpath 'frame_Q.txt'],'-ascii');
load ([mpath 'frame_phase.txt'],'-ascii');
load ([mpath 'frame_phaseinit.txt'],'-ascii');
% frame_phaseinit=frame_phaseinit/(8);
clc

%%


BERs=3:20;
BERs=4;
rats_array=[];
fd=200;      % �������� ������� ���/���
% pilot_len=250;  % ����� �������� �� �������� ������������ ���������� � �����
pilot_len=64;  % ����� �������� �� �������� ������������ ���������� � �����
InterpolateRate=4;
PilotsNum=1; % ���������� ������ � �������� ��� ��������� ������� 
tdelay=10000;        % ����� ��������� ���������� ������� ����� ����� ���������
% tlen=PilotsNum*(2*tdelay+pilot_len*InterpolateRate); %201000; % ����� ���� ��������
tlen=(PilotsNum+1)*(tdelay+pilot_len); %201000; % ����� ���� ��������
alpha1=0.2;      % ����������� ����������, ��� �� ������ ��� ������ ����������
alpha2=0.1;
% FreqOffset=1;
FreqOffset=0;
M=4;
FILTLEN=32;
% FILTLEN=64;
R=0.2;

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
Ts=(pilot_len*InterpolateRate)*(1/(fd*2*pi)); % ����� �������
phase_acum=0;
prev_phase=0;
freq_offset_tune=0;
localt=0;
localt_prev=0;
scatter_array=[];

Nbit=16;
NN=(2^Nbit-1)-1;
M=4;
filt_x=[-0.00248011434398765,0.000241082753971028,0.00142015928202371,0.00354294733660859,0.00673584804482275,0.0110766542799096,0.0165655655252312,0.0230977826504043,0.0304661296987172,0.0383557265429229,0.0463686553822167,0.0540493984005852,0.0609207886287765,0.0665400621566358,0.0705174819169700,0.0725818317441924,0.0725818317441924,0.0705174819169700,0.0665400621566358,0.0609207886287765,0.0540493984005852,0.0463686553822167,0.0383557265429229,0.0304661296987172,0.0230977826504043,0.0165655655252312,0.0110766542799096,0.00673584804482275,0.00354294733660859,0.00142015928202371,0.000241082753971028,-0.00248011434398765];
mod_engine=modem.pskmod('M',M,'PhaseOffset', 0 );
demod_engine=modem.pskdemod('M',M,'PhaseOffset', 0 );
Fi_porog=abs(angle(modulate(mod_engine,0))-angle(modulate(mod_engine,1)))/2;

data_transfer_filtdata_int_pre=frame_I+1i*frame_Q;
data_transfer_filtdata_int_pre=data_transfer_filtdata_int_pre(27:end);
frame_phase=frame_phase(7:end);
data_transfer_filtdata_int=data_transfer_filtdata_int_pre(1:InterpolateRate:end);

file_len=length(data_transfer_filtdata_int)-10;
 file_len=7900;
%  file_len=4000; 

%%%%%%%%%
% data_transfer_filtdata_int
% in_val_phase_int0 in_val_phase_int phase_demod_acum_int % phase_demod_acum_MOD_int 
% phi_err_int val_angle_int phase_demod_acum_int0(notadderr) phase_demod_acum_int0(witherr)
% phase_acum_prev_int phase_acum_prev_int*2^5 phase_delta_int
% phase_delta_int_short cccc phase_demod_acum_int0(new) 
%%%%%%%%%%%



Nbit=9;
NBitVal=(2^(Nbit-1))-1;

ACUM_ADD=1;
ACUM_SIZE=18;

TANGLE_SIZE=8;
TACUM_SIZE=8;

% TANGLE_SIZE=Nbit;
% TACUM_SIZE=Nbit;

loglines_int=[];
log_string=[];
mass2=[];
mass=[];

% frame_phase_init_I=0;
% frame_phase_init_Q=0;


    phase_demod_acum=angle(frame_phase_init_I+1i*frame_phase_init_Q);
    pcp_a=angle(frame_phase_init_I+1i*frame_phase_init_Q);
    
    filt_array_int=floor(pcp_a*(2^(ACUM_SIZE-2))).*ones(1,FILTLEN);
    filt_x_int=round( filt_x.*(2^(15)) );
    
%     filt_array_int=floor(filt_array_int/(2^2)); % fpga
    
%      phase_acum_prev_int=floor(floor(phase_demod_acum*(2^(ACUM_SIZE-6))));

%     phase_acum_prev_int=floor(phase_demod_acum*(2^(ACUM_SIZE))/2);

    phase_demod_acum_int0=frame_phaseinit*2; %floor(phase_demod_acum*(2^(ACUM_SIZE-6))/2);
    phase_acum_prev_int=2*floor(frame_phaseinit/(2^4));  
    filt_array_int=floor(frame_phaseinit/(2^3)).*ones(1,FILTLEN);
    
    
    Fi_porog_int=floor(Fi_porog*(2^(Nbit-1)));
f1=[];
f2=[];

phase_demod_fi_matlab=[];
phase_demod_fi_my=[];
val_a=[];
phase_dem=zeros(1,file_len);

MULTVAL=floor((2^ACUM_SIZE)/pi);

    for zd=1:file_len           
        log_string=[log_string real(data_transfer_filtdata_int(zd))];         
        if (zd==1)
             in_val_phase_real=phase_demod_acum;
             in_val_phase_int0=floor(in_val_phase_real*(2^((ACUM_SIZE))));
             in_val_phase_int0=frame_phaseinit*2;
%              in_val_phase_int0_mul=floor(in_val_phase_int0*hex2dec('145F3')); % = (2^18)/pi=145F3
            in_val_phase_int0_mul=floor(in_val_phase_int0*MULTVAL); % = (2^18)/pi=145F3
            in_val_phase_int0_mul_div=floor(in_val_phase_int0_mul/(2^(ACUM_SIZE+(Nbit-1)))); % --= sample_init_ok
        else
            in_val_phase_real=angle(data_transfer_filtdata_int(zd)); % ��� � ��� +/-PI        
%             in_val_phase_int0_mul=floor(phase_demod_acum_int0*hex2dec('145F3'));
            in_val_phase_int0_mul=floor(phase_demod_acum_int0*MULTVAL);            
            in_val_phase_int0_mul_div=floor(in_val_phase_int0_mul/(2^(ACUM_SIZE+(Nbit-1))));
            in_val_phase_int0=frame_phase(zd)*2;            
        end;
        
        in_val_phase_int=floor(0.5*in_val_phase_int0*81/(2^(ACUM_SIZE-1)));

        log_string=[log_string in_val_phase_int0];        
        log_string=[log_string in_val_phase_int];

        if (zd==3925) 
            fprintf('here\n');
        end
        
        phase_demod_acum_int=in_val_phase_int0_mul_div;        
         log_string=[log_string phase_demod_acum_int]; % This is in FPGA=phase_demod_acum_start
    
        phase_demod_acum_int=floor(phase_demod_acum_int/2); 
         

         phase_demod_acum_MOD_int=bitand(abs(phase_demod_acum_int),511);

        log_string=[log_string phase_demod_acum_MOD_int];
        
        %%%%%%%%%%%% table %%%%%%%%%%%
%           in_val_phase_int=floor(in_val_phase_int/2);
%         phase_demod_acum_MOD_int=floor(phase_demod_acum_MOD_int/2);


        in_val_phase_int=floor(in_val_phase_int/(2^(Nbit-TANGLE_SIZE)))*(2^(Nbit-TANGLE_SIZE));       % ��� ���������� ���� ������� �������� ������ ������������������  
        phase_demod_acum_MOD_int=floor(phase_demod_acum_MOD_int/(2^(Nbit-TACUM_SIZE)))*(2^(Nbit-TACUM_SIZE)); % �� ����� ���������� ������� ���-�� ������� �� FPGA
        
        in_val_phase=pi*in_val_phase_int/NBitVal;
        phase_demod_acum_MOD=pi*phase_demod_acum_MOD_int/(NBitVal);
         val=exp(1i*(in_val_phase-phase_demod_acum_MOD));
         
         
         val_a=[val_a val];
        val_dec=demodulate(demod_engine,val); % ???????????? PAM
        val_mod2=modulate(mod_engine,val_dec);
        c=corrcoef( [0 val_mod2],[0 val] ); % ????????? ???? ?????????? ??????????? ???????? ? ????????????????
        phi_err_real=angle(  val.*conj(val_mod2)  ); % ������� ��� ���� +/-PI
        
        phi_err_int=floor(((phi_err_real)*NBitVal)/2);  % in FPGA!!!

        val_angle_int=floor(angle(val)*NBitVal);
        val_angle_int=floor(val_angle_int/2);
        %%%%%%%%%%%% table %%%%%%%%%%%

        


        log_string=[log_string phi_err_int];
        log_string=[log_string val_angle_int];

        val_angle_back=2*val_angle_int/NBitVal;
        
        log_string=[log_string phase_demod_acum_int0]; % without err
        phase_demod_acum_int0=floor(phase_demod_acum_int0/2)+phi_err_int*(2^(ACUM_SIZE-7-1));    % in FPGA
        log_string=[log_string phase_demod_acum_int0];

  		[phase_acum_int,filt_array_int]=filt_like_fpga(floor(phase_demod_acum_int0/(2^5)),filt_array_int);


		log_string=[log_string phase_acum_prev_int];
		log_string=[log_string phase_acum_prev_int*(2^5)];

        phase_delta_int=phase_demod_acum_int0-phase_acum_prev_int*(2^5);
                      
        log_string=[log_string phase_delta_int];
        phase_delta_int_short=floor(phase_delta_int/(2^(ACUM_SIZE-8-1+1)));

%         phase_delta_int_short=floor(phase_delta_int/(2^(ACUM_SIZE-8-1)));

        
%         if (phase_delta_int_short>255)
%             phase_delta_int_short=255;
%         elseif phase_delta_int_short<-255
%             phase_delta_int_short=-255;
%         end
        
        if (phase_delta_int_short>255) %% !!!!! Must be better!
                phase_delta_int_short=bitand(phase_delta_int_short,255);
        elseif (phase_delta_int_short<-256)
                phase_delta_int_short=256-bitand(abs(phase_delta_int_short),255);
        end;



        log_string=[log_string phase_delta_int_short];
           %%%%%%%%%
% phase_demod_fi_matlab=[];
% phase_demod_fi_my=[];
           

            if (phase_delta_int_short>Fi_porog_int/2)
               cccc=1;
               val_dec_m=demodulate(demod_engine,exp(1i*cccc*2*Fi_porog+1i*val_angle_back)); % ������ ��������� ������ ��� �������� �� ���������� ����               
               phase_demod_fi_matlab=[phase_demod_fi_matlab angle( exp(1i*cccc*2*Fi_porog+1i*val_angle_back) )];
               phase_demod_acum_demod=val_angle_int+Fi_porog_int;                               
               phase_dem(zd)=phase_demod_acum_demod;
               phase_demod_fi_my=[phase_demod_fi_my phase_dem(zd)];
            elseif (phase_delta_int_short<-Fi_porog_int/2)
               cccc=-1;
               val_dec_m=demodulate(demod_engine,exp(1i*cccc*2*Fi_porog+1i*val_angle_back));
               phase_demod_fi_matlab=[phase_demod_fi_matlab angle( exp(1i*cccc*2*Fi_porog+1i*val_angle_back) )];
               phase_demod_acum_demod=val_angle_int-Fi_porog_int;
               phase_dem(zd)=phase_demod_acum_demod;
               phase_demod_fi_my=[phase_demod_fi_my phase_dem(zd)];
            else
                cccc=0;
                val_dec_m=demodulate(demod_engine,exp(1i*cccc*2*Fi_porog+1i*val_angle_back));
                phase_demod_fi_matlab=[phase_demod_fi_matlab angle( exp(1i*cccc*2*Fi_porog+1i*val_angle_back) )];
                phase_demod_acum_demod=val_angle_int;                
                phase_dem(zd)=val_angle_int;
                phase_demod_fi_my=[phase_demod_fi_my phase_dem(zd)];
            end
          log_string=[log_string cccc];
                
           val_dec=demodulate(demod_engine,exp(1i*(phase_demod_acum_demod/(2^7)) ));
%          val_dec=val_dec_m;

             phase_demod_acum_int0=phase_demod_acum_int0-2*cccc*floor(100.5*(2^(ACUM_SIZE-(Nbit-1))));
%             phase_demod_acum_int0=floor(phase_demod_acum_int0/2)-2*cccc*floor(100.5*(2^9));
%             phase_demod_acum_int0=phase_demod_acum_int0*2;
            

          log_string=[log_string phase_demod_acum_int0];
          
            loglines_int=[loglines_int; log_string];
            log_string=[];

        
        pilot_phases2=[pilot_phases2 cccc];

         phase_acum_prev=phase_acum;
         phase_acum_prev_int=phase_acum_int;
         pilot_phases=[pilot_phases phase_demod_acum_int0];
        
        mass=[mass val_dec];
    end







    mass2=[mass2 mass];



%%
lfsr_2bit_b=(de2bi(mass2,2));
a=reshape((lfsr_2bit_b).',1,[]);
figure_handle = figure;
h1=subplot(5,1,1);
testb=m_test_lfsr(a, fliplr(de2bi(hex2dec('8000000D'),32))  );
plot(testb);
h2=subplot(5,1,2);
plot(reshape(repmat(mass2,floor(InterpolateRate/2),1),1,[])+5)
h3=subplot(5,1,3);
plot(pilot_phases);
h4=subplot(5,1,4);
plot(pilot_phases2);
h5=subplot(5,1,5);
plot(phase_dem);

fprintf('Errors is %i\n',sum(bitxor(testb,1)));

% linkaxes([h1 h2 h3 h4 h5],'x');

%%
% find(loglines_int(:,1)==-1934);
% find(real(data_transfer_filtdata_int_pre)==-1934);
% 
 loglines_int2=loglines_int(1:end,:);

%  loglines_int3(:,1)=loglines_int2(:,1); % real sample
%  loglines_int3(:,2)=loglines_int2(:,2); % in_val_phase_int0 = sample_phase
%%
% figure;
% plot(phase_demod_fi_my);
% hold on;
% plot(phase_demod_fi_matlab*128,'r');