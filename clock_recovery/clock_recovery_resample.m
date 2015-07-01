clc
BERs=3:20;
BERs=379;
rats_array=[];
fd=200;      % �������� ������� ���/���
% pilot_len=250;  % ����� �������� �� �������� ������������ ���������� � �����
pilot_len=64;  % ����� �������� �� �������� ������������ ���������� � �����
InterpolateRate=4;
PilotsNum=1; % ���������� ������ � �������� ��� ��������� ������� 
tdelay=2000;        % ����� ��������� ���������� ������� ����� ����� ���������
% tlen=PilotsNum*(2*tdelay+pilot_len*InterpolateRate); %201000; % ����� ���� ��������
tlen=(PilotsNum)*(tdelay+pilot_len); %201000; % ����� ���� ��������
alpha1=0.2;      % ����������� ����������, ��� �� ������ ��� ������ ����������
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

T=InterpolateRate/2; % �.�. ������� ����� ������� fd/InterpolateRate

t=(-9:1/T:9);
%% SQRT Raised Cosine
hsqrt=4*R*(  cos((1+R)*pi.*t/T) + sin((1-R).*pi.*t/T)./(4*R.*t/T)  ) ./ (pi*sqrt(T).*(1-(4*R.*t/T).*(4*R.*t/T)) ); % sqrt SQRT Raised Cosine
hsqrt_max=(pi+4*R-pi*R)/(pi*sqrt(T));
hsqrt=hsqrt./hsqrt_max;
hsqrt(round(length(hsqrt)/2))=1;
hsqrt(14)=-0.1888; % ��������� ��� R=0.2
hsqrt(24)=-0.1888; % ��������� ��� R=0.2

% hsqrt=sinc(t/T).*( cos(pi*R*t/T) ) ./ ( 1-4*R*R.*t.*t./(T*T) );  % normal Raised Cosine
% hsqrt=hsqrt/max(hsqrt);
% hsqrt_one=[zeros(1,floor(length(hsqrt)/2)) 100 zeros(1,floor(length(hsqrt)/2)+1)];
% hsqrt_one=hsqrt_one(1:length(hsqrt));
hsqrt_one=hsqrt;

%% Make pilot symbol
some=reshape(hadamard(2^ceil(log2(sqrt(pilot_len)))),1,[]);   % ����������� �����-�� ������ �� +/-1
pilot=some(1:pilot_len)+1i*some(1:pilot_len);


s_transfer=[];
values_all=[];
BERval=BERs;
%% Transimeter ������ ������� �� ���������� �������
x=[];
for z=1:N
    if tdelay>0
        values=randint(1,tdelay,M);

		values_all=[values_all values];
        x=modulate(mod_engine,values); % ��������� PAM
    end
	s_transfer=[s_transfer pilot x];
end
%          s_transfer=[pilot modulate(mod_engine,repmat([0 1 2 3 0 1 2 3],1,floor(tdelay/8)))];
%  s_transfer=[pilot modulate(mod_engine,repmat([0 6 2 4 3 5 1 7],1,floor(tdelay/8)))];


s_transfer_filt1=zeros(1,length(s_transfer)*InterpolateRate);
s_transfer_filt1(1:InterpolateRate:end)=s_transfer;  % ����������� ������ ��� �����������
s_transfer_filt1=conv(s_transfer_filt1,hsqrt); % ����������� ������
s_transfer_filt1=s_transfer_filt1(floor(length(hsqrt)/2):end-floor(length(hsqrt)/2));


pilotUP=zeros(1,length(pilot)*InterpolateRate);
pilotUP(1:InterpolateRate:end)=pilot;
pilotUP=conv(pilotUP,hsqrt);
cut_f_l=floor(length(hsqrt)/2);
pilotUP=pilotUP(cut_f_l:end-cut_f_l-1); % ����������� ������ �� ��������
pilotUP=conv(pilotUP,hsqrt);
pilotUP=pilotUP(cut_f_l:end-cut_f_l-1); % ����������� ������ �� ������
%%%%%%%%
% ������ ���� pilotUP_n*conj(pilotUP_n).'==1
%   ������� ���������� pilotUP !!!!!!!!!!!!!!!
%%%%%%%%
% pilotUP=pilotUP./norm(pilotUP);



