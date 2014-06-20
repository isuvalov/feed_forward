

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

FILTLEN=32;
Nbit=16;
NN=(2^Nbit-1)-1;
M=4;
filt_x=[-0.00248011434398765,0.000241082753971028,0.00142015928202371,0.00354294733660859,0.00673584804482275,0.0110766542799096,0.0165655655252312,0.0230977826504043,0.0304661296987172,0.0383557265429229,0.0463686553822167,0.0540493984005852,0.0609207886287765,0.0665400621566358,0.0705174819169700,0.0725818317441924,0.0725818317441924,0.0705174819169700,0.0665400621566358,0.0609207886287765,0.0540493984005852,0.0463686553822167,0.0383557265429229,0.0304661296987172,0.0230977826504043,0.0165655655252312,0.0110766542799096,0.00673584804482275,0.00354294733660859,0.00142015928202371,0.000241082753971028,-0.00248011434398765];
mod_engine=modem.pskmod('M',M,'PhaseOffset', pi/4 );
demod_engine=modem.pskdemod('M',M,'PhaseOffset', pi/4);
Fi_porog=abs(angle(modulate(mod_engine,0))-angle(modulate(mod_engine,1)))/2;

%Fi_porog_re=round(real(exp(1i*Fi_porog))*NN);
%Fi_porog_im=round(imag(exp(1i*Fi_porog))*NN);


% phase_demod_acum_x=pcp_a_int;
% phase_acum_prev_x=pcp_a_int;
% mass=[];
% filt_array_x=phase_demod_acum_x.*ones(1,FILTLEN);

% pcp_a=angle(pcp_a_int);

% phase_demod_acum=pcp_a; % инициализируем аккомулятор фазы посчитанным значением фазы пилот сигнала
% phase_demod_acum_x=exp(1i*pcp_a);

mass=[];
load start_vals.mat
%    phase_demod_acum=pcp_a; % инициализируем аккомулятор фазы посчитанным значением фазы пилот сигнала
%    phase_demod_acum_x=pcp;
%    phase_acum_prev=pcp_a;
%    phase_acum_prev_x=exp(1i*pcp_a);
%    phase_acum=pcp_a/alpha1;