tlen=length(s_transfer_filt1);
t3=0:1/fd:tlen/fd-1/fd;

tframelen=(pilot_len+tdelay)*InterpolateRate;
t4=0:1/fd:tframelen/fd-1/fd;

%% Chanell ��������� �������� ��� � ����� �� �������
    % ��� ��������� ������� ���� �� ������ -90dB
%  	rx_transfer=s_transfer_filt1.*exp(1i*t3*FreqOffset*2*pi+(0.1/fd)*randn(1,length(s_transfer_filt1)));
rx_transfer=s_transfer_filt1;%.*exp(1i*t3*FreqOffset*2*pi);      
%  rx_transfer=rx_transfer.*exp(1i*pi/8);
 	rx_transfer = awgn(rx_transfer,BERval,'measured');  





%% Receiver  �����

rx_transfer_filt=conv(rx_transfer,hsqrt_one); % ������ �� ������
rx_transfer_filt=rx_transfer_filt(cut_f_l:end-cut_f_l);
rx_transfer_filt=rx_transfer_filt./max(real(rx_transfer_filt));

rx_transfer_filt=[rx_transfer_filt];
rx_transfer_filt_up=resample(rx_transfer_filt,3,1);
rx_transfer_filt=rx_transfer_filt_up(2:3:end);
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
% timeshift=mean(angle(rx_transfer_filt(1:length(pilotUP)-2*cut_f_l).*conj(pilotUP(1:end-2*cut_f_l))));

%% Shiftit
sigout=zeros(1,ceil(length(rx_transfer_filt)/InterpolateRate));

zzd=1; mu_a=[];
for zd=length(pilotUP):length(rx_transfer_filt)-20
    
    magnetude=abs(rx_transfer_filt(zd))^2;
    
     phase_st=mod((2*pi/M)+phase_st,2*pi); %# pi/2 because PSK-4
    
    
     resignal=(magnetude)*exp(minusof_j*1i*phase_st);
%       resignal=20*exp(1i*phase_st);

    CIC_first=resignal-CICz(2^CIC_degree);
    CICz=[resignal CICz(1:(2^CIC_degree)-1)];
    
    CIC_second=CIC_first+CIC_second_prev;
    CIC_end=CIC_second_prev/(2^CIC_degree);
    CIC_second_prev=CIC_second;    
    
    angle_of_CIC=angle(CIC_end)+phase_st;
    angle_of_CICmod=mod(angle_of_CIC,2*pi);    
    angle_of_CICmod=angle_of_CICmod-pi;    
    
    mu_current=mod(angle_of_CICmod,2*pi/PSK_SIZE)*(PSK_SIZE)/(2*pi);
    
    fir_acum=fir_acum*(1-alpha_delta)+mu_current;    
    mu=fir_acum*alpha_delta;
    
    mu_a=[mu_a mu];
%     mu=0.5;%pcp_a;
    farrow_a=[rx_transfer_filt(zd); farrow_a(1:3)];
    farrow_m1=farrow_a.*([1/6 -1/2 1/2 -1/6].'*(1));
    farrow_m2=farrow_a.*([0 1/2 -1 1/2].');
    farrow_m3=farrow_a.*([-1/6 1 -1/2 -1/3].');
    farrow_m4=farrow_a.*([0 0 1 0].');
    
    f01=sum(farrow_m1)*mu;
    f02=(sum(farrow_m2)+f01)*mu;
    f03=(sum(farrow_m3)+f02)*mu;
    f04=(sum(farrow_m4)+f03)*mu;
    if (mod(zd,InterpolateRate)==0)
        sigout(zzd)=f04/1e9;%rx_transfer_filt(zd)*exp(-1i*pcp_a); %f04*1000;
        zzd=zzd+1;
    end;
end
scatterplot(sigout(end/2:end));